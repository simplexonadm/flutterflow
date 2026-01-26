import { useState, useCallback, useEffect } from 'react';
import { api } from '@/lib/api';
import type { Chatbot, Block, Edge, ChatbotTheme } from '@/types/chatbot';

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
      const response = await api.get<{ chatbot: Chatbot }>(`/chatbots/${id}`);
      setChatbot(response.chatbot);
    } catch (err: any) {
      setError(err.message || 'Erro ao carregar chatbot');
    } finally {
      setLoading(false);
    }
  }, [id]);

  const updateBlocks = useCallback(async (blocks: Block[], edges: Edge[]) => {
    if (!id) return;
    try {
      const response = await api.put<{ chatbot: Chatbot }>(`/chatbots/${id}/content`, { blocks, edges });
      setChatbot(response.chatbot);
      return response.chatbot;
    } catch (err: any) {
      throw new Error(err.message || 'Erro ao salvar blocos');
    }
  }, [id]);

  const publishChatbot = useCallback(async (theme: ChatbotTheme) => {
    if (!id) return;
    try {
      // First update theme
      await api.put(`/chatbots/${id}`, { ...theme });
      // Then publish
      const response = await api.post<{ chatbot: Chatbot }>(`/chatbots/${id}/publish`, {});
      setChatbot(response.chatbot);
      return response.chatbot;
    } catch (err: any) {
      throw new Error(err.message || 'Erro ao publicar chatbot');
    }
  }, [id]);

  useEffect(() => {
    fetchChatbot();
  }, [fetchChatbot]);

  const fetchPublicChatbot = useCallback(async () => {
    if (!id) {
      setLoading(false);
      return;
    }

    setLoading(true);
    setError(null);
    try {
      const response = await api.get<{ chatbot: Chatbot }>(`/chatbots/${id}/public`);
      setChatbot(response.chatbot);
    } catch (err: any) {
      setError(err.message || 'Erro ao carregar chatbot público');
    } finally {
      setLoading(false);
    }
  }, [id]);

  return {
    chatbot,
    loading,
    error,
    fetchChatbot,
    fetchPublicChatbot,
    updateBlocks,
    publishChatbot,
    setChatbot,
  };
};
