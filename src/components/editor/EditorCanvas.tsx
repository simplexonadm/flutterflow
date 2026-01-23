import { useCallback, useRef, useState } from 'react';
import { v4 as uuidv4 } from 'uuid';
import type { Block, BlockType, Edge } from '@/types/chatbot';
import FlowBlock from './FlowBlock';

interface EditorCanvasProps {
  blocks: Block[];
  edges: Edge[];
  selectedBlockId: string | null;
  onSelectBlock: (id: string | null) => void;
  onUpdateBlocks: (blocks: Block[]) => void;
  onUpdateEdges: (edges: Edge[]) => void;
  draggedBlockType: BlockType | null;
}

const EditorCanvas = ({
  blocks,
  edges,
  selectedBlockId,
  onSelectBlock,
  onUpdateBlocks,
  onUpdateEdges,
  draggedBlockType,
}: EditorCanvasProps) => {
  const canvasRef = useRef<HTMLDivElement>(null);
  const [draggingBlockId, setDraggingBlockId] = useState<string | null>(null);
  const [dragOffset, setDragOffset] = useState({ x: 0, y: 0 });

  const handleCanvasDrop = useCallback(
    (e: React.DragEvent) => {
      e.preventDefault();
      
      if (!canvasRef.current || !draggedBlockType) return;
      
      const rect = canvasRef.current.getBoundingClientRect();
      const x = e.clientX - rect.left - 128;
      const y = e.clientY - rect.top - 40;

      const newBlock: Block = {
        id: uuidv4(),
        type: draggedBlockType,
        position: { x: Math.max(0, x), y: Math.max(0, y) },
        config: getDefaultConfig(draggedBlockType),
      };

      onUpdateBlocks([...blocks, newBlock]);
    },
    [blocks, draggedBlockType, onUpdateBlocks]
  );

  const handleBlockDragStart = useCallback(
    (e: React.DragEvent, blockId: string) => {
      const block = blocks.find(b => b.id === blockId);
      if (!block || !canvasRef.current) return;
      
      const rect = canvasRef.current.getBoundingClientRect();
      setDragOffset({
        x: e.clientX - rect.left - block.position.x,
        y: e.clientY - rect.top - block.position.y,
      });
      setDraggingBlockId(blockId);
    },
    [blocks]
  );

  const handleBlockDragEnd = useCallback(
    (e: React.DragEvent) => {
      if (!draggingBlockId || !canvasRef.current) return;
      
      const rect = canvasRef.current.getBoundingClientRect();
      const x = e.clientX - rect.left - dragOffset.x;
      const y = e.clientY - rect.top - dragOffset.y;

      const updatedBlocks = blocks.map(b =>
        b.id === draggingBlockId
          ? { ...b, position: { x: Math.max(0, x), y: Math.max(0, y) } }
          : b
      );

      onUpdateBlocks(updatedBlocks);
      setDraggingBlockId(null);
    },
    [blocks, draggingBlockId, dragOffset, onUpdateBlocks]
  );

  const handleDeleteBlock = useCallback(
    (blockId: string) => {
      const block = blocks.find(b => b.id === blockId);
      if (!block || block.type === 'start') return;

      onUpdateBlocks(blocks.filter(b => b.id !== blockId));
      onUpdateEdges(edges.filter(e => e.source !== blockId && e.target !== blockId));
      onSelectBlock(null);
    },
    [blocks, edges, onUpdateBlocks, onUpdateEdges, onSelectBlock]
  );

  // Draw connection lines
  const renderEdges = () => {
    return edges.map(edge => {
      const sourceBlock = blocks.find(b => b.id === edge.source);
      const targetBlock = blocks.find(b => b.id === edge.target);
      
      if (!sourceBlock || !targetBlock) return null;

      const sourceX = sourceBlock.position.x + 128;
      const sourceY = sourceBlock.position.y + 80;
      const targetX = targetBlock.position.x + 128;
      const targetY = targetBlock.position.y;

      const midY = (sourceY + targetY) / 2;

      return (
        <svg
          key={edge.id}
          className="pointer-events-none absolute inset-0 h-full w-full"
          style={{ zIndex: 0 }}
        >
          <path
            d={`M ${sourceX} ${sourceY} C ${sourceX} ${midY}, ${targetX} ${midY}, ${targetX} ${targetY}`}
            fill="none"
            stroke="hsl(var(--border))"
            strokeWidth="2"
            strokeDasharray="none"
          />
          <circle cx={targetX} cy={targetY} r="4" fill="hsl(var(--border))" />
        </svg>
      );
    });
  };

  return (
    <div
      ref={canvasRef}
      className="relative flex-1 overflow-auto canvas-grid bg-muted/30"
      onDragOver={(e) => e.preventDefault()}
      onDrop={handleCanvasDrop}
      onClick={() => onSelectBlock(null)}
    >
      <div className="relative min-h-full min-w-full p-8" style={{ minHeight: '800px', minWidth: '800px' }}>
        {renderEdges()}
        
        {blocks.map(block => (
          <FlowBlock
            key={block.id}
            block={block}
            isSelected={selectedBlockId === block.id}
            onSelect={() => onSelectBlock(block.id)}
            onDelete={() => handleDeleteBlock(block.id)}
            onDragStart={(e) => handleBlockDragStart(e, block.id)}
            onDragEnd={handleBlockDragEnd}
          />
        ))}
      </div>
    </div>
  );
};

const getDefaultConfig = (type: BlockType): Block['config'] => {
  switch (type) {
    case 'start':
      return { message: 'Olá! Como posso ajudar?' };
    case 'message':
      return { message: 'Digite sua mensagem aqui' };
    case 'question-text':
      return { question: 'Qual é o seu nome?', variableName: 'nome', placeholder: 'Digite aqui' };
    case 'question-email':
      return { question: 'Qual é o seu email?', variableName: 'email', placeholder: 'seu@email.com' };
    case 'question-phone':
      return { question: 'Qual é o seu telefone?', variableName: 'telefone', placeholder: '(00) 00000-0000' };
    case 'choice':
      return { question: 'Escolha uma opção:', variableName: 'escolha', options: ['Opção 1', 'Opção 2'] };
    case 'condition':
      return { conditionVariable: '', conditionValue: '' };
    case 'end':
      return { message: 'Obrigado pelo contato!' };
    default:
      return {};
  }
};

export default EditorCanvas;
