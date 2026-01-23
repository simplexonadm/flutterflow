import { BarChart3, Edit3, Eye, MoreVertical, Trash2 } from 'lucide-react';
import { motion } from 'framer-motion';
import { Link } from 'react-router-dom';
import type { Chatbot } from '@/types/chatbot';
import { Card, CardContent, CardFooter, CardHeader } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';

interface ChatbotCardProps {
  chatbot: Chatbot;
  leadCount: number;
  onDelete: (id: string) => void;
}

const ChatbotCard = ({ chatbot, leadCount, onDelete }: ChatbotCardProps) => {
  const formattedDate = new Date(chatbot.updatedAt).toLocaleDateString('pt-BR', {
    day: '2-digit',
    month: 'short',
  });

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.3 }}
    >
      <Card className="group relative overflow-hidden transition-all duration-300 hover:shadow-lg hover:shadow-primary/5 hover:border-primary/20">
        <div 
          className="absolute inset-x-0 top-0 h-1 transition-all duration-300 group-hover:h-1.5"
          style={{ backgroundColor: chatbot.theme.primaryColor }}
        />
        
        <CardHeader className="flex flex-row items-start justify-between space-y-0 pb-2">
          <div className="flex items-center gap-3">
            <span className="text-2xl">{chatbot.theme.avatar}</span>
            <div>
              <h3 className="font-display font-semibold text-foreground line-clamp-1">
                {chatbot.name}
              </h3>
              <p className="text-xs text-muted-foreground">
                Atualizado em {formattedDate}
              </p>
            </div>
          </div>
          
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <Button variant="ghost" size="icon" className="h-8 w-8">
                <MoreVertical className="h-4 w-4" />
              </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end">
              <DropdownMenuItem 
                className="text-destructive focus:text-destructive"
                onClick={() => onDelete(chatbot.id)}
              >
                <Trash2 className="mr-2 h-4 w-4" />
                Excluir
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        </CardHeader>
        
        <CardContent className="pb-3">
          <div className="flex items-center gap-4">
            <div className="flex items-center gap-1.5 text-sm text-muted-foreground">
              <BarChart3 className="h-4 w-4" />
              <span className="font-medium text-foreground">{leadCount}</span>
              <span>leads</span>
            </div>
            <Badge 
              variant={chatbot.isPublished ? "default" : "secondary"}
              className={chatbot.isPublished ? "bg-success hover:bg-success" : ""}
            >
              {chatbot.isPublished ? '✓ Publicado' : '⚠️ Rascunho'}
            </Badge>
          </div>
        </CardContent>
        
        <CardFooter className="gap-2 pt-0">
          <Button asChild variant="outline" size="sm" className="flex-1">
            <Link to={`/editor/${chatbot.id}`}>
              <Edit3 className="mr-2 h-4 w-4" />
              Editar
            </Link>
          </Button>
          <Button asChild variant="outline" size="sm" className="flex-1">
            <Link to={`/results/${chatbot.id}`}>
              <Eye className="mr-2 h-4 w-4" />
              Ver
            </Link>
          </Button>
        </CardFooter>
      </Card>
    </motion.div>
  );
};

export default ChatbotCard;
