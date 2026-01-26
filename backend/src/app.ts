import express, { Express, Request, Response } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { errorMiddleware } from './middleware/authMiddleware';
import authRoutes from './routes/authRoutes';

dotenv.config();

const app: Express = express();

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:5173',
  credentials: true,
}));

// Health check
app.get('/health', (req: Request, res: Response) => {
  res.json({ status: 'OK', message: 'Servidor rodando!', timestamp: new Date() });
});

// API Routes
app.use('/api/auth', authRoutes);

// Placeholder para outras rotas
app.use('/api', (req: Request, res: Response) => {
  res.json({ message: 'API em desenvolvimento' });
});

// 404
app.use((req: Request, res: Response) => {
  res.status(404).json({ error: 'Rota não encontrada' });
});

// Error middleware
app.use(errorMiddleware);

export default app;
