import { useMemo } from 'react';
import { Play, MessageSquare, Type, Mail, Phone, ListChecks, GitBranch, CheckCircle } from 'lucide-react';
import { motion } from 'framer-motion';
import { BLOCK_METADATA, type BlockType } from '@/types/chatbot';

interface BlockLibraryProps {
  onDragStart: (type: BlockType) => void;
}

const iconMap: Record<string, React.ElementType> = {
  Play,
  MessageSquare,
  Type,
  Mail,
  Phone,
  ListChecks,
  GitBranch,
  CheckCircle,
};

const colorMap: Record<string, string> = {
  'block-start': 'bg-success',
  'block-message': 'bg-primary',
  'block-question': 'bg-purple-500',
  'block-email': 'bg-info',
  'block-phone': 'bg-warning',
  'block-choice': 'bg-pink-500',
  'block-condition': 'bg-orange-500',
  'block-end': 'bg-destructive',
};

const BlockLibrary = ({ onDragStart }: BlockLibraryProps) => {
  return (
    <div className="flex h-full flex-col border-r border-border bg-card">
      <div className="border-b border-border p-4">
        <h2 className="font-display font-semibold text-foreground">Blocos</h2>
        <p className="text-xs text-muted-foreground">Arraste para o canvas</p>
      </div>
      
      <div className="flex-1 overflow-auto p-3">
        <div className="space-y-2">
          {BLOCK_METADATA.map((block, index) => {
            const Icon = iconMap[block.icon];
            
            return (
              <motion.div
                key={block.type}
                initial={{ opacity: 0, x: -20 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ delay: index * 0.05 }}
                draggable
                onDragStart={() => onDragStart(block.type)}
                className="group flex cursor-grab items-center gap-3 rounded-lg border border-border bg-background p-3 transition-all hover:border-primary/30 hover:shadow-md active:cursor-grabbing"
              >
                <div className={`flex h-8 w-8 items-center justify-center rounded-md ${colorMap[block.color]} text-white`}>
                  {Icon && <Icon className="h-4 w-4" />}
                </div>
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-foreground">{block.label}</p>
                  <p className="text-xs text-muted-foreground truncate">{block.description}</p>
                </div>
              </motion.div>
            );
          })}
        </div>
      </div>
    </div>
  );
};

export default BlockLibrary;
