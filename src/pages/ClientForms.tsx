import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { MessageSquare, Eye, LogOut } from 'lucide-react';
import { useChatbots } from '@/hooks/useChatbots';

const ClientForms = () => {
  const navigate = useNavigate();
  const { user, logout } = useAuth();
  const { chatbots, loading, fetchPublishedChatbots } = useChatbots();

  useEffect(() => {
    fetchPublishedChatbots();
  }, [fetchPublishedChatbots]);

  const handleLogout = () => {
    logout();
    navigate('/login');
  };

  return (
    <div className="min-h-screen bg-background">
      <header className="border-b border-border bg-card">
        <div className="container mx-auto flex h-16 items-center justify-between px-4">
          <div className="flex items-center gap-2">
            <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-primary">
              <MessageSquare className="h-5 w-5 text-primary-foreground" />
            </div>
            <span className="text-xl font-display font-bold text-foreground">LeadChat</span>
          </div>
          
          <div className="flex items-center gap-4">
            <span className="text-sm text-muted-foreground">{user?.email}</span>
            <Badge variant="secondary">Cliente</Badge>
            <Button variant="ghost" size="icon" onClick={handleLogout} data-testid="button-logout">
              <LogOut className="h-4 w-4" />
            </Button>
          </div>
        </div>
      </header>

      <main className="container mx-auto px-4 py-8">
        <div className="mb-8">
          <h1 className="text-3xl font-display font-bold text-foreground">Formulários Disponíveis</h1>
          <p className="text-muted-foreground mt-1">Visualize e interaja com os formulários publicados</p>
        </div>

        {loading ? (
          <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
            {[1, 2, 3].map(i => (
              <Card key={i} className="animate-pulse">
                <CardHeader>
                  <div className="h-6 w-3/4 rounded bg-muted"></div>
                  <div className="h-4 w-1/2 rounded bg-muted"></div>
                </CardHeader>
                <CardContent>
                  <div className="h-10 w-full rounded bg-muted"></div>
                </CardContent>
              </Card>
            ))}
          </div>
        ) : chatbots.length === 0 ? (
          <Card className="mx-auto max-w-md text-center">
            <CardHeader>
              <CardTitle>Nenhum formulário disponível</CardTitle>
              <CardDescription>
                Não há formulários publicados no momento. Por favor, volte mais tarde.
              </CardDescription>
            </CardHeader>
          </Card>
        ) : (
          <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
            {chatbots.map(chatbot => (
              <Card key={chatbot.id} className="hover:shadow-lg transition-shadow" data-testid={`card-form-${chatbot.id}`}>
                <CardHeader>
                  <div className="flex items-center gap-2">
                    <span className="text-2xl">{chatbot.theme.avatar}</span>
                    <div>
                      <CardTitle className="text-lg">{chatbot.name}</CardTitle>
                      <CardDescription>
                        {chatbot.blocks.length} etapas
                      </CardDescription>
                    </div>
                  </div>
                </CardHeader>
                <CardContent>
                  <Button 
                    className="w-full" 
                    onClick={() => navigate(`/form/${chatbot.id}`)}
                    data-testid={`button-view-form-${chatbot.id}`}
                  >
                    <Eye className="mr-2 h-4 w-4" />
                    Visualizar Formulário
                  </Button>
                </CardContent>
              </Card>
            ))}
          </div>
        )}
      </main>
    </div>
  );
};

export default ClientForms;
