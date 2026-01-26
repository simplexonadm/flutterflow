import { Router, Request, Response } from 'express';
import {
  register,
  login,
  refresh,
  getProfile,
  logout,
  validateRegister,
  validateLogin,
} from '../controllers/authController';
import { authMiddleware } from '../middleware/authMiddleware';

const router = Router();

/**
 * POST /api/auth/register
 * Registrar novo usuário
 */
router.post('/register', validateRegister, register);

/**
 * POST /api/auth/login
 * Login de usuário
 */
router.post('/login', validateLogin, login);

/**
 * POST /api/auth/refresh
 * Renovar token JWT
 */
router.post('/refresh', refresh);

/**
 * POST /api/auth/logout
 * Logout (gerenciado no frontend)
 */
router.post('/logout', logout);

/**
 * GET /api/auth/me
 * Obter perfil do usuário autenticado (protegido)
 */
router.get('/me', authMiddleware, getProfile);

export default router;
