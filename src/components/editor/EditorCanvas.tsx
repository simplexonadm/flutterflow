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
  onUpdateContent: (blocks: Block[], edges: Edge[]) => void;
  draggedBlockType: BlockType | null;
}

const EditorCanvas = ({
  blocks,
  edges,
  selectedBlockId,
  onSelectBlock,
  onUpdateBlocks,
  onUpdateEdges,
  onUpdateContent,
  draggedBlockType,
}: EditorCanvasProps) => {
  const canvasRef = useRef<HTMLDivElement>(null);
  const [draggingBlockId, setDraggingBlockId] = useState<string | null>(null);
  const [dragOffset, setDragOffset] = useState({ x: 0, y: 0 });
  const [connectingFromId, setConnectingFromId] = useState<string | null>(null);
  const [mousePos, setMousePos] = useState({ x: 0, y: 0 });

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
      console.log('🗑️ DELETE INICIADO para bloco:', blockId);
      console.log('📊 Blocos ANTES:', blocks.map(b => b.id));
      
      const block = blocks.find(b => b.id === blockId);
      
      if (!block) {
        console.error('❌ Bloco não encontrado!');
        return;
      }
      
      if (block.type === 'start') {
        console.warn('⚠️ Não pode deletar bloco de início');
        return;
      }

      const updatedBlocks = blocks.filter(b => b.id !== blockId);
      const updatedEdges = edges.filter(e => e.source !== blockId && e.target !== blockId);
      
      console.log('📊 Blocos DEPOIS:', updatedBlocks.map(b => b.id));
      console.log('📊 Bloco foi removido?', !updatedBlocks.find(b => b.id === blockId));
      console.log('🔌 Edges antes:', edges.length, '| depois:', updatedEdges.length);
      
      console.log('📤 Chamando onUpdateContent com', updatedBlocks.length, 'blocos e', updatedEdges.length, 'edges');
      onUpdateContent(updatedBlocks, updatedEdges);
      
      onSelectBlock(null);
      console.log('✅ DELETE COMPLETADO');
    },
    [blocks, edges, onUpdateBlocks, onUpdateEdges, onSelectBlock]
  );

  const handleConnectionStart = useCallback((blockId: string) => {
    setConnectingFromId(blockId);
  }, []);

  const handleConnectionEnd = useCallback((targetBlockId: string) => {
    if (!connectingFromId || connectingFromId === targetBlockId) {
      setConnectingFromId(null);
      return;
    }

    const existingEdge = edges.find(
      e => e.source === connectingFromId && e.target === targetBlockId
    );
    
    if (!existingEdge) {
      const newEdge: Edge = {
        id: uuidv4(),
        source: connectingFromId,
        target: targetBlockId,
      };
      onUpdateEdges([...edges, newEdge]);
    }

    setConnectingFromId(null);
  }, [connectingFromId, edges, onUpdateEdges]);

  const handleCanvasClick = useCallback(() => {
    onSelectBlock(null);
    setConnectingFromId(null);
  }, [onSelectBlock]);

  const handleMouseMove = useCallback((e: React.MouseEvent) => {
    if (connectingFromId && canvasRef.current) {
      const rect = canvasRef.current.getBoundingClientRect();
      setMousePos({
        x: e.clientX - rect.left,
        y: e.clientY - rect.top,
      });
    }
  }, [connectingFromId]);

  const handleDeleteEdge = useCallback((edgeId: string) => {
    onUpdateEdges(edges.filter(e => e.id !== edgeId));
  }, [edges, onUpdateEdges]);

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
            className="pointer-events-auto cursor-pointer hover:stroke-destructive transition-colors"
            onClick={(e) => {
              e.stopPropagation();
              handleDeleteEdge(edge.id);
            }}
            data-testid={`edge-${edge.id}`}
          />
          <circle cx={targetX} cy={targetY} r="4" fill="hsl(var(--border))" />
        </svg>
      );
    });
  };

  const renderConnectingLine = () => {
    if (!connectingFromId) return null;

    const sourceBlock = blocks.find(b => b.id === connectingFromId);
    if (!sourceBlock) return null;

    const sourceX = sourceBlock.position.x + 128;
    const sourceY = sourceBlock.position.y + 80;
    const targetX = mousePos.x;
    const targetY = mousePos.y;

    const midY = (sourceY + targetY) / 2;

    return (
      <svg
        className="pointer-events-none absolute inset-0 h-full w-full"
        style={{ zIndex: 5 }}
      >
        <path
          d={`M ${sourceX} ${sourceY} C ${sourceX} ${midY}, ${targetX} ${midY}, ${targetX} ${targetY}`}
          fill="none"
          stroke="hsl(var(--primary))"
          strokeWidth="2"
          strokeDasharray="8 4"
          className="animate-pulse"
        />
        <circle cx={targetX} cy={targetY} r="6" fill="hsl(var(--primary))" className="animate-pulse" />
      </svg>
    );
  };

  return (
    <div
      ref={canvasRef}
      className="relative flex-1 overflow-auto canvas-grid bg-muted/30"
      onDragOver={(e) => e.preventDefault()}
      onDrop={handleCanvasDrop}
      onClick={handleCanvasClick}
      onMouseMove={handleMouseMove}
      data-testid="editor-canvas"
    >
      {connectingFromId && (
        <div className="absolute top-4 left-1/2 -translate-x-1/2 z-50 bg-primary text-primary-foreground px-4 py-2 rounded-full text-sm font-medium shadow-lg animate-bounce">
          Clique no ponto de entrada de outro bloco para conectar
        </div>
      )}
      
      <div className="relative min-h-full min-w-full p-8" style={{ minHeight: '800px', minWidth: '800px' }}>
        {renderEdges()}
        {renderConnectingLine()}
        
        {blocks.map(block => (
          <FlowBlock
            key={block.id}
            block={block}
            isSelected={selectedBlockId === block.id}
            onSelect={() => onSelectBlock(block.id)}
            onDelete={() => handleDeleteBlock(block.id)}
            onDragStart={(e) => handleBlockDragStart(e, block.id)}
            onDragEnd={handleBlockDragEnd}
            onConnectionStart={handleConnectionStart}
            onConnectionEnd={handleConnectionEnd}
            isConnecting={!!connectingFromId}
            connectingFromId={connectingFromId}
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
