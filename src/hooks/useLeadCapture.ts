import { useState, useCallback } from 'react';
import { api } from '@/lib/api';

export const useLeadCapture = (chatbotId: string | undefined) => {
  const [leadId, setLeadId] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  const startLead = useCallback(async (pageUrl?: string) => {
    if (!chatbotId) return;
    setLoading(true);
    try {
      const response = await api.post<{ leadId: string }>(`/chatbots/${chatbotId}/leads`, {
        pageUrl: pageUrl || window.location.href,
        userAgent: navigator.userAgent,
      });
      setLeadId(response.leadId);
      return response.leadId;
    } catch (err) {
      console.error('Erro ao iniciar lead:', err);
    } finally {
      setLoading(false);
    }
  }, [chatbotId]);

  const updateLeadAnswers = useCallback(async (answers: Record<string, string>, status: string = 'STARTED') => {
    if (!chatbotId || !leadId) return;
    try {
      await api.put(`/chatbots/${chatbotId}/leads/${leadId}`, {
        answers,
        status,
      });
    } catch (err) {
      console.error('Erro ao atualizar lead:', err);
    }
  }, [chatbotId, leadId]);

  return {
    leadId,
    loading,
    startLead,
    updateLeadAnswers,
  };
};
