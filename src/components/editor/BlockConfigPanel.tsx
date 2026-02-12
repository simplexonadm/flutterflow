import type { Block } from '@/types/chatbot';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Textarea } from '@/components/ui/textarea';
import { Button } from '@/components/ui/button';
import { Plus, Trash2 } from 'lucide-react';

interface BlockConfigPanelProps {
  block: Block | null;
  onUpdate: (config: Block['config']) => void;
}

const BlockConfigPanel = ({ block, onUpdate }: BlockConfigPanelProps) => {
  if (!block) {
    return (
      <div className="flex h-full flex-col border-l border-border bg-card">
        <div className="border-b border-border p-4">
          <h2 className="font-display font-semibold text-foreground">Configurar</h2>
        </div>
        <div className="flex flex-1 items-center justify-center p-4 text-center">
          <p className="text-sm text-muted-foreground">
            Selecione um bloco para configurar
          </p>
        </div>
      </div>
    );
  }

  const handleChange = (key: string, value: string | string[]) => {
    onUpdate({ ...block.config, [key]: value });
  };

  const renderFields = () => {
    switch (block.type) {
      case 'start':
      case 'message':
      case 'end':
        return (
          <div className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="message">Mensagem</Label>
              <Textarea
                id="message"
                value={block.config.message || ''}
                onChange={(e) => handleChange('message', e.target.value)}
                placeholder="Digite a mensagem..."
                rows={4}
              />
              <p className="text-xs text-muted-foreground">
                Use {`{{variavel}}`} para inserir respostas anteriores
              </p>
            </div>
          </div>
        );

      case 'question-text':
      case 'question-email':
      case 'question-phone':
        return (
          <div className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="question">Pergunta</Label>
              <Textarea
                id="question"
                value={block.config.question || ''}
                onChange={(e) => handleChange('question', e.target.value)}
                placeholder="Digite a pergunta..."
                rows={3}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="variableName">Nome da Variável</Label>
              <Input
                id="variableName"
                value={block.config.variableName || ''}
                onChange={(e) => handleChange('variableName', e.target.value.toLowerCase().replace(/\s/g, '_'))}
                placeholder="ex: nome, email, telefone"
              />
              <p className="text-xs text-muted-foreground">
                Use esta variável em mensagens: {`{{${block.config.variableName || 'variavel'}}}`}
              </p>
            </div>
            <div className="space-y-2">
              <Label htmlFor="placeholder">Placeholder</Label>
              <Input
                id="placeholder"
                value={block.config.placeholder || ''}
                onChange={(e) => handleChange('placeholder', e.target.value)}
                placeholder="Texto de ajuda no campo"
              />
            </div>
          </div>
        );

      case 'choice': {
        const options = block.config.options || ['Opção 1', 'Opção 2'];
        
        return (
          <div className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="question">Pergunta</Label>
              <Textarea
                id="question"
                value={block.config.question || ''}
                onChange={(e) => handleChange('question', e.target.value)}
                placeholder="Digite a pergunta..."
                rows={2}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="variableName">Nome da Variável</Label>
              <Input
                id="variableName"
                value={block.config.variableName || ''}
                onChange={(e) => handleChange('variableName', e.target.value.toLowerCase().replace(/\s/g, '_'))}
                placeholder="ex: interesse"
              />
            </div>
            <div className="space-y-2">
              <Label>Opções</Label>
              <div className="space-y-2">
                {options.map((option, index) => (
                  <div key={index} className="flex gap-2">
                    <Input
                      value={option}
                      onChange={(e) => {
                        const newOptions = [...options];
                        newOptions[index] = e.target.value;
                        handleChange('options', newOptions);
                      }}
                      placeholder={`Opção ${index + 1}`}
                    />
                    {options.length > 2 && (
                      <Button
                        variant="ghost"
                        size="icon"
                        onClick={() => {
                          const newOptions = options.filter((_, i) => i !== index);
                          handleChange('options', newOptions);
                        }}
                      >
                        <Trash2 className="h-4 w-4" />
                      </Button>
                    )}
                  </div>
                ))}
              </div>
              {options.length < 5 && (
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => handleChange('options', [...options, `Opção ${options.length + 1}`])}
                  className="w-full"
                >
                  <Plus className="mr-2 h-4 w-4" />
                  Adicionar Opção
                </Button>
              )}
            </div>
          </div>
        );
      }

      case 'condition':
        return (
          <div className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="conditionVariable">Variável para Verificar</Label>
              <Input
                id="conditionVariable"
                value={block.config.conditionVariable || ''}
                onChange={(e) => handleChange('conditionVariable', e.target.value)}
                placeholder="ex: interesse"
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="conditionValue">Valor Esperado</Label>
              <Input
                id="conditionValue"
                value={block.config.conditionValue || ''}
                onChange={(e) => handleChange('conditionValue', e.target.value)}
                placeholder="ex: Produto A"
              />
            </div>
          </div>
        );

      default:
        return null;
    }
  };

  const labelMap: Record<string, string> = {
    start: 'Início',
    message: 'Mensagem',
    'question-text': 'Pergunta de Texto',
    'question-email': 'Pergunta de Email',
    'question-phone': 'Pergunta de Telefone',
    choice: 'Escolha Múltipla',
    condition: 'Condição',
    end: 'Fim',
  };

  return (
    <div className="flex h-full flex-col border-l border-border bg-card">
      <div className="border-b border-border p-4">
        <h2 className="font-display font-semibold text-foreground">Configurar</h2>
        <p className="text-sm text-muted-foreground">{labelMap[block.type]}</p>
      </div>
      <div className="flex-1 overflow-auto p-4">
        {renderFields()}
      </div>
    </div>
  );
};

export default BlockConfigPanel;
