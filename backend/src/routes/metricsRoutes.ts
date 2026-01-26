import { Router } from 'express';
import { getChatbotMetrics, validateGetMetrics } from '../controllers/metricsController';
import { authMiddleware } from '../middleware/authMiddleware';

const router = Router();

/**
 * GET /api/chatbots/:id/metrics
 * Obter métricas do chatbot (protegido)
 */
router.get('/:id/metrics', authMiddleware, validateGetMetrics, getChatbotMetrics);

export default router;
