import { Response } from 'express';
import { MetricsService } from '../services/metricsService';
import { AuthRequest } from '../types/index';
import { param, validationResult } from 'express-validator';

/**
 * GET /api/chatbots/:id/metrics
 * Obter métricas de um chatbot
 */
export const getChatbotMetrics = async (req: AuthRequest, res: Response) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    if (!req.userId) {
      return res.status(401).json({ error: 'Não autenticado' });
    }

    const { id } = req.params;
    const metrics = await MetricsService.getChatbotMetrics(id, req.userId);

    return res.status(200).json(metrics);
  } catch (error: any) {
    if (error.message.includes('acesso negado') || error.message === 'Chatbot não encontrado') {
      return res.status(403).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao buscar métricas' });
  }
};

/**
 * Validações para Métricas
 */
export const validateGetMetrics = [
  param('id').isUUID().withMessage('ID do chatbot inválido'),
];
