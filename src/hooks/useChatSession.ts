import { useState, useCallback } from 'react';
import type { Chatbot } from '@/types/chatbot';

export const useChatSession = (chatbot: Chatbot | null) => {
  const [currentBlockIndex, setCurrentBlockIndex] = useState(0);
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [isComplete, setIsComplete] = useState(false);

  const orderedBlocks = chatbot?.blocks.slice().sort((a, b) => a.position.y - b.position.y) || [];
  const currentBlock = orderedBlocks[currentBlockIndex];

  const submitAnswer = useCallback((value: string) => {
    if (!currentBlock) return;

    const variableName = currentBlock.config.variableName;
    if (variableName) {
      setAnswers(prev => ({ ...prev, [variableName]: value }));
    }

    if (currentBlockIndex < orderedBlocks.length - 1) {
      setCurrentBlockIndex(prev => prev + 1);
    } else {
      setIsComplete(true);
    }
  }, [currentBlock, currentBlockIndex, orderedBlocks.length]);

  const goNext = useCallback(() => {
    if (currentBlockIndex < orderedBlocks.length - 1) {
      setCurrentBlockIndex(prev => prev + 1);
    } else {
      setIsComplete(true);
    }
  }, [currentBlockIndex, orderedBlocks.length]);

  const reset = useCallback(() => {
    setCurrentBlockIndex(0);
    setAnswers({});
    setIsComplete(false);
  }, []);

  const interpolateMessage = useCallback((message: string) => {
    return message.replace(/\{\{(\w+)\}\}/g, (_, key) => answers[key] || `{{${key}}}`);
  }, [answers]);

  return {
    currentBlock,
    currentBlockIndex,
    totalBlocks: orderedBlocks.length,
    answers,
    isComplete,
    submitAnswer,
    goNext,
    reset,
    interpolateMessage,
  };
};
