import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { X, Send } from 'lucide-react';
import type { Chatbot, Block } from '@/types/chatbot';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { useChatSession } from '@/hooks/useChatSession';

interface ChatPreviewProps {
  chatbot: Chatbot;
  isOpen: boolean;
  onClose: () => void;
}

const ChatPreview = ({ chatbot, isOpen, onClose }: ChatPreviewProps) => {
  const [inputValue, setInputValue] = useState('');
  const { currentBlock, answers, isComplete, submitAnswer, goNext, reset, interpolateMessage } = useChatSession(chatbot);

  const handleSubmit = (value?: string) => {
    const val = value || inputValue;
    if (!val.trim() && currentBlock?.type !== 'start' && currentBlock?.type !== 'message') return;
    
    if (currentBlock?.type === 'start' || currentBlock?.type === 'message' || currentBlock?.type === 'end') {
      goNext();
    } else {
      submitAnswer(val);
      setInputValue('');
    }
  };

  const handleOptionClick = (option: string) => {
    submitAnswer(option);
  };

  const handleReset = () => {
    reset();
    setInputValue('');
  };

  const getInputType = () => {
    if (!currentBlock) return 'text';
    switch (currentBlock.type) {
      case 'question-email':
        return 'email';
      case 'question-phone':
        return 'tel';
      default:
        return 'text';
    }
  };

  const renderContent = () => {
    if (!currentBlock) return null;

    if (isComplete) {
      return (
        <div className="flex flex-col items-center justify-center h-full text-center p-4">
          <span className="text-4xl mb-4">✅</span>
          <p className="text-foreground font-medium">Conversa finalizada!</p>
          <Button variant="outline" onClick={handleReset} className="mt-4">
            Reiniciar
          </Button>
        </div>
      );
    }

    const message = interpolateMessage((currentBlock.config as any).message || (currentBlock.config as any).question || '');

    return (
      <div className="flex flex-col h-full">
        <div className="flex-1 overflow-auto p-4 space-y-4">
          <motion.div
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            className="flex gap-2"
          >
            <span className="text-xl shrink-0">{chatbot.theme.avatar}</span>
            <div className="rounded-lg rounded-tl-none bg-muted p-3 max-w-[80%]">
              <p className="text-sm text-foreground">{message}</p>
            </div>
          </motion.div>

          {/* Show previous answers */}
          {Object.entries(answers).map(([key, value], index) => (
            <motion.div
              key={key}
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              className="flex justify-end"
            >
              <div className="rounded-lg rounded-tr-none p-3 max-w-[80%]" style={{ backgroundColor: chatbot.theme.primaryColor }}>
                <p className="text-sm text-white">{value}</p>
              </div>
            </motion.div>
          ))}
        </div>

        {/* Input area */}
        <div className="border-t border-border p-4">
          {(currentBlock.type === 'choice' && (currentBlock.config as any).options) ? (
            <div className="flex flex-wrap gap-2">
              {(currentBlock.config as any).options.map((option: string, index: number) => (
                <Button
                  key={index}
                  variant="outline"
                  size="sm"
                  onClick={() => handleOptionClick(option)}
                  className="transition-all hover:border-primary"
                >
                  {option}
                </Button>
              ))}
            </div>
          ) : (currentBlock.type === 'start' || currentBlock.type === 'message' || currentBlock.type === 'end') ? (
            <Button 
              onClick={() => handleSubmit()} 
              className="w-full"
              style={{ backgroundColor: chatbot.theme.primaryColor }}
            >
              {currentBlock.type === 'end' ? 'Finalizar' : 'Continuar'}
            </Button>
          ) : (
            <form
              onSubmit={(e) => {
                e.preventDefault();
                handleSubmit();
              }}
              className="flex gap-2"
            >
              <Input
                type={getInputType()}
                value={inputValue}
                onChange={(e) => setInputValue(e.target.value)}
                placeholder={(currentBlock.config as any).placeholder || 'Digite sua resposta...'}
                className="flex-1"
                autoFocus
              />
              <Button 
                type="submit" 
                size="icon"
                style={{ backgroundColor: chatbot.theme.primaryColor }}
              >
                <Send className="h-4 w-4" />
              </Button>
            </form>
          )}
        </div>
      </div>
    );
  };

  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          className="fixed inset-0 z-50 flex items-center justify-center bg-foreground/50 backdrop-blur-sm p-4"
          onClick={onClose}
        >
          <motion.div
            initial={{ scale: 0.9, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            exit={{ scale: 0.9, opacity: 0 }}
            className="w-full max-w-sm bg-card rounded-2xl shadow-xl overflow-hidden"
            style={{ height: '500px' }}
            onClick={(e) => e.stopPropagation()}
          >
            {/* Header */}
            <div 
              className="flex items-center justify-between p-4"
              style={{ backgroundColor: chatbot.theme.primaryColor }}
            >
              <div className="flex items-center gap-2">
                <span className="text-xl">{chatbot.theme.avatar}</span>
                <span className="text-white font-medium">{chatbot.theme.buttonText}</span>
              </div>
              <Button variant="ghost" size="icon" onClick={onClose} className="text-white hover:bg-white/20">
                <X className="h-5 w-5" />
              </Button>
            </div>

            {/* Content */}
            {renderContent()}
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
};

export default ChatPreview;
