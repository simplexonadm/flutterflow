import { Request, Response } from 'express';
import { LeadService } from '../services/leadService';
import { AuthRequest } from '../types/index';
import { body, validationResult, param, query } from 'express-validator';
import { LeadStatus } from '@prisma/client';

/**
 * POST /api/chatbots/:id/leads
 * Criar um novo lead (público)
 */
export const createLead = async (req: Request, res: Response) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { id } = req.params;
    const { pageUrl, userAgent } = req.body;

    const lead = await LeadService.createLead({
      chatbotId: id,
      pageUrl,
      userAgent: userAgent || req.headers['user-agent'],
    });

    return res.status(201).json({
      message: 'Lead iniciado com sucesso',
      leadId: lead.id,
    });
  } catch (error: any) {
    if (error.message === 'Chatbot não encontrado') {
      return res.status(404).json({ error: error.message });
    }
    if (error.message === 'Chatbot não está publicado') {
      return res.status(403).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao iniciar lead' });
  }
};

/**
 * PUT /api/chatbots/:id/leads/:leadId
 * Atualizar respostas do lead (público)
 */
export const updateLead = async (req: Request, res: Response) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { id, leadId } = req.params;
    const { answers, status } = req.body;

    const lead = await LeadService.updateLead(leadId, id, {
      answers,
      status: status as LeadStatus,
    });

    return res.status(200).json({
      message: 'Respostas salvas com sucesso',
      status: lead.status,
    });
  } catch (error: any) {
    if (error.message === 'Lead não encontrado') {
      return res.status(404).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao atualizar lead' });
  }
};

/**
 * GET /api/chatbots/:id/leads
 * Listar leads do chatbot (protegido)
 */
export const getLeads = async (req: AuthRequest, res: Response) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    if (!req.userId) {
      return res.status(401).json({ error: 'Não autenticado' });
    }

    const { id } = req.params;
    const { status, search, page, limit } = req.query;

    const result = await LeadService.getChatbotLeads(id, req.userId, {
      status: status as LeadStatus,
      search: search as string,
      page: page ? parseInt(page as string) : undefined,
      limit: limit ? parseInt(limit as string) : undefined,
    });

    return res.status(200).json(result);
  } catch (error: any) {
    if (error.message.includes('acesso negado') || error.message === 'Chatbot não encontrado') {
      return res.status(403).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao buscar leads' });
  }
};

/**
 * Validações para Criar Lead
 */
export const validateCreateLead = [
  param('id').isUUID().withMessage('ID do chatbot inválido'),
  body('pageUrl').optional().isURL().withMessage('URL da página inválida'),
];

/**
 * Validações para Atualizar Lead
 */
export const validateUpdateLead = [
  param('id').isUUID().withMessage('ID do chatbot inválido'),
  param('leadId').isUUID().withMessage('ID do lead inválido'),
  body('answers').isObject().withMessage('Respostas devem ser um objeto'),
  body('status').optional().isIn(['STARTED', 'COMPLETED', 'ABANDONED']).withMessage('Status inválido'),
];

/**
 * Validações para Listar Leads
 */
export const validateGetLeads = [
  param('id').isUUID().withMessage('ID do chatbot inválido'),
  query('status').optional().isIn(['STARTED', 'COMPLETED', 'ABANDONED']).withMessage('Status inválido'),
  query('page').optional().isInt({ min: 1 }).withMessage('Página deve ser um número inteiro positivo'),
  query('limit').optional().isInt({ min: 1, max: 100 }).withMessage('Limite deve ser entre 1 e 100'),
];
