import { useNavigate } from 'react-router-dom';
import { MessageSquare, Sparkles } from 'lucide-react';
import { motion } from 'framer-motion';
import Header from '@/components/layout/Header';
import ChatbotCard from '@/components/dashboard/ChatbotCard';
import CreateChatbotDialog from '@/components/dashboard/CreateChatbotDialog';
import { useChatbots } from '@/hooks/useChatbots';
import { Skeleton } from '@/components/ui/skeleton';
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from '@/components/ui/alert-dialog';
import { useState } from 'react';

const Dashboard = () => {
  const navigate = useNavigate();
  const { chatbots, loading, createChatbot, deleteChatbot } = useChatbots();
  const [deleteId, setDeleteId] = useState<string | null>(null);

  const handleCreate = async (name: string) => {
    try {
      const newChatbot = await createChatbot(name);
      navigate(`/editor/${newChatbot.id}`);
    } catch (error) {
      console.error('Erro ao criar chatbot:', error);
    }
  };

  const handleDelete = async () => {
    if (deleteId) {
      try {
        await deleteChatbot(deleteId);
        setDeleteId(null);
      } catch (error) {
        console.error('Erro ao deletar chatbot:', error);
      }
    }
  };

  return (
    <div className="min-h-screen bg-background">
      <Header />
      
      <main className="container py-8">
        <motion.div
          initial={{ opacity: 0, y: -10 }}
          animate={{ opacity: 1, y: 0 }}
          className="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between"
        >
          <div>
            <h1 className="font-display text-3xl font-bold text-foreground">
              Meus Chatbots
            </h1>
            <p className="text-muted-foreground">
              Gerencie seus chatbots de captura de leads
            </p>
          </div>
          <CreateChatbotDialog onCreate={handleCreate} />
        </motion.div>

        {loading ? (
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {[1, 2, 3].map((i) => (
              <Skeleton key={i} className="h-48 rounded-lg" />
            ))}
          </div>
        ) : chatbots.length === 0 ? (
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            className="flex flex-col items-center justify-center rounded-2xl border-2 border-dashed border-border bg-muted/30 px-8 py-16 text-center"
          >
            <div className="mb-4 flex h-16 w-16 items-center justify-center rounded-2xl gradient-primary shadow-glow">
              <MessageSquare className="h-8 w-8 text-primary-foreground" />
            </div>
            <h2 className="mb-2 font-display text-xl font-semibold text-foreground">
              Nenhum chatbot ainda
            </h2>
            <p className="mb-6 max-w-sm text-muted-foreground">
              Crie seu primeiro chatbot de captura de leads e comece a converter visitantes em clientes.
            </p>
            <CreateChatbotDialog onCreate={handleCreate} />
          </motion.div>
        ) : (
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {chatbots.map((chatbot, index) => (
              <motion.div
                key={chatbot.id}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: index * 0.1 }}
              >
                <ChatbotCard
                  chatbot={chatbot}
                  leadCount={chatbot._count?.leads || 0}
                  onDelete={(id) => setDeleteId(id)}
                />
              </motion.div>
            ))}
          </div>
        )}
      </main>

      <AlertDialog open={!!deleteId} onOpenChange={() => setDeleteId(null)}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Excluir chatbot?</AlertDialogTitle>
            <AlertDialogDescription>
              Esta ação não pode ser desfeita. Todos os leads associados a este chatbot também serão excluídos.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel>Cancelar</AlertDialogCancel>
            <AlertDialogAction onClick={handleDelete} className="bg-destructive text-destructive-foreground hover:bg-destructive/90">
              Excluir
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
};

export default Dashboard;
