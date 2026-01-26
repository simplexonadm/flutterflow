import { PrismaClient, Block as PrismaBlock, Edge as PrismaEdge } from '@prisma/client';

const prisma = new PrismaClient();

/**
 * Converter Block do Prisma para formato do frontend
 */
function convertBlockToFrontend(block: PrismaBlock) {
  return {
    id: block.id,
    type: block.type as any,
    position: {
      x: block.positionX,
      y: block.positionY,
    },
    config: {
      message: block.message || undefined,
      question: block.question || undefined,
      variableName: block.variableName || undefined,
      placeholder: block.placeholder || undefined,
      options: block.options ? JSON.parse(block.options) : undefined,
      conditionVariable: block.conditionVariable || undefined,
      conditionValue: block.conditionValue || undefined,
    },
  };
}

/**
 * Converter Edge do Prisma para formato do frontend
 */
function convertEdgeToFrontend(edge: PrismaEdge) {
  return {
    id: edge.id,
    source: edge.source,
    target: edge.target,
    label: edge.label || undefined,
  };
}

export interface CreateChatbotData {
  name: string;
  userId: string;
}

export interface UpdateChatbotData {
  name?: string;
  isPublished?: boolean;
  primaryColor?: string;
  themeMode?: string;
  buttonPosition?: string;
  buttonText?: string;
  avatar?: string;
}

export class ChatbotService {
  /**
   * Listar todos os chatbots de um usuário
   */
  static async getUserChatbots(userId: string) {
    const chatbots = await prisma.chatbot.findMany({
      where: { userId },
      include: {
        blocks: true,
        edges: true,
        _count: {
          select: { leads: true },
        },
      },
      orderBy: { updatedAt: 'desc' },
    });

    // Converter para formato do frontend
    return chatbots.map((chatbot) => ({
      id: chatbot.id,
      name: chatbot.name,
      createdAt: chatbot.createdAt.toISOString(),
      updatedAt: chatbot.updatedAt.toISOString(),
      isPublished: chatbot.isPublished,
      theme: {
        primaryColor: chatbot.primaryColor,
        mode: chatbot.themeMode as 'light' | 'dark',
        buttonPosition: chatbot.buttonPosition as 'left' | 'right',
        buttonText: chatbot.buttonText,
        avatar: chatbot.avatar,
      },
      blocks: chatbot.blocks.map(convertBlockToFrontend),
      edges: chatbot.edges.map(convertEdgeToFrontend),
      _count: chatbot._count,
    }));
  }

  /**
   * Obter chatbot específico (com validação de ownership)
   */
  static async getChatbotById(chatbotId: string, userId: string) {
    const chatbot = await prisma.chatbot.findFirst({
      where: {
        id: chatbotId,
        userId, // Garante que só retorna se for do usuário
      },
      include: {
        blocks: true,
        edges: true,
        leads: {
          include: {
            answers: true,
          },
        },
      },
    });

    if (!chatbot) {
      throw new Error('Chatbot não encontrado');
    }

    // Converter para formato do frontend
    return {
      id: chatbot.id,
      name: chatbot.name,
      createdAt: chatbot.createdAt.toISOString(),
      updatedAt: chatbot.updatedAt.toISOString(),
      isPublished: chatbot.isPublished,
      theme: {
        primaryColor: chatbot.primaryColor,
        mode: chatbot.themeMode as 'light' | 'dark',
        buttonPosition: chatbot.buttonPosition as 'left' | 'right',
        buttonText: chatbot.buttonText,
        avatar: chatbot.avatar,
      },
      blocks: chatbot.blocks.map(convertBlockToFrontend),
      edges: chatbot.edges.map(convertEdgeToFrontend),
      leads: chatbot.leads.map((lead) => ({
        id: lead.id,
        chatbotId: lead.chatbotId,
        startedAt: lead.startedAt.toISOString(),
        completedAt: lead.completedAt?.toISOString(),
        status: lead.status.toLowerCase() as 'started' | 'completed' | 'abandoned',
        answers: lead.answers.reduce((acc, answer) => {
          acc[answer.variableName] = answer.value;
          return acc;
        }, {} as Record<string, string>),
        metadata: {
          pageUrl: lead.pageUrl || '',
          userAgent: lead.userAgent || '',
        },
      })),
    };
  }

  /**
   * Obter chatbot público (sem autenticação)
   */
  static async getPublicChatbot(chatbotId: string) {
    const chatbot = await prisma.chatbot.findUnique({
      where: { id: chatbotId },
      include: {
        blocks: true,
        edges: true,
      },
    });

    if (!chatbot) {
      throw new Error('Chatbot não encontrado');
    }

    if (!chatbot.isPublished) {
      throw new Error('Chatbot não está publicado');
    }

    // Converter para formato do frontend
    return {
      id: chatbot.id,
      name: chatbot.name,
      createdAt: chatbot.createdAt.toISOString(),
      updatedAt: chatbot.updatedAt.toISOString(),
      isPublished: chatbot.isPublished,
      theme: {
        primaryColor: chatbot.primaryColor,
        mode: chatbot.themeMode as 'light' | 'dark',
        buttonPosition: chatbot.buttonPosition as 'left' | 'right',
        buttonText: chatbot.buttonText,
        avatar: chatbot.avatar,
      },
      blocks: chatbot.blocks.map(convertBlockToFrontend),
      edges: chatbot.edges.map(convertEdgeToFrontend),
    };
  }

  /**
   * Criar novo chatbot com template padrão
   */
  static async createChatbot(data: CreateChatbotData) {
    // Verificar se já existe chatbot com mesmo nome para o usuário
    const existing = await prisma.chatbot.findFirst({
      where: {
        name: data.name,
        userId: data.userId,
      },
    });

    if (existing) {
      throw new Error('Já existe um chatbot com este nome');
    }

    // Criar chatbot com bloco inicial
    const chatbot = await prisma.chatbot.create({
      data: {
        name: data.name,
        userId: data.userId,
        blocks: {
          create: {
            type: 'start',
            positionX: 100,
            positionY: 100,
            message: 'Olá! Bem-vindo ao nosso chatbot.',
          },
        },
      },
      include: {
        blocks: true,
        edges: true,
      },
    });

    // Converter para formato do frontend
    return {
      id: chatbot.id,
      name: chatbot.name,
      createdAt: chatbot.createdAt.toISOString(),
      updatedAt: chatbot.updatedAt.toISOString(),
      isPublished: chatbot.isPublished,
      theme: {
        primaryColor: chatbot.primaryColor,
        mode: chatbot.themeMode as 'light' | 'dark',
        buttonPosition: chatbot.buttonPosition as 'left' | 'right',
        buttonText: chatbot.buttonText,
        avatar: chatbot.avatar,
      },
      blocks: chatbot.blocks.map(convertBlockToFrontend),
      edges: chatbot.edges.map(convertEdgeToFrontend),
    };
  }

  /**
   * Atualizar chatbot
   */
  static async updateChatbot(
    chatbotId: string,
    userId: string,
    data: UpdateChatbotData
  ) {
    // Verificar ownership
    const chatbot = await this.getChatbotById(chatbotId, userId);

    // Se está mudando o nome, verificar duplicatas
    if (data.name && data.name !== chatbot.name) {
      const existing = await prisma.chatbot.findFirst({
        where: {
          name: data.name,
          userId,
          id: { not: chatbotId },
        },
      });

      if (existing) {
        throw new Error('Já existe um chatbot com este nome');
      }
    }

    // Atualizar
    const updated = await prisma.chatbot.update({
      where: { id: chatbotId },
      data,
      include: {
        blocks: true,
        edges: true,
      },
    });

    // Converter para formato do frontend
    return {
      id: updated.id,
      name: updated.name,
      createdAt: updated.createdAt.toISOString(),
      updatedAt: updated.updatedAt.toISOString(),
      isPublished: updated.isPublished,
      theme: {
        primaryColor: updated.primaryColor,
        mode: updated.themeMode as 'light' | 'dark',
        buttonPosition: updated.buttonPosition as 'left' | 'right',
        buttonText: updated.buttonText,
        avatar: updated.avatar,
      },
      blocks: updated.blocks.map(convertBlockToFrontend),
      edges: updated.edges.map(convertEdgeToFrontend),
    };
  }

  /**
   * Deletar chatbot
   */
  static async deleteChatbot(chatbotId: string, userId: string) {
    // Verificar ownership
    await this.getChatbotById(chatbotId, userId);

    // Deletar (cascade vai deletar blocks, edges e leads)
    await prisma.chatbot.delete({
      where: { id: chatbotId },
    });

    return { message: 'Chatbot deletado com sucesso' };
  }

  /**
   * Publicar chatbot
   */
  static async publishChatbot(chatbotId: string, userId: string) {
    // Verificar ownership
    const chatbot = await this.getChatbotById(chatbotId, userId);

    // Validar que tem pelo menos um bloco
    if (chatbot.blocks.length === 0) {
      throw new Error('Chatbot precisa ter pelo menos um bloco para ser publicado');
    }

    // Publicar
    const published = await prisma.chatbot.update({
      where: { id: chatbotId },
      data: { isPublished: true },
      include: {
        blocks: true,
        edges: true,
      },
    });

    // Converter para formato do frontend
    return {
      id: published.id,
      name: published.name,
      createdAt: published.createdAt.toISOString(),
      updatedAt: published.updatedAt.toISOString(),
      isPublished: published.isPublished,
      theme: {
        primaryColor: published.primaryColor,
        mode: published.themeMode as 'light' | 'dark',
        buttonPosition: published.buttonPosition as 'left' | 'right',
        buttonText: published.buttonText,
        avatar: published.avatar,
      },
      blocks: published.blocks.map(convertBlockToFrontend),
      edges: published.edges.map(convertEdgeToFrontend),
    };
  }

  /**
   * Atualizar blocos e edges de um chatbot
   */
  static async updateChatbotContent(
    chatbotId: string,
    userId: string,
    blocks: any[],
    edges: any[]
  ) {
    // Verificar ownership
    await this.getChatbotById(chatbotId, userId);

    // Deletar blocos e edges existentes
    await prisma.block.deleteMany({
      where: { chatbotId },
    });

    await prisma.edge.deleteMany({
      where: { chatbotId },
    });

    // Criar novos blocos (converter formato frontend para Prisma)
    if (blocks.length > 0) {
      await prisma.block.createMany({
        data: blocks.map((block) => ({
          id: block.id,
          chatbotId,
          type: block.type,
          positionX: block.position?.x || block.positionX || 0,
          positionY: block.position?.y || block.positionY || 0,
          message: block.config?.message || block.message || null,
          question: block.config?.question || block.question || null,
          variableName: block.config?.variableName || block.variableName || null,
          placeholder: block.config?.placeholder || block.placeholder || null,
          options: block.config?.options ? JSON.stringify(block.config.options) : block.options || null,
          conditionVariable: block.config?.conditionVariable || block.conditionVariable || null,
          conditionValue: block.config?.conditionValue || block.conditionValue || null,
        })),
      });
    }

    // Criar novos edges (converter formato frontend para Prisma)
    if (edges.length > 0) {
      await prisma.edge.createMany({
        data: edges.map((edge) => ({
          id: edge.id,
          chatbotId,
          source: edge.source,
          target: edge.target,
          label: edge.label || null,
        })),
      });
    }

    // Retornar chatbot atualizado
    return this.getChatbotById(chatbotId, userId);
  }

  /**
   * Adicionar bloco individual
   */
  static async createBlock(chatbotId: string, userId: string, data: any) {
    // Verificar ownership
    await this.getChatbotById(chatbotId, userId);

    const block = await prisma.block.create({
      data: {
        chatbotId,
        type: data.type,
        positionX: data.position?.x || 0,
        positionY: data.position?.y || 0,
        message: data.config?.message || null,
        question: data.config?.question || null,
        variableName: data.config?.variableName || null,
        placeholder: data.config?.placeholder || null,
        options: data.config?.options ? JSON.stringify(data.config.options) : null,
        conditionVariable: data.config?.conditionVariable || null,
        conditionValue: data.config?.conditionValue || null,
      },
    });

    return convertBlockToFrontend(block);
  }

  /**
   * Atualizar bloco individual
   */
  static async updateBlock(blockId: string, chatbotId: string, userId: string, data: any) {
    // Verificar ownership do chatbot
    await this.getChatbotById(chatbotId, userId);

    // Verificar se bloco pertence ao chatbot
    const existingBlock = await prisma.block.findFirst({
      where: { id: blockId, chatbotId },
    });

    if (!existingBlock) {
      throw new Error('Bloco não encontrado neste chatbot');
    }

    const updated = await prisma.block.update({
      where: { id: blockId },
      data: {
        type: data.type,
        positionX: data.position?.x ?? undefined,
        positionY: data.position?.y ?? undefined,
        message: data.config?.message ?? undefined,
        question: data.config?.question ?? undefined,
        variableName: data.config?.variableName ?? undefined,
        placeholder: data.config?.placeholder ?? undefined,
        options: data.config?.options ? JSON.stringify(data.config.options) : undefined,
        conditionVariable: data.config?.conditionVariable ?? undefined,
        conditionValue: data.config?.conditionValue ?? undefined,
      },
    });

    return convertBlockToFrontend(updated);
  }

  /**
   * Deletar bloco individual
   */
  static async deleteBlock(blockId: string, chatbotId: string, userId: string) {
    // Verificar ownership do chatbot
    await this.getChatbotById(chatbotId, userId);

    // Verificar se bloco pertence ao chatbot
    const existingBlock = await prisma.block.findFirst({
      where: { id: blockId, chatbotId },
    });

    if (!existingBlock) {
      throw new Error('Bloco não encontrado neste chatbot');
    }

    await prisma.block.delete({
      where: { id: blockId },
    });

    return { message: 'Bloco deletado com sucesso' };
  }

  /**
   * Adicionar edge individual
   */
  static async createEdge(chatbotId: string, userId: string, data: any) {
    // Verificar ownership do chatbot
    await this.getChatbotById(chatbotId, userId);

    // Verificar se blocos existem
    const blocks = await prisma.block.findMany({
      where: {
        id: { in: [data.source, data.target] },
        chatbotId,
      },
    });

    if (blocks.length < 2 && data.source !== data.target) {
      throw new Error('Blocos de origem ou destino não encontrados');
    }

    const edge = await prisma.edge.create({
      data: {
        chatbotId,
        source: data.source,
        target: data.target,
        label: data.label || null,
      },
    });

    return convertEdgeToFrontend(edge);
  }

  /**
   * Deletar edge individual
   */
  static async deleteEdge(edgeId: string, chatbotId: string, userId: string) {
    // Verificar ownership do chatbot
    await this.getChatbotById(chatbotId, userId);

    // Verificar se edge pertence ao chatbot
    const existingEdge = await prisma.edge.findFirst({
      where: { id: edgeId, chatbotId },
    });

    if (!existingEdge) {
      throw new Error('Conexão não encontrada neste chatbot');
    }

    await prisma.edge.delete({
      where: { id: edgeId },
    });

    return { message: 'Conexão deletada com sucesso' };
  }
}
