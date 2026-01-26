import { PrismaClient, LeadStatus } from '@prisma/client';

const prisma = new PrismaClient();

export interface ChatbotMetrics {
  totalLeads: number;
  completedLeads: number;
  abandonedLeads: number;
  startedLeads: number;
  completionRate: number;
  leadsByDay: {
    date: string;
    count: number;
  }[];
}

export class MetricsService {
  /**
   * Obter métricas de um chatbot
   */
  static async getChatbotMetrics(chatbotId: string, userId: string): Promise<ChatbotMetrics> {
    // Verificar ownership
    const chatbot = await prisma.chatbot.findFirst({
      where: { id: chatbotId, userId },
    });

    if (!chatbot) {
      throw new Error('Chatbot não encontrado ou acesso negado');
    }

    // Buscar todos os leads do chatbot
    const leads = await prisma.lead.findMany({
      where: { chatbotId },
      select: {
        status: true,
        startedAt: true,
      },
    });

    const totalLeads = leads.length;
    const completedLeads = leads.filter(l => l.status === LeadStatus.COMPLETED).length;
    const abandonedLeads = leads.filter(l => l.status === LeadStatus.ABANDONED).length;
    const startedLeads = leads.filter(l => l.status === LeadStatus.STARTED).length;

    const completionRate = totalLeads > 0 ? (completedLeads / totalLeads) * 100 : 0;

    // Agrupar por dia (últimos 30 dias)
    const thirtyDaysAgo = new Date();
    thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);

    const leadsInLast30Days = leads.filter(l => new Date(l.startedAt) >= thirtyDaysAgo);

    const dailyCounts: Record<string, number> = {};

    // Inicializar os últimos 30 dias com zero
    for (let i = 0; i < 30; i++) {
      const d = new Date();
      d.setDate(d.getDate() - i);
      const dateStr = d.toISOString().split('T')[0];
      dailyCounts[dateStr] = 0;
    }

    leadsInLast30Days.forEach(lead => {
      const dateStr = new Date(lead.startedAt).toISOString().split('T')[0];
      if (dailyCounts[dateStr] !== undefined) {
        dailyCounts[dateStr]++;
      }
    });

    const leadsByDay = Object.entries(dailyCounts)
      .map(([date, count]) => ({ date, count }))
      .sort((a, b) => a.date.localeCompare(b.date));

    return {
      totalLeads,
      completedLeads,
      abandonedLeads,
      startedLeads,
      completionRate,
      leadsByDay,
    };
  }
}
