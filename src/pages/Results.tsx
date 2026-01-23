import { useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { ArrowLeft, Download, Eye, Search, BarChart3, Users, TrendingUp, CheckCircle } from 'lucide-react';
import { motion } from 'framer-motion';
import Header from '@/components/layout/Header';
import { useChatbot, useLeads } from '@/hooks/useMockApi';
import type { Lead } from '@/types/chatbot';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Skeleton } from '@/components/ui/skeleton';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table';
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog';
import { Badge } from '@/components/ui/badge';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select';

const Results = () => {
  const { id } = useParams<{ id: string }>();
  const { chatbot, loading: chatbotLoading } = useChatbot(id);
  const { leads, loading: leadsLoading, getMetrics, exportToCSV } = useLeads(id);
  
  const [searchQuery, setSearchQuery] = useState('');
  const [statusFilter, setStatusFilter] = useState<string>('all');
  const [selectedLead, setSelectedLead] = useState<Lead | null>(null);

  const metrics = getMetrics();
  const loading = chatbotLoading || leadsLoading;

  const filteredLeads = leads.filter((lead) => {
    const matchesSearch = 
      lead.answers.nome?.toLowerCase().includes(searchQuery.toLowerCase()) ||
      lead.answers.email?.toLowerCase().includes(searchQuery.toLowerCase());
    
    const matchesStatus = statusFilter === 'all' || lead.status === statusFilter;
    
    return matchesSearch && matchesStatus;
  });

  const handleExport = (format: 'csv' | 'excel') => {
    const csvContent = exportToCSV();
    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = `leads-${chatbot?.name || 'export'}.${format === 'csv' ? 'csv' : 'xlsx'}`;
    link.click();
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-background">
        <Header />
        <main className="container py-8">
          <Skeleton className="h-64 w-full rounded-lg" />
        </main>
      </div>
    );
  }

  if (!chatbot) {
    return (
      <div className="min-h-screen bg-background">
        <Header />
        <main className="container flex flex-col items-center justify-center py-16">
          <p className="text-muted-foreground mb-4">Chatbot não encontrado</p>
          <Button asChild>
            <Link to="/">Voltar ao Dashboard</Link>
          </Button>
        </main>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background">
      <Header />
      
      <main className="container py-8">
        {/* Header */}
        <motion.div
          initial={{ opacity: 0, y: -10 }}
          animate={{ opacity: 1, y: 0 }}
          className="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between"
        >
          <div className="flex items-center gap-4">
            <Button variant="ghost" size="icon" asChild>
              <Link to="/">
                <ArrowLeft className="h-5 w-5" />
              </Link>
            </Button>
            <div>
              <h1 className="font-display text-2xl font-bold text-foreground">
                {chatbot.name}
              </h1>
              <p className="text-sm text-muted-foreground">
                Resultados e leads capturados
              </p>
            </div>
          </div>
          
          <div className="flex gap-2">
            <Button variant="outline" onClick={() => handleExport('csv')}>
              <Download className="mr-2 h-4 w-4" />
              Exportar CSV
            </Button>
            <Button asChild>
              <Link to={`/editor/${chatbot.id}`}>
                Editar Chat
              </Link>
            </Button>
          </div>
        </motion.div>

        {/* Metrics */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.1 }}
          className="mb-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4"
        >
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium text-muted-foreground">
                Visualizações
              </CardTitle>
              <BarChart3 className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-3xl font-bold font-display">{metrics.totalViews}</div>
              <p className="text-xs text-muted-foreground">Últimos 30 dias</p>
            </CardContent>
          </Card>
          
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium text-muted-foreground">
                Leads Capturados
              </CardTitle>
              <Users className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-3xl font-bold font-display text-primary">{metrics.totalLeads}</div>
              <p className="text-xs text-muted-foreground">Total de contatos</p>
            </CardContent>
          </Card>
          
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium text-muted-foreground">
                Taxa de Conversão
              </CardTitle>
              <TrendingUp className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-3xl font-bold font-display text-success">{metrics.conversionRate.toFixed(1)}%</div>
              <p className="text-xs text-muted-foreground">Leads / Visualizações</p>
            </CardContent>
          </Card>
          
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium text-muted-foreground">
                Taxa de Conclusão
              </CardTitle>
              <CheckCircle className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-3xl font-bold font-display">{metrics.completionRate.toFixed(1)}%</div>
              <p className="text-xs text-muted-foreground">Finalizaram / Iniciaram</p>
            </CardContent>
          </Card>
        </motion.div>

        {/* Leads Table */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
        >
          <Card>
            <CardHeader>
              <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
                <CardTitle className="font-display">Leads</CardTitle>
                <div className="flex gap-2">
                  <div className="relative">
                    <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                    <Input
                      placeholder="Buscar por nome ou email..."
                      value={searchQuery}
                      onChange={(e) => setSearchQuery(e.target.value)}
                      className="pl-9 w-64"
                    />
                  </div>
                  <Select value={statusFilter} onValueChange={setStatusFilter}>
                    <SelectTrigger className="w-40">
                      <SelectValue placeholder="Status" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="all">Todos</SelectItem>
                      <SelectItem value="completed">Completos</SelectItem>
                      <SelectItem value="abandoned">Abandonados</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
              </div>
            </CardHeader>
            <CardContent>
              {filteredLeads.length === 0 ? (
                <div className="flex flex-col items-center justify-center py-12 text-center">
                  <Users className="h-12 w-12 text-muted-foreground/50 mb-4" />
                  <p className="text-muted-foreground">Nenhum lead encontrado</p>
                </div>
              ) : (
                <div className="overflow-x-auto">
                  <Table>
                    <TableHeader>
                      <TableRow>
                        <TableHead>Data/Hora</TableHead>
                        <TableHead>Nome</TableHead>
                        <TableHead>Email</TableHead>
                        <TableHead>Telefone</TableHead>
                        <TableHead>Status</TableHead>
                        <TableHead className="text-right">Ações</TableHead>
                      </TableRow>
                    </TableHeader>
                    <TableBody>
                      {filteredLeads.map((lead) => (
                        <TableRow key={lead.id}>
                          <TableCell className="text-muted-foreground">
                            {new Date(lead.startedAt).toLocaleString('pt-BR', {
                              day: '2-digit',
                              month: '2-digit',
                              hour: '2-digit',
                              minute: '2-digit',
                            })}
                          </TableCell>
                          <TableCell className="font-medium">{lead.answers.nome || '-'}</TableCell>
                          <TableCell>{lead.answers.email || '-'}</TableCell>
                          <TableCell>{lead.answers.telefone || '-'}</TableCell>
                          <TableCell>
                            <Badge variant={lead.status === 'completed' ? 'default' : 'secondary'}>
                              {lead.status === 'completed' ? '✓ Completo' : '⚠️ Abandonado'}
                            </Badge>
                          </TableCell>
                          <TableCell className="text-right">
                            <Button
                              variant="ghost"
                              size="sm"
                              onClick={() => setSelectedLead(lead)}
                            >
                              <Eye className="h-4 w-4" />
                            </Button>
                          </TableCell>
                        </TableRow>
                      ))}
                    </TableBody>
                  </Table>
                </div>
              )}
            </CardContent>
          </Card>
        </motion.div>
      </main>

      {/* Lead Detail Modal */}
      <Dialog open={!!selectedLead} onOpenChange={() => setSelectedLead(null)}>
        <DialogContent>
          <DialogHeader>
            <DialogTitle className="font-display">
              Lead: {selectedLead?.answers.nome || 'Sem nome'}
            </DialogTitle>
          </DialogHeader>
          
          {selectedLead && (
            <div className="space-y-4">
              <div className="flex items-center gap-2 text-sm text-muted-foreground">
                <span>📅</span>
                <span>
                  {new Date(selectedLead.startedAt).toLocaleString('pt-BR', {
                    day: '2-digit',
                    month: 'long',
                    year: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit',
                  })}
                </span>
              </div>
              
              <div className="flex items-center gap-2 text-sm text-muted-foreground">
                <span>🌐</span>
                <span className="truncate">{selectedLead.metadata.pageUrl}</span>
              </div>

              <div className="border-t border-border pt-4">
                <h4 className="font-medium mb-3">Respostas</h4>
                <div className="space-y-2">
                  {Object.entries(selectedLead.answers).map(([key, value]) => (
                    <div key={key} className="flex justify-between py-2 border-b border-border/50">
                      <span className="text-muted-foreground capitalize">{key}</span>
                      <span className="font-medium">{value}</span>
                    </div>
                  ))}
                </div>
              </div>

              <div className="flex justify-end pt-4">
                <Button variant="outline" onClick={() => setSelectedLead(null)}>
                  Fechar
                </Button>
              </div>
            </div>
          )}
        </DialogContent>
      </Dialog>
    </div>
  );
};

export default Results;
