import { useState, useCallback, useEffect } from 'react';
import { api } from '@/lib/api';
import type { Chatbot } from '@/types/chatbot';

export const useChatbots = () => {
  const [chatbots, setChatbots] = useState<Chatbot[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchChatbots = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const response = await api.get<{ chatbots: Chatbot[] }>('/chatbots');
      setChatbots(response.chatbots);
    } catch (err: any) {
      setError(err.message || 'Erro ao carregar chatbots');
    } finally {
      setLoading(false);
    }
  }, []);

  const createChatbot = useCallback(async (name: string): Promise<Chatbot> => {
    const response = await api.post<{ chatbot: Chatbot }>('/chatbots', { name });
    setChatbots(prev => [response.chatbot, ...prev]);
    return response.chatbot;
  }, []);

  const deleteChatbot = useCallback(async (id: string): Promise<void> => {
    await api.delete(`/chatbots/${id}`);
    setChatbots(prev => prev.filter(c => c.id !== id));
  }, []);

  const fetchPublishedChatbots = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const response = await api.get<{ chatbots: Chatbot[] }>('/chatbots/public/all');
      setChatbots(response.chatbots);
    } catch (err: any) {
      setError(err.message || 'Erro ao carregar chatbots publicados');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchChatbots();
  }, [fetchChatbots]);

  return {
    chatbots,
    loading,
    error,
    fetchChatbots,
    fetchPublishedChatbots,
    createChatbot,
    deleteChatbot,
  };
};
