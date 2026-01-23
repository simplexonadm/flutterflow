import { useState, useCallback, useEffect } from 'react';
import { v4 as uuidv4 } from 'uuid';
import type { Chatbot, Lead, ChatbotMetrics, Block, Edge } from '@/types/chatbot';

// ============================================
// MOCK DATA STORAGE
// This simulates a backend database
// Replace with actual API calls when connecting to backend
// ============================================

const STORAGE_KEYS = {
  CHATBOTS: 'leadchat_chatbots',
  LEADS: 'leadchat_leads',
};

// Default chatbot template
const createDefaultChatbot = (name: string): Chatbot => ({
  id: uuidv4(),
  name,
  createdAt: new Date().toISOString(),
  updatedAt: new Date().toISOString(),
  isPublished: false,
  theme: {
    primaryColor: '#0066FF',
    mode: 'light',
    buttonPosition: 'right',
    buttonText: 'Fale conosco',
    avatar: '😊',
  },
  blocks: [
    {
      id: 'block-start',
      type: 'start',
      position: { x: 250, y: 50 },
      config: {
        message: 'Olá! Vamos conversar sobre como podemos ajudar?',
      },
    },
    {
      id: 'block-name',
      type: 'question-text',
      position: { x: 250, y: 180 },
      config: {
        question: 'Qual é o seu nome?',
        variableName: 'nome',
        placeholder: 'Digite seu nome',
      },
    },
    {
      id: 'block-email',
      type: 'question-email',
      position: { x: 250, y: 310 },
      config: {
        question: 'Qual é o seu email?',
        variableName: 'email',
        placeholder: 'seu@email.com',
      },
    },
    {
      id: 'block-end',
      type: 'end',
      position: { x: 250, y: 440 },
      config: {
        message: 'Obrigado, {{nome}}! Entraremos em contato pelo email {{email}}.',
      },
    },
  ],
  edges: [
    { id: 'edge-1', source: 'block-start', target: 'block-name' },
    { id: 'edge-2', source: 'block-name', target: 'block-email' },
    { id: 'edge-3', source: 'block-email', target: 'block-end' },
  ],
});

// Mock leads data
const generateMockLeads = (chatbotId: string): Lead[] => {
  const names = ['João Silva', 'Maria Santos', 'Pedro Costa', 'Ana Oliveira', 'Lucas Ferreira'];
  const domains = ['gmail.com', 'outlook.com', 'empresa.com.br', 'hotmail.com'];
  const interests = ['Produto A', 'Produto B', 'Consultoria', 'Suporte'];
  
  return Array.from({ length: 15 }, (_, i) => {
    const name = names[Math.floor(Math.random() * names.length)];
    const email = `${name.toLowerCase().replace(' ', '.')}@${domains[Math.floor(Math.random() * domains.length)]}`;
    const date = new Date();
    date.setDate(date.getDate() - Math.floor(Math.random() * 30));
    date.setHours(Math.floor(Math.random() * 24), Math.floor(Math.random() * 60));
    
    const isCompleted = Math.random() > 0.2;
    const status: Lead['status'] = isCompleted ? 'completed' : 'abandoned';
    
    return {
      id: uuidv4(),
      chatbotId,
      startedAt: date.toISOString(),
      completedAt: isCompleted ? new Date(date.getTime() + 120000).toISOString() : undefined,
      status,
      answers: {
        nome: name,
        email,
        telefone: `(${Math.floor(Math.random() * 90) + 10}) 9${Math.floor(Math.random() * 9000) + 1000}-${Math.floor(Math.random() * 9000) + 1000}`,
        interesse: interests[Math.floor(Math.random() * interests.length)],
      },
      metadata: {
        pageUrl: 'https://meusite.com.br/landing-page',
        userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
      },
    };
  }).sort((a, b) => new Date(b.startedAt).getTime() - new Date(a.startedAt).getTime());
};

// Initialize mock data
const initializeMockData = () => {
  const existingChatbots = localStorage.getItem(STORAGE_KEYS.CHATBOTS);
  
  if (!existingChatbots) {
    const defaultChatbots: Chatbot[] = [
      {
        ...createDefaultChatbot('Captura de Leads - Produto X'),
        id: 'chatbot-1',
        isPublished: true,
      },
      {
        ...createDefaultChatbot('Qualificação - Serviços'),
        id: 'chatbot-2',
        isPublished: true,
      },
      {
        ...createDefaultChatbot('Rascunho - Nova Campanha'),
        id: 'chatbot-3',
        isPublished: false,
      },
    ];
    
    localStorage.setItem(STORAGE_KEYS.CHATBOTS, JSON.stringify(defaultChatbots));
    
    // Generate leads for published chatbots
    const allLeads: Lead[] = [
      ...generateMockLeads('chatbot-1'),
      ...generateMockLeads('chatbot-2'),
    ];
    localStorage.setItem(STORAGE_KEYS.LEADS, JSON.stringify(allLeads));
  }
};

// ============================================
// API HOOKS
// These hooks simulate API calls
// Replace implementations with actual fetch calls
// ============================================

// Chatbots API
export const useChatbots = () => {
  const [chatbots, setChatbots] = useState<Chatbot[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchChatbots = useCallback(async () => {
    setLoading(true);
    setError(null);
    
    try {
      // Simulate API delay
      await new Promise(resolve => setTimeout(resolve, 300));
      
      initializeMockData();
      const data = localStorage.getItem(STORAGE_KEYS.CHATBOTS);
      setChatbots(data ? JSON.parse(data) : []);
    } catch (err) {
      setError('Erro ao carregar chatbots');
      console.error(err);
    } finally {
      setLoading(false);
    }
  }, []);

  const createChatbot = useCallback(async (name: string): Promise<Chatbot> => {
    const newChatbot = createDefaultChatbot(name);
    const data = localStorage.getItem(STORAGE_KEYS.CHATBOTS);
    const current = data ? JSON.parse(data) : [];
    const updated = [...current, newChatbot];
    localStorage.setItem(STORAGE_KEYS.CHATBOTS, JSON.stringify(updated));
    setChatbots(updated);
    return newChatbot;
  }, []);

  const updateChatbot = useCallback(async (chatbot: Chatbot): Promise<Chatbot> => {
    const data = localStorage.getItem(STORAGE_KEYS.CHATBOTS);
    const current: Chatbot[] = data ? JSON.parse(data) : [];
    const updated = current.map(c => c.id === chatbot.id ? { ...chatbot, updatedAt: new Date().toISOString() } : c);
    localStorage.setItem(STORAGE_KEYS.CHATBOTS, JSON.stringify(updated));
    setChatbots(updated);
    return chatbot;
  }, []);

  const deleteChatbot = useCallback(async (id: string): Promise<void> => {
    const data = localStorage.getItem(STORAGE_KEYS.CHATBOTS);
    const current: Chatbot[] = data ? JSON.parse(data) : [];
    const updated = current.filter(c => c.id !== id);
    localStorage.setItem(STORAGE_KEYS.CHATBOTS, JSON.stringify(updated));
    setChatbots(updated);
    
    // Also delete related leads
    const leadsData = localStorage.getItem(STORAGE_KEYS.LEADS);
    const leads: Lead[] = leadsData ? JSON.parse(leadsData) : [];
    const updatedLeads = leads.filter(l => l.chatbotId !== id);
    localStorage.setItem(STORAGE_KEYS.LEADS, JSON.stringify(updatedLeads));
  }, []);

  useEffect(() => {
    fetchChatbots();
  }, [fetchChatbots]);

  return {
    chatbots,
    loading,
    error,
    fetchChatbots,
    createChatbot,
    updateChatbot,
    deleteChatbot,
  };
};

// Single Chatbot API
export const useChatbot = (id: string | undefined) => {
  const [chatbot, setChatbot] = useState<Chatbot | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchChatbot = useCallback(async () => {
    if (!id) {
      setLoading(false);
      return;
    }
    
    setLoading(true);
    setError(null);
    
    try {
      await new Promise(resolve => setTimeout(resolve, 200));
      
      initializeMockData();
      const data = localStorage.getItem(STORAGE_KEYS.CHATBOTS);
      const chatbots: Chatbot[] = data ? JSON.parse(data) : [];
      const found = chatbots.find(c => c.id === id);
      
      if (found) {
        setChatbot(found);
      } else {
        setError('Chatbot não encontrado');
      }
    } catch (err) {
      setError('Erro ao carregar chatbot');
      console.error(err);
    } finally {
      setLoading(false);
    }
  }, [id]);

  const updateBlocks = useCallback(async (blocks: Block[], edges: Edge[]) => {
    if (!chatbot) return;
    
    const updated = { ...chatbot, blocks, edges, updatedAt: new Date().toISOString() };
    const data = localStorage.getItem(STORAGE_KEYS.CHATBOTS);
    const current: Chatbot[] = data ? JSON.parse(data) : [];
    const newList = current.map(c => c.id === updated.id ? updated : c);
    localStorage.setItem(STORAGE_KEYS.CHATBOTS, JSON.stringify(newList));
    setChatbot(updated);
  }, [chatbot]);

  const publishChatbot = useCallback(async (theme: Chatbot['theme']) => {
    if (!chatbot) return;
    
    const updated = { ...chatbot, theme, isPublished: true, updatedAt: new Date().toISOString() };
    const data = localStorage.getItem(STORAGE_KEYS.CHATBOTS);
    const current: Chatbot[] = data ? JSON.parse(data) : [];
    const newList = current.map(c => c.id === updated.id ? updated : c);
    localStorage.setItem(STORAGE_KEYS.CHATBOTS, JSON.stringify(newList));
    setChatbot(updated);
  }, [chatbot]);

  useEffect(() => {
    fetchChatbot();
  }, [fetchChatbot]);

  return {
    chatbot,
    loading,
    error,
    fetchChatbot,
    updateBlocks,
    publishChatbot,
    setChatbot,
  };
};

// Leads API
export const useLeads = (chatbotId: string | undefined) => {
  const [leads, setLeads] = useState<Lead[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchLeads = useCallback(async () => {
    if (!chatbotId) {
      setLoading(false);
      return;
    }
    
    setLoading(true);
    setError(null);
    
    try {
      await new Promise(resolve => setTimeout(resolve, 300));
      
      initializeMockData();
      const data = localStorage.getItem(STORAGE_KEYS.LEADS);
      const allLeads: Lead[] = data ? JSON.parse(data) : [];
      const filtered = allLeads.filter(l => l.chatbotId === chatbotId);
      setLeads(filtered);
    } catch (err) {
      setError('Erro ao carregar leads');
      console.error(err);
    } finally {
      setLoading(false);
    }
  }, [chatbotId]);

  const getMetrics = useCallback((): ChatbotMetrics => {
    const totalLeads = leads.length;
    const completedLeads = leads.filter(l => l.status === 'completed').length;
    const totalViews = Math.floor(totalLeads * (100 / 19.2)); // Simulate ~19.2% conversion
    
    return {
      totalViews,
      totalLeads,
      conversionRate: totalViews > 0 ? (totalLeads / totalViews) * 100 : 0,
      completionRate: totalLeads > 0 ? (completedLeads / totalLeads) * 100 : 0,
    };
  }, [leads]);

  const exportToCSV = useCallback(() => {
    if (leads.length === 0) return '';
    
    const headers = ['Data', 'Status', 'Nome', 'Email', 'Telefone', 'Interesse'];
    const rows = leads.map(lead => [
      new Date(lead.startedAt).toLocaleString('pt-BR'),
      lead.status === 'completed' ? 'Completo' : 'Abandonado',
      lead.answers.nome || '',
      lead.answers.email || '',
      lead.answers.telefone || '',
      lead.answers.interesse || '',
    ]);
    
    const csvContent = [headers, ...rows]
      .map(row => row.map(cell => `"${cell}"`).join(','))
      .join('\n');
    
    return csvContent;
  }, [leads]);

  useEffect(() => {
    fetchLeads();
  }, [fetchLeads]);

  return {
    leads,
    loading,
    error,
    fetchLeads,
    getMetrics,
    exportToCSV,
  };
};

// Chat Session API (for the widget preview)
export const useChatSession = (chatbot: Chatbot | null) => {
  const [currentBlockIndex, setCurrentBlockIndex] = useState(0);
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [isComplete, setIsComplete] = useState(false);

  const orderedBlocks = chatbot?.blocks.slice().sort((a, b) => a.position.y - b.position.y) || [];
  const currentBlock = orderedBlocks[currentBlockIndex];

  const submitAnswer = useCallback((value: string) => {
    if (!currentBlock) return;
    
    const variableName = currentBlock.config.variableName;
    if (variableName) {
      setAnswers(prev => ({ ...prev, [variableName]: value }));
    }
    
    if (currentBlockIndex < orderedBlocks.length - 1) {
      setCurrentBlockIndex(prev => prev + 1);
    } else {
      setIsComplete(true);
    }
  }, [currentBlock, currentBlockIndex, orderedBlocks.length]);

  const goNext = useCallback(() => {
    if (currentBlockIndex < orderedBlocks.length - 1) {
      setCurrentBlockIndex(prev => prev + 1);
    } else {
      setIsComplete(true);
    }
  }, [currentBlockIndex, orderedBlocks.length]);

  const reset = useCallback(() => {
    setCurrentBlockIndex(0);
    setAnswers({});
    setIsComplete(false);
  }, []);

  const interpolateMessage = useCallback((message: string) => {
    return message.replace(/\{\{(\w+)\}\}/g, (_, key) => answers[key] || `{{${key}}}`);
  }, [answers]);

  return {
    currentBlock,
    currentBlockIndex,
    totalBlocks: orderedBlocks.length,
    answers,
    isComplete,
    submitAnswer,
    goNext,
    reset,
    interpolateMessage,
  };
};
