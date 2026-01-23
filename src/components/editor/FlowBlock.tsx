import { Play, MessageSquare, Type, Mail, Phone, ListChecks, GitBranch, CheckCircle, GripVertical, Trash2 } from 'lucide-react';
import { motion } from 'framer-motion';
import type { Block } from '@/types/chatbot';
import { Button } from '@/components/ui/button';

interface FlowBlockProps {
  block: Block;
  isSelected: boolean;
  onSelect: () => void;
  onDelete: () => void;
  onDragStart: (e: React.DragEvent) => void;
  onDragEnd: (e: React.DragEvent) => void;
}

const iconMap: Record<string, React.ElementType> = {
  start: Play,
  message: MessageSquare,
  'question-text': Type,
  'question-email': Mail,
  'question-phone': Phone,
  choice: ListChecks,
  condition: GitBranch,
  end: CheckCircle,
};

const colorMap: Record<string, string> = {
  start: 'border-success bg-success/10',
  message: 'border-primary bg-primary/10',
  'question-text': 'border-purple-500 bg-purple-500/10',
  'question-email': 'border-info bg-info/10',
  'question-phone': 'border-warning bg-warning/10',
  choice: 'border-pink-500 bg-pink-500/10',
  condition: 'border-orange-500 bg-orange-500/10',
  end: 'border-destructive bg-destructive/10',
};

const labelMap: Record<string, string> = {
  start: 'Início',
  message: 'Mensagem',
  'question-text': 'Texto',
  'question-email': 'Email',
  'question-phone': 'Telefone',
  choice: 'Escolha',
  condition: 'Condição',
  end: 'Fim',
};

const FlowBlock = ({ block, isSelected, onSelect, onDelete, onDragStart, onDragEnd }: FlowBlockProps) => {
  const Icon = iconMap[block.type];
  const colorClass = colorMap[block.type];
  const label = labelMap[block.type];

  const getPreviewText = () => {
    if (block.config.message) return block.config.message;
    if (block.config.question) return block.config.question;
    if (block.config.options) return block.config.options.join(', ');
    return 'Configurar...';
  };

  return (
    <div
      className={`absolute w-64 cursor-pointer rounded-lg border-2 bg-card shadow-md transition-all ${colorClass} ${
        isSelected ? 'ring-2 ring-primary ring-offset-2' : 'hover:shadow-lg'
      } group`}
      style={{ left: block.position.x, top: block.position.y }}
      onClick={(e) => {
        e.stopPropagation();
        onSelect();
      }}
      draggable
      onDragStart={onDragStart}
      onDragEnd={onDragEnd}
    >
      <div className="flex items-center gap-2 border-b border-border/50 px-3 py-2">
        <GripVertical className="h-4 w-4 text-muted-foreground cursor-grab" />
        {Icon && <Icon className="h-4 w-4" />}
        <span className="text-sm font-medium">{label}</span>
        {block.type !== 'start' && (
          <Button
            variant="ghost"
            size="icon"
            className="ml-auto h-6 w-6 opacity-0 group-hover:opacity-100 hover:bg-destructive/10 hover:text-destructive"
            onClick={(e) => {
              e.stopPropagation();
              onDelete();
            }}
          >
            <Trash2 className="h-3 w-3" />
          </Button>
        )}
      </div>
      <div className="p-3">
        <p className="text-xs text-muted-foreground line-clamp-2">{getPreviewText()}</p>
        {block.config.variableName && (
          <span className="mt-2 inline-block rounded bg-muted px-1.5 py-0.5 text-xs font-mono text-muted-foreground">
            {`{{${block.config.variableName}}}`}
          </span>
        )}
      </div>
      
      {/* Connection points */}
      {block.type !== 'end' && (
        <div className="absolute -bottom-2 left-1/2 h-4 w-4 -translate-x-1/2 rounded-full border-2 border-border bg-card" />
      )}
      {block.type !== 'start' && (
        <div className="absolute -top-2 left-1/2 h-4 w-4 -translate-x-1/2 rounded-full border-2 border-border bg-card" />
      )}
    </div>
  );
};

export default FlowBlock;
