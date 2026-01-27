import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { Card, CardContent, CardHeader } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { ArrowLeft, Send, CheckCircle, Loader2 } from 'lucide-react';
import type { Block } from '@/types/chatbot';
import { useChatbot } from '@/hooks/useChatbot';
import { useLeadCapture } from '@/hooks/useLeadCapture';

const FormView = () => {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const { user } = useAuth();
  const { chatbot, loading, fetchPublicChatbot } = useChatbot(id);
  const { leadId, startLead, updateLeadAnswers } = useLeadCapture(id);
  
  const [currentBlockIndex, setCurrentBlockIndex] = useState(0);
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [currentInput, setCurrentInput] = useState('');
  const [isComplete, setIsComplete] = useState(false);
  const [messages, setMessages] = useState<{ type: 'bot' | 'user'; text: string }[]>([]);

  useEffect(() => {
    fetchPublicChatbot();
  }, [fetchPublicChatbot]);

  useEffect(() => {
    if (chatbot && messages.length === 0) {
      const orderedBlocks = [...chatbot.blocks].sort((a, b) => a.position.y - b.position.y);
      const startBlock = orderedBlocks[0];
      if (startBlock?.config.message) {
        setMessages([{ type: 'bot', text: startBlock.config.message }]);
      }
      startLead();
    }
  }, [chatbot, messages.length, startLead]);

  if (loading) {
    return (
      <div className="flex h-screen items-center justify-center">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
      </div>
    );
  }

  if (!chatbot) {
    return (
      <div className="flex h-screen flex-col items-center justify-center gap-4">
        <p className="text-muted-foreground">Formulário não encontrado</p>
        <Button onClick={() => navigate('/forms')}>
          <ArrowLeft className="mr-2 h-4 w-4" />
          Voltar
        </Button>
      </div>
    );
  }

  const orderedBlocks = [...chatbot.blocks].sort((a, b) => a.position.y - b.position.y);
  const currentBlock = orderedBlocks[currentBlockIndex + 1];

  const replaceVariables = (text: string): string => {
    return text.replace(/\{\{(\w+)\}\}/g, (_, varName) => answers[varName] || `{{${varName}}}`);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!currentInput.trim() || !currentBlock) return;

    setMessages(prev => [...prev, { type: 'user', text: currentInput }]);
    
    const newAnswers = { ...answers };
    if (currentBlock.config.variableName) {
      newAnswers[currentBlock.config.variableName] = currentInput;
      setAnswers(newAnswers);
    }

    setCurrentInput('');

    const nextIndex = currentBlockIndex + 2;
    const nextBlock = orderedBlocks[nextIndex];

    if (nextBlock) {
      setTimeout(() => {
        const botMessage = nextBlock.config.message || nextBlock.config.question || '';
        setMessages(prev => [...prev, { type: 'bot', text: replaceVariables(botMessage) }]);
        setCurrentBlockIndex(prev => prev + 1);
        
        if (nextBlock.type === 'end') {
          setIsComplete(true);
          updateLeadAnswers(newAnswers, 'COMPLETED');
        } else {
          updateLeadAnswers(newAnswers, 'STARTED');
        }
      }, 500);
    } else {
      setIsComplete(true);
      updateLeadAnswers(newAnswers, 'COMPLETED');
    }
  };

  const handleChoiceClick = (option: string) => {
    if (!currentBlock) return;

    setMessages(prev => [...prev, { type: 'user', text: option }]);
    
    const newAnswers = { ...answers };
    if (currentBlock.config.variableName) {
      newAnswers[currentBlock.config.variableName] = option;
      setAnswers(newAnswers);
    }

    const nextIndex = currentBlockIndex + 2;
    const nextBlock = orderedBlocks[nextIndex];

    if (nextBlock) {
      setTimeout(() => {
        const botMessage = nextBlock.config.message || nextBlock.config.question || '';
        setMessages(prev => [...prev, { type: 'bot', text: replaceVariables(botMessage) }]);
        setCurrentBlockIndex(prev => prev + 1);
        
        if (nextBlock.type === 'end') {
          setIsComplete(true);
          updateLeadAnswers(newAnswers, 'COMPLETED');
        } else {
          updateLeadAnswers(newAnswers, 'STARTED');
        }
      }, 500);
    } else {
      setIsComplete(true);
      updateLeadAnswers(newAnswers, 'COMPLETED');
    }
  };

  const getInputType = (block: Block) => {
    switch (block.type) {
      case 'question-email':
        return 'email';
      case 'question-phone':
        return 'tel';
      default:
        return 'text';
    }
  };

  return (
    <div className="min-h-screen bg-muted/30">
      <header className="border-b border-border bg-card">
        <div className="container mx-auto flex h-14 items-center gap-4 px-4">
          <Button variant="ghost" size="icon" onClick={() => navigate('/forms')} data-testid="button-back">
            <ArrowLeft className="h-4 w-4" />
          </Button>
          <div className="flex items-center gap-2">
            <span className="text-xl">{chatbot.theme.avatar}</span>
            <span className="font-medium">{chatbot.name}</span>
          </div>
        </div>
      </header>

      <main className="container mx-auto max-w-2xl px-4 py-8">
        <Card>
          <CardHeader className="border-b border-border">
            <div className="flex items-center gap-3">
              <span className="text-3xl">{chatbot.theme.avatar}</span>
              <div>
                <h2 className="font-semibold">{chatbot.name}</h2>
                <p className="text-sm text-muted-foreground">
                  {isComplete ? 'Concluído' : `Etapa ${currentBlockIndex + 1} de ${orderedBlocks.length - 1}`}
                </p>
              </div>
            </div>
          </CardHeader>
          
          <CardContent className="p-0">
            <div className="h-96 overflow-y-auto p-4 space-y-4">
              {messages.map((msg, i) => (
                <div
                  key={i}
                  className={`flex ${msg.type === 'user' ? 'justify-end' : 'justify-start'}`}
                >
                  <div
                    className={`max-w-[80%] rounded-lg px-4 py-2 ${
                      msg.type === 'user'
                        ? 'bg-primary text-primary-foreground'
                        : 'bg-muted'
                    }`}
                    data-testid={`message-${msg.type}-${i}`}
                  >
                    {msg.text}
                  </div>
                </div>
              ))}
              
              {isComplete && (
                <div className="flex justify-center py-4">
                  <div className="flex items-center gap-2 text-success">
                    <CheckCircle className="h-5 w-5" />
                    <span className="font-medium">Formulário concluído!</span>
                  </div>
                </div>
              )}
            </div>
            
            {!isComplete && currentBlock && (
              <div className="border-t border-border p-4">
                {currentBlock.type === 'choice' && currentBlock.config.options ? (
                  <div className="flex flex-wrap gap-2">
                    {currentBlock.config.options.map((option, i) => (
                      <Button
                        key={i}
                        variant="outline"
                        onClick={() => handleChoiceClick(option)}
                        data-testid={`button-choice-${i}`}
                      >
                        {option}
                      </Button>
                    ))}
                  </div>
                ) : currentBlock.type !== 'end' && currentBlock.type !== 'start' && currentBlock.type !== 'message' ? (
                  <form onSubmit={handleSubmit} className="flex gap-2">
                    <Input
                      type={getInputType(currentBlock)}
                      placeholder={currentBlock.config.placeholder || 'Digite sua resposta...'}
                      value={currentInput}
                      onChange={(e) => setCurrentInput(e.target.value)}
                      className="flex-1"
                      data-testid="input-answer"
                    />
                    <Button type="submit" size="icon" data-testid="button-send">
                      <Send className="h-4 w-4" />
                    </Button>
                  </form>
                ) : null}
              </div>
            )}
          </CardContent>
        </Card>
      </main>
    </div>
  );
};

export default FormView;
