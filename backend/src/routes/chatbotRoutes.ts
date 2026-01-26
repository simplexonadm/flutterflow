import { Router } from 'express';
import {
  getChatbots,
  getChatbot,
  createChatbot,
  updateChatbot,
  deleteChatbot,
  publishChatbot,
  getPublicChatbot,
  updateChatbotContent,
  validateCreateChatbot,
  validateUpdateChatbot,
  validateUpdateContent,
} from '../controllers/chatbotController';
import { authMiddleware } from '../middleware/authMiddleware';

const router = Router();

/**
 * GET /api/chatbots
 * Listar chatbots do usuário (protegido)
 */
router.get('/', authMiddleware, getChatbots);

/**
 * GET /api/chatbots/:id
 * Obter chatbot específico (protegido)
 */
router.get('/:id', authMiddleware, getChatbot);

/**
 * POST /api/chatbots
 * Criar novo chatbot (protegido)
 */
router.post('/', authMiddleware, validateCreateChatbot, createChatbot);

/**
 * PUT /api/chatbots/:id
 * Atualizar chatbot (protegido)
 */
router.put('/:id', authMiddleware, validateUpdateChatbot, updateChatbot);

/**
 * DELETE /api/chatbots/:id
 * Deletar chatbot (protegido)
 */
router.delete('/:id', authMiddleware, deleteChatbot);

/**
 * POST /api/chatbots/:id/publish
 * Publicar chatbot (protegido)
 */
router.post('/:id/publish', authMiddleware, publishChatbot);

/**
 * GET /api/chatbots/:id/public
 * Obter chatbot público (sem autenticação)
 */
router.get('/:id/public', getPublicChatbot);

/**
 * PUT /api/chatbots/:id/content
 * Atualizar blocos e edges do chatbot (protegido)
 */
router.put('/:id/content', authMiddleware, validateUpdateContent, updateChatbotContent);

export default router;
