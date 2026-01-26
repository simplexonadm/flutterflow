import { Request, Response, NextFunction } from 'express';
import { AuthService } from '../services/authService';
import { AuthRequest } from '../types/index';

/**
 * Middleware para validar JWT token
 */
export const authMiddleware = (req: AuthRequest, res: Response, next: NextFunction) => {
  try {
    // Obter token do header Authorization
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return res.status(401).json({ error: 'Token não fornecido' });
    }

    const token = authHeader.substring(7); // Remove "Bearer "

    // Validar token
    const payload = AuthService.verifyAccessToken(token);

    if (!payload) {
      return res.status(401).json({ error: 'Token inválido ou expirado' });
    }

    // Adicionar dados ao request
    req.userId = payload.userId;
    req.email = payload.email;

    next();
  } catch (error) {
    return res.status(500).json({ error: 'Erro ao validar token' });
  }
};

/**
 * Middleware de tratamento de erros
 */
export const errorMiddleware = (err: any, req: Request, res: Response, next: NextFunction) => {
  console.error('Error:', err);

  if (err.message === 'Email já cadastrado') {
    return res.status(400).json({ error: err.message });
  }

  if (err.message === 'Email ou senha incorretos') {
    return res.status(401).json({ error: err.message });
  }

  if (err.message === 'Usuário não encontrado') {
    return res.status(404).json({ error: err.message });
  }

  return res.status(500).json({ error: 'Erro interno do servidor' });
};
