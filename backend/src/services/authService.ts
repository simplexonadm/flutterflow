import bcryptjs from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const JWT_SECRET = process.env.JWT_SECRET || 'sua_chave_secreta_aqui';
const JWT_REFRESH_SECRET = process.env.JWT_REFRESH_SECRET || 'seu_refresh_secret_aqui';
const JWT_EXPIRATION = process.env.JWT_EXPIRATION || '15m';
const JWT_REFRESH_EXPIRATION = process.env.JWT_REFRESH_EXPIRATION || '7d';

export interface AuthTokens {
  accessToken: string;
  refreshToken: string;
}

export interface UserPayload {
  userId: string;
  email: string;
}

export class AuthService {
  /**
   * Hash de senha com bcryptjs
   */
  static async hashPassword(password: string): Promise<string> {
    const salt = await bcryptjs.genSalt(10);
    return bcryptjs.hash(password, salt);
  }

  /**
   * Validar password
   */
  static async comparePassword(password: string, hash: string): Promise<boolean> {
    return bcryptjs.compare(password, hash);
  }

  /**
   * Gerar JWT tokens
   */
  static generateTokens(payload: UserPayload): AuthTokens {
    const accessToken = jwt.sign(payload, JWT_SECRET, {
      expiresIn: JWT_EXPIRATION as jwt.SignOptions['expiresIn'],
    });

    const refreshToken = jwt.sign(payload, JWT_REFRESH_SECRET, {
      expiresIn: JWT_REFRESH_EXPIRATION as jwt.SignOptions['expiresIn'],
    });

    return { accessToken, refreshToken };
  }

  /**
   * Validar access token
   */
  static verifyAccessToken(token: string): UserPayload | null {
    try {
      return jwt.verify(token, JWT_SECRET) as UserPayload;
    } catch (error) {
      return null;
    }
  }

  /**
   * Validar refresh token
   */
  static verifyRefreshToken(token: string): UserPayload | null {
    try {
      return jwt.verify(token, JWT_REFRESH_SECRET) as UserPayload;
    } catch (error) {
      return null;
    }
  }

  /**
   * Registrar novo usuário
   */
  static async register(email: string, password: string) {
    // Verificar se email já existe
    const existingUser = await prisma.user.findUnique({
      where: { email },
    });

    if (existingUser) {
      throw new Error('Email já cadastrado');
    }

    // Hash password
    const hashedPassword = await this.hashPassword(password);

    // Criar usuário
    const user = await prisma.user.create({
      data: {
        email,
        password: hashedPassword,
      },
    });

    // Gerar tokens
    const tokens = this.generateTokens({
      userId: user.id,
      email: user.email,
    });

    return { user: { id: user.id, email: user.email }, tokens };
  }

  /**
   * Login de usuário
   */
  static async login(email: string, password: string) {
    // Buscar usuário
    const user = await prisma.user.findUnique({
      where: { email },
    });

    if (!user) {
      throw new Error('Email ou senha incorretos');
    }

    // Validar password
    const isPasswordValid = await this.comparePassword(password, user.password);

    if (!isPasswordValid) {
      throw new Error('Email ou senha incorretos');
    }

    // Gerar tokens
    const tokens = this.generateTokens({
      userId: user.id,
      email: user.email,
    });

    return { user: { id: user.id, email: user.email }, tokens };
  }

  /**
   * Refresh token
   */
  static async refreshToken(refreshToken: string) {
    // Validar refresh token
    const payload = this.verifyRefreshToken(refreshToken);

    if (!payload) {
      throw new Error('Refresh token inválido');
    }

    // Verificar se usuário ainda existe
    const user = await prisma.user.findUnique({
      where: { id: payload.userId },
    });

    if (!user) {
      throw new Error('Usuário não encontrado');
    }

    // Gerar novos tokens
    const tokens = this.generateTokens({
      userId: user.id,
      email: user.email,
    });

    return { tokens };
  }

  /**
   * Obter perfil do usuário
   */
  static async getProfile(userId: string) {
    const user = await prisma.user.findUnique({
      where: { id: userId },
      select: { id: true, email: true, role: true, createdAt: true },
    });

    if (!user) {
      throw new Error('Usuário não encontrado');
    }

    return user;
  }
}
