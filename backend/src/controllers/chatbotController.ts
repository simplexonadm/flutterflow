import { Request, Response } from 'express';
import { ChatbotService } from '../services/chatbotService';
import { AuthRequest } from '../types/index';
import { body, validationResult, param } from 'express-validator';

/**
 * GET /api/chatbots
 * Listar chatbots do usuário
 */
export const getChatbots = async (req: AuthRequest, res: Response) => {
  try {
    if (!req.userId) {
      return res.status(401).json({ error: 'Não autenticado' });
    }

    const chatbots = await ChatbotService.getUserChatbots(req.userId);

    return res.status(200).json({ chatbots });
  } catch (error: any) {
    return res.status(500).json({ error: 'Erro ao listar chatbots' });
  }
};

/**
 * GET /api/chatbots/:id
 * Obter chatbot específico
 */
export const getChatbot = async (req: AuthRequest, res: Response) => {
  try {
    if (!req.userId) {
      return res.status(401).json({ error: 'Não autenticado' });
    }

    const { id } = req.params;
    const chatbot = await ChatbotService.getChatbotById(id, req.userId);

    return res.status(200).json({ chatbot });
  } catch (error: any) {
    if (error.message === 'Chatbot não encontrado') {
      return res.status(404).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao buscar chatbot' });
  }
};

/**
 * POST /api/chatbots
 * Criar novo chatbot
 */
export const createChatbot = async (req: AuthRequest, res: Response) => {
  try {
    // Validar input
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    if (!req.userId) {
      return res.status(401).json({ error: 'Não autenticado' });
    }

    const { name } = req.body;

    const chatbot = await ChatbotService.createChatbot({
      name,
      userId: req.userId,
    });

    return res.status(201).json({
      message: 'Chatbot criado com sucesso',
      chatbot,
    });
  } catch (error: any) {
    if (error.message === 'Já existe um chatbot com este nome') {
      return res.status(400).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao criar chatbot' });
  }
};

/**
 * PUT /api/chatbots/:id
 * Atualizar chatbot
 */
export const updateChatbot = async (req: AuthRequest, res: Response) => {
  try {
    // Validar input
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    if (!req.userId) {
      return res.status(401).json({ error: 'Não autenticado' });
    }

    const { id } = req.params;
    const updateData = req.body;

    const chatbot = await ChatbotService.updateChatbot(id, req.userId, updateData);

    return res.status(200).json({
      message: 'Chatbot atualizado com sucesso',
      chatbot,
    });
  } catch (error: any) {
    if (error.message === 'Chatbot não encontrado') {
      return res.status(404).json({ error: error.message });
    }
    if (error.message === 'Já existe um chatbot com este nome') {
      return res.status(400).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao atualizar chatbot' });
  }
};

/**
 * DELETE /api/chatbots/:id
 * Deletar chatbot
 */
export const deleteChatbot = async (req: AuthRequest, res: Response) => {
  try {
    if (!req.userId) {
      return res.status(401).json({ error: 'Não autenticado' });
    }

    const { id } = req.params;
    await ChatbotService.deleteChatbot(id, req.userId);

    return res.status(200).json({
      message: 'Chatbot deletado com sucesso',
    });
  } catch (error: any) {
    if (error.message === 'Chatbot não encontrado') {
      return res.status(404).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao deletar chatbot' });
  }
};

/**
 * POST /api/chatbots/:id/publish
 * Publicar chatbot
 */
export const publishChatbot = async (req: AuthRequest, res: Response) => {
  try {
    if (!req.userId) {
      return res.status(401).json({ error: 'Não autenticado' });
    }

    const { id } = req.params;
    const chatbot = await ChatbotService.publishChatbot(id, req.userId);

    return res.status(200).json({
      message: 'Chatbot publicado com sucesso',
      chatbot,
    });
  } catch (error: any) {
    if (error.message === 'Chatbot não encontrado') {
      return res.status(404).json({ error: error.message });
    }
    if (error.message.includes('precisa ter pelo menos um bloco')) {
      return res.status(400).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao publicar chatbot' });
  }
};

/**
 * GET /api/chatbots/:id/public
 * Obter chatbot público (sem autenticação)
 */
export const getPublicChatbot = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const chatbot = await ChatbotService.getPublicChatbot(id);

    return res.status(200).json({ chatbot });
  } catch (error: any) {
    if (error.message === 'Chatbot não encontrado') {
      return res.status(404).json({ error: error.message });
    }
    if (error.message === 'Chatbot não está publicado') {
      return res.status(403).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao buscar chatbot' });
  }
};

/**
 * PUT /api/chatbots/:id/content
 * Atualizar blocos e edges do chatbot
 */
export const updateChatbotContent = async (req: AuthRequest, res: Response) => {
  try {
    // Validar input
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    if (!req.userId) {
      return res.status(401).json({ error: 'Não autenticado' });
    }

    const { id } = req.params;
    const { blocks, edges } = req.body;

    const chatbot = await ChatbotService.updateChatbotContent(
      id,
      req.userId,
      blocks || [],
      edges || []
    );

    return res.status(200).json({
      message: 'Conteúdo do chatbot atualizado com sucesso',
      chatbot,
    });
  } catch (error: any) {
    if (error.message === 'Chatbot não encontrado') {
      return res.status(404).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao atualizar conteúdo do chatbot' });
  }
};

/**
 * Validações para criar chatbot
 */
export const validateCreateChatbot = [
  body('name')
    .trim()
    .notEmpty()
    .withMessage('Nome é obrigatório')
    .isLength({ min: 1, max: 100 })
    .withMessage('Nome deve ter entre 1 e 100 caracteres'),
];

/**
 * Validações para atualizar chatbot
 */
export const validateUpdateChatbot = [
  param('id').isUUID().withMessage('ID inválido'),
  body('name')
    .optional()
    .trim()
    .isLength({ min: 1, max: 100 })
    .withMessage('Nome deve ter entre 1 e 100 caracteres'),
  body('isPublished').optional().isBoolean().withMessage('isPublished deve ser boolean'),
  body('primaryColor').optional().isString().withMessage('primaryColor deve ser string'),
  body('themeMode').optional().isIn(['light', 'dark']).withMessage('themeMode deve ser light ou dark'),
  body('buttonPosition').optional().isIn(['left', 'right']).withMessage('buttonPosition deve ser left ou right'),
  body('buttonText').optional().isString().isLength({ max: 50 }).withMessage('buttonText deve ter no máximo 50 caracteres'),
  body('avatar').optional().isString().isLength({ max: 10 }).withMessage('avatar deve ter no máximo 10 caracteres'),
];

/**
 * Validações para atualizar conteúdo
 */
export const validateUpdateContent = [
  param('id').isUUID().withMessage('ID inválido'),
  body('blocks').optional().isArray().withMessage('blocks deve ser um array'),
  body('edges').optional().isArray().withMessage('edges deve ser um array'),
];

/**
 * POST /api/chatbots/:id/blocks
 * Adicionar bloco individual
 */
export const addBlock = async (req: AuthRequest, res: Response) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    if (!req.userId) return res.status(401).json({ error: 'Não autenticado' });

    const { id } = req.params;
    const block = await ChatbotService.createBlock(id, req.userId, req.body);

    return res.status(201).json({ message: 'Bloco criado com sucesso', block });
  } catch (error: any) {
    if (error.message === 'Chatbot não encontrado') return res.status(404).json({ error: error.message });
    return res.status(500).json({ error: 'Erro ao criar bloco' });
  }
};

/**
 * PUT /api/chatbots/:id/blocks/:blockId
 * Atualizar bloco individual
 */
export const editBlock = async (req: AuthRequest, res: Response) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    if (!req.userId) return res.status(401).json({ error: 'Não autenticado' });

    const { id, blockId } = req.params;
    const block = await ChatbotService.updateBlock(blockId, id, req.userId, req.body);

    return res.status(200).json({ message: 'Bloco atualizado com sucesso', block });
  } catch (error: any) {
    if (error.message.includes('não encontrado')) return res.status(404).json({ error: error.message });
    return res.status(500).json({ error: 'Erro ao atualizar bloco' });
  }
};

/**
 * DELETE /api/chatbots/:id/blocks/:blockId
 * Deletar bloco individual
 */
export const removeBlock = async (req: AuthRequest, res: Response) => {
  try {
    if (!req.userId) return res.status(401).json({ error: 'Não autenticado' });

    const { id, blockId } = req.params;
    await ChatbotService.deleteBlock(blockId, id, req.userId);

    return res.status(200).json({ message: 'Bloco deletado com sucesso' });
  } catch (error: any) {
    if (error.message.includes('não encontrado')) return res.status(404).json({ error: error.message });
    return res.status(500).json({ error: 'Erro ao deletar bloco' });
  }
};

/**
 * Validações para Bloco
 */
export const validateBlock = [
  param('id').isUUID().withMessage('ID do chatbot inválido'),
  body('type').notEmpty().withMessage('Tipo do bloco é obrigatório'),
  body('position').optional().isObject().withMessage('Posição deve ser um objeto'),
  body('config').optional().isObject().withMessage('Configuração deve ser um objeto'),
];

/**
 * POST /api/chatbots/:id/edges
 * Adicionar edge individual
 */
export const addEdge = async (req: AuthRequest, res: Response) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    if (!req.userId) return res.status(401).json({ error: 'Não autenticado' });

    const { id } = req.params;
    const edge = await ChatbotService.createEdge(id, req.userId, req.body);

    return res.status(201).json({ message: 'Conexão criada com sucesso', edge });
  } catch (error: any) {
    if (error.message.includes('não encontrado')) return res.status(404).json({ error: error.message });
    return res.status(500).json({ error: 'Erro ao criar conexão' });
  }
};

/**
 * DELETE /api/chatbots/:id/edges/:edgeId
 * Deletar edge individual
 */
export const removeEdge = async (req: AuthRequest, res: Response) => {
  try {
    if (!req.userId) return res.status(401).json({ error: 'Não autenticado' });

    const { id, edgeId } = req.params;
    await ChatbotService.deleteEdge(edgeId, id, req.userId);

    return res.status(200).json({ message: 'Conexão deletada com sucesso' });
  } catch (error: any) {
    if (error.message.includes('não encontrada')) return res.status(404).json({ error: error.message });
    return res.status(500).json({ error: 'Erro ao deletar conexão' });
  }
};

/**
 * Validações para Edge
 */
export const validateEdge = [
  param('id').isUUID().withMessage('ID do chatbot inválido'),
  body('source').isUUID().withMessage('ID do bloco de origem inválido'),
  body('target').isUUID().withMessage('ID do bloco de destino inválido'),
  body('label').optional().isString().withMessage('Label deve ser string'),
];

export const validateUpdateBlock = [
  param('id').isUUID().withMessage('ID do chatbot inválido'),
  param('blockId').isUUID().withMessage('ID do bloco inválido'),
  body('type').optional().notEmpty().withMessage('Tipo do bloco não pode ser vazio'),
  body('position').optional().isObject().withMessage('Posição deve ser um objeto'),
  body('config').optional().isObject().withMessage('Configuração deve ser um objeto'),
];
