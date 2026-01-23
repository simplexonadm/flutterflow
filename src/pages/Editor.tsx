import { useState, useCallback } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import { ArrowLeft, Eye, Send, Save } from 'lucide-react';
import { motion } from 'framer-motion';
import Header from '@/components/layout/Header';
import BlockLibrary from '@/components/editor/BlockLibrary';
import EditorCanvas from '@/components/editor/EditorCanvas';
import BlockConfigPanel from '@/components/editor/BlockConfigPanel';
import ChatPreview from '@/components/editor/ChatPreview';
import PublishDialog from '@/components/editor/PublishDialog';
import { useChatbot } from '@/hooks/useMockApi';
import type { BlockType, Block, ChatbotTheme } from '@/types/chatbot';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Skeleton } from '@/components/ui/skeleton';
import { toast } from 'sonner';

const Editor = () => {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const { chatbot, loading, updateBlocks, publishChatbot, setChatbot } = useChatbot(id);
  
  const [draggedBlockType, setDraggedBlockType] = useState<BlockType | null>(null);
  const [selectedBlockId, setSelectedBlockId] = useState<string | null>(null);
  const [showPreview, setShowPreview] = useState(false);
  const [showPublish, setShowPublish] = useState(false);
  const [isSaving, setIsSaving] = useState(false);

  const selectedBlock = chatbot?.blocks.find(b => b.id === selectedBlockId) || null;

  const handleDragStart = useCallback((type: BlockType) => {
    setDraggedBlockType(type);
  }, []);

  const handleUpdateBlocks = useCallback(async (blocks: Block[]) => {
    if (!chatbot) return;
    await updateBlocks(blocks, chatbot.edges);
    setDraggedBlockType(null);
  }, [chatbot, updateBlocks]);

  const handleUpdateEdges = useCallback(async (edges: typeof chatbot.edges) => {
    if (!chatbot) return;
    await updateBlocks(chatbot.blocks, edges);
  }, [chatbot, updateBlocks]);

  const handleUpdateBlockConfig = useCallback((config: Block['config']) => {
    if (!chatbot || !selectedBlockId) return;
    
    const updatedBlocks = chatbot.blocks.map(b =>
      b.id === selectedBlockId ? { ...b, config } : b
    );
    updateBlocks(updatedBlocks, chatbot.edges);
  }, [chatbot, selectedBlockId, updateBlocks]);

  const handlePublish = useCallback(async (theme: ChatbotTheme) => {
    await publishChatbot(theme);
    toast.success('Chatbot publicado com sucesso!');
  }, [publishChatbot]);

  const handleNameChange = useCallback((name: string) => {
    if (!chatbot) return;
    setChatbot({ ...chatbot, name });
  }, [chatbot, setChatbot]);

  const handleSave = useCallback(async () => {
    if (!chatbot) return;
    setIsSaving(true);
    try {
      await updateBlocks(chatbot.blocks, chatbot.edges);
      toast.success('Alterações salvas!');
    } finally {
      setIsSaving(false);
    }
  }, [chatbot, updateBlocks]);

  if (loading) {
    return (
      <div className="flex h-screen flex-col bg-background">
        <Header />
        <div className="flex flex-1 items-center justify-center">
          <Skeleton className="h-96 w-96 rounded-lg" />
        </div>
      </div>
    );
  }

  if (!chatbot) {
    return (
      <div className="flex h-screen flex-col bg-background">
        <Header />
        <div className="flex flex-1 flex-col items-center justify-center gap-4">
          <p className="text-muted-foreground">Chatbot não encontrado</p>
          <Button asChild>
            <Link to="/">Voltar ao Dashboard</Link>
          </Button>
        </div>
      </div>
    );
  }

  return (
    <div className="flex h-screen flex-col bg-background">
      {/* Editor Header */}
      <header className="flex h-14 items-center justify-between border-b border-border bg-card px-4">
        <div className="flex items-center gap-4">
          <Button variant="ghost" size="icon" asChild>
            <Link to="/">
              <ArrowLeft className="h-5 w-5" />
            </Link>
          </Button>
          <Input
            value={chatbot.name}
            onChange={(e) => handleNameChange(e.target.value)}
            className="max-w-xs border-none bg-transparent font-display font-semibold focus-visible:ring-0"
          />
        </div>
        
        <div className="flex items-center gap-2">
          <Button variant="outline" onClick={handleSave} disabled={isSaving}>
            <Save className="mr-2 h-4 w-4" />
            {isSaving ? 'Salvando...' : 'Salvar'}
          </Button>
          <Button variant="outline" onClick={() => setShowPreview(true)}>
            <Eye className="mr-2 h-4 w-4" />
            Preview
          </Button>
          <Button onClick={() => setShowPublish(true)} className="gradient-primary">
            <Send className="mr-2 h-4 w-4" />
            Publicar
          </Button>
        </div>
      </header>

      {/* Editor Content */}
      <div className="flex flex-1 overflow-hidden">
        {/* Left Sidebar - Block Library */}
        <div className="w-64 shrink-0">
          <BlockLibrary onDragStart={handleDragStart} />
        </div>

        {/* Canvas */}
        <EditorCanvas
          blocks={chatbot.blocks}
          edges={chatbot.edges}
          selectedBlockId={selectedBlockId}
          onSelectBlock={setSelectedBlockId}
          onUpdateBlocks={handleUpdateBlocks}
          onUpdateEdges={handleUpdateEdges}
          draggedBlockType={draggedBlockType}
        />

        {/* Right Sidebar - Block Config */}
        <div className="w-80 shrink-0">
          <BlockConfigPanel
            block={selectedBlock}
            onUpdate={handleUpdateBlockConfig}
          />
        </div>
      </div>

      {/* Modals */}
      <ChatPreview
        chatbot={chatbot}
        isOpen={showPreview}
        onClose={() => setShowPreview(false)}
      />

      <PublishDialog
        chatbot={chatbot}
        isOpen={showPublish}
        onClose={() => setShowPublish(false)}
        onPublish={handlePublish}
      />
    </div>
  );
};

export default Editor;
