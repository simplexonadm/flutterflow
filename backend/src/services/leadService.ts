import { LeadStatus } from '@prisma/client';
import prisma from '../lib/prisma';

export interface CreateLeadData {
  chatbotId: string;
  pageUrl?: string;
  userAgent?: string;
}

export interface UpdateLeadData {
  status?: LeadStatus;
  answers: Record<string, string>;
}

export interface LeadFilters {
  status?: LeadStatus;
  search?: string;
  page?: number;
  limit?: number;
}

export class LeadService {
  /**
   * Criar um novo lead (início de conversa)
   */
  static async createLead(data: CreateLeadData) {
    // Verificar se chatbot existe e está publicado
    const chatbot = await prisma.chatbot.findUnique({
      where: { id: data.chatbotId },
    });

    if (!chatbot) {
      throw new Error('Chatbot não encontrado');
    }

    if (!chatbot.isPublished) {
      throw new Error('Chatbot não está publicado');
    }

    const lead = await prisma.lead.create({
      data: {
        chatbotId: data.chatbotId,
        status: LeadStatus.STARTED,
        pageUrl: data.pageUrl,
        userAgent: data.userAgent,
      },
    });

    return lead;
  }

  /**
   * Atualizar respostas e status do lead
   */
  static async updateLead(leadId: string, chatbotId: string, data: UpdateLeadData) {
    // Verificar se lead existe e pertence ao chatbot
    const lead = await prisma.lead.findFirst({
      where: { id: leadId, chatbotId },
    });

    if (!lead) {
      throw new Error('Lead não encontrado');
    }

    // Se estiver marcando como COMPLETED, setar completedAt
    const updateData: any = {
      status: data.status,
      updatedAt: new Date(),
    };

    if (data.status === LeadStatus.COMPLETED && !lead.completedAt) {
      updateData.completedAt = new Date();
    }

    // Atualizar status do lead
    const updatedLead = await prisma.lead.update({
      where: { id: leadId },
      data: updateData,
    });

    // Salvar/Atualizar respostas
    const answerPromises = Object.entries(data.answers).map(async ([variableName, value]) => {
      const existing = await prisma.leadAnswer.findFirst({
        where: { leadId, variableName }
      });

      if (existing) {
        return prisma.leadAnswer.update({
          where: { id: existing.id },
          data: { value }
        });
      } else {
        return prisma.leadAnswer.create({
          data: { leadId, variableName, value }
        });
      }
    });

    await Promise.all(answerPromises);

    return updatedLead;
  }

  /**
   * Listar leads de um chatbot
   */
  static async getChatbotLeads(chatbotId: string, userId: string, filters: LeadFilters) {
    // Verificar ownership do chatbot
    const chatbot = await prisma.chatbot.findFirst({
      where: { id: chatbotId, userId },
    });

    if (!chatbot) {
      throw new Error('Chatbot não encontrado ou acesso negado');
    }

    const page = filters.page || 1;
    const limit = filters.limit || 50;
    const skip = (page - 1) * limit;

    const where: any = {
      chatbotId,
    };

    if (filters.status) {
      where.status = filters.status;
    }

    if (filters.search) {
      where.answers = {
        some: {
          value: {
            contains: filters.search,
            mode: 'insensitive',
          },
        },
      };
    }

    const [leads, total] = await Promise.all([
      prisma.lead.findMany({
        where,
        include: {
          answers: true,
        },
        orderBy: { startedAt: 'desc' },
        skip,
        take: limit,
      }),
      prisma.lead.count({ where }),
    ]);

    return {
      leads: leads.map(lead => ({
        id: lead.id,
        chatbotId: lead.chatbotId,
        startedAt: lead.startedAt,
        completedAt: lead.completedAt,
        status: lead.status,
        answers: lead.answers.reduce((acc, answer) => {
          acc[answer.variableName] = answer.value;
          return acc;
        }, {} as Record<string, string>),
        metadata: {
          pageUrl: lead.pageUrl,
          userAgent: lead.userAgent,
        },
      })),
      pagination: {
        total,
        page,
        limit,
        totalPages: Math.ceil(total / limit),
      },
    };
  }
}
