import { Request, Response } from 'express';
import { AuthService } from '../services/authService';
import { AuthRequest } from '../types/index';
import { body, validationResult } from 'express-validator';

/**
 * POST /api/auth/register
 */
export const register = async (req: Request, res: Response) => {
  try {
    // Validar input
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { email, password } = req.body;

    // Registrar usuário
    const result = await AuthService.register(email, password);

    return res.status(201).json({
      message: 'Usuário registrado com sucesso',
      user: result.user,
      tokens: result.tokens,
    });
  } catch (error: any) {
    if (error.message === 'Email já cadastrado') {
      return res.status(400).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao registrar usuário' });
  }
};

/**
 * POST /api/auth/login
 */
export const login = async (req: Request, res: Response) => {
  try {
    // Validar input
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { email, password } = req.body;

    // Login
    const result = await AuthService.login(email, password);

    return res.status(200).json({
      message: 'Login realizado com sucesso',
      user: result.user,
      tokens: result.tokens,
    });
  } catch (error: any) {
    if (error.message === 'Email ou senha incorretos') {
      return res.status(401).json({ error: error.message });
    }
    return res.status(500).json({ error: 'Erro ao fazer login' });
  }
};

/**
 * POST /api/auth/refresh
 */
export const refresh = async (req: Request, res: Response) => {
  try {
    const { refreshToken } = req.body;

    if (!refreshToken) {
      return res.status(400).json({ error: 'Refresh token não fornecido' });
    }

    const result = await AuthService.refreshToken(refreshToken);

    return res.status(200).json({
      message: 'Token renovado com sucesso',
      tokens: result.tokens,
    });
  } catch (error: any) {
    return res.status(401).json({ error: 'Erro ao renovar token' });
  }
};

/**
 * GET /api/auth/me
 */
export const getProfile = async (req: AuthRequest, res: Response) => {
  try {
    if (!req.userId) {
      return res.status(401).json({ error: 'Não autenticado' });
    }

    const user = await AuthService.getProfile(req.userId);

    return res.status(200).json({
      user,
    });
  } catch (error: any) {
    return res.status(500).json({ error: 'Erro ao buscar perfil' });
  }
};

/**
 * POST /api/auth/logout
 */
export const logout = async (req: Request, res: Response) => {
  // Logout é gerenciado no frontend (remover token)
  // Backend pode manter um blacklist de tokens se necessário

  return res.status(200).json({
    message: 'Logout realizado com sucesso',
  });
};

/**
 * Validações para registro
 */
export const validateRegister = [
  body('email')
    .isEmail()
    .withMessage('Email inválido')
    .normalizeEmail(),
  body('password')
    .isLength({ min: 6 })
    .withMessage('Senha deve ter no mínimo 6 caracteres'),
];

/**
 * Validações para login
 */
export const validateLogin = [
  body('email')
    .isEmail()
    .withMessage('Email inválido')
    .normalizeEmail(),
  body('password')
    .notEmpty()
    .withMessage('Senha é obrigatória'),
];
