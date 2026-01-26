import { useState, useCallback, useEffect } from 'react';
import { api } from '@/lib/api';
import type { ChatbotMetrics } from '@/types/chatbot';

export const useMetrics = (chatbotId: string | undefined) => {
  const [metrics, setMetrics] = useState<ChatbotMetrics | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchMetrics = useCallback(async () => {
    if (!chatbotId) {
      setLoading(false);
      return;
    }

    setLoading(true);
    setError(null);
    try {
      const response = await api.get<ChatbotMetrics>(`/chatbots/${chatbotId}/metrics`);
      setMetrics(response);
    } catch (err: any) {
      setError(err.message || 'Erro ao carregar métricas');
    } finally {
      setLoading(false);
    }
  }, [chatbotId]);

  useEffect(() => {
    fetchMetrics();
  }, [fetchMetrics]);

  return {
    metrics,
    loading,
    error,
    fetchMetrics,
  };
};
