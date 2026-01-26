import { useState, useCallback, useEffect } from 'react';
import { api } from '@/lib/api';
import type { Lead } from '@/types/chatbot';

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
      const response = await api.get<{ leads: Lead[] }>(`/chatbots/${chatbotId}/leads`);
      setLeads(response.leads);
    } catch (err: any) {
      setError(err.message || 'Erro ao carregar leads');
    } finally {
      setLoading(false);
    }
  }, [chatbotId]);

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
    exportToCSV,
  };
};
