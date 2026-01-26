import { Router } from 'express';
import {
  createLead,
  updateLead,
  getLeads,
  validateCreateLead,
  validateUpdateLead,
  validateGetLeads,
} from '../controllers/leadController';
import { authMiddleware } from '../middleware/authMiddleware';

const router = Router();

/**
 * POST /api/chatbots/:id/leads
 * Iniciar novo lead (público)
 */
router.post('/:id/leads', validateCreateLead, createLead);

/**
 * PUT /api/chatbots/:id/leads/:leadId
 * Atualizar respostas do lead (público)
 */
router.put('/:id/leads/:leadId', validateUpdateLead, updateLead);

/**
 * GET /api/chatbots/:id/leads
 * Listar leads do chatbot (protegido)
 */
router.get('/:id/leads', authMiddleware, validateGetLeads, getLeads);

export default router;
