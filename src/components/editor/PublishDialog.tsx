import { useState } from 'react';
import { Copy, Check } from 'lucide-react';
import type { Chatbot, ChatbotTheme } from '@/types/chatbot';
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { RadioGroup, RadioGroupItem } from '@/components/ui/radio-group';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';

interface PublishDialogProps {
  chatbot: Chatbot;
  isOpen: boolean;
  onClose: () => void;
  onPublish: (theme: ChatbotTheme) => Promise<void>;
}

const EMOJI_OPTIONS = ['😊', '🤖', '💬', '👋', '🎯', '💡', '🚀', '⭐'];

const PublishDialog = ({ chatbot, isOpen, onClose, onPublish }: PublishDialogProps) => {
  const [theme, setTheme] = useState<ChatbotTheme>(chatbot.theme);
  const [copied, setCopied] = useState(false);
  const [publishing, setPublishing] = useState(false);

  const embedCode = `<!-- LeadChat Widget -->
<div id="leadchat-widget"
  data-chatbot-id="${chatbot.id}"
  data-theme="${theme.mode}"
  data-color="${theme.primaryColor}">
</div>
<script src="https://app.leadchat.com/widget.js"></script>`;

  const handleCopy = async () => {
    await navigator.clipboard.writeText(embedCode);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  const handlePublish = async () => {
    setPublishing(true);
    try {
      await onPublish(theme);
      onClose();
    } finally {
      setPublishing(false);
    }
  };

  return (
    <Dialog open={isOpen} onOpenChange={onClose}>
      <DialogContent className="sm:max-w-lg">
        <DialogHeader>
          <DialogTitle className="font-display">Publicar Chatbot</DialogTitle>
          <DialogDescription>
            Personalize e obtenha o código para incorporar em seu site.
          </DialogDescription>
        </DialogHeader>

        <Tabs defaultValue="customize" className="mt-4">
          <TabsList className="grid w-full grid-cols-2">
            <TabsTrigger value="customize">🎨 Personalizar</TabsTrigger>
            <TabsTrigger value="code">💻 Código</TabsTrigger>
          </TabsList>

          <TabsContent value="customize" className="space-y-4 mt-4">
            <div className="space-y-2">
              <Label htmlFor="primaryColor">Cor Principal</Label>
              <div className="flex gap-2">
                <Input
                  id="primaryColor"
                  type="color"
                  value={theme.primaryColor}
                  onChange={(e) => setTheme({ ...theme, primaryColor: e.target.value })}
                  className="w-12 h-10 p-1 cursor-pointer"
                />
                <Input
                  value={theme.primaryColor}
                  onChange={(e) => setTheme({ ...theme, primaryColor: e.target.value })}
                  className="flex-1 font-mono"
                />
              </div>
            </div>

            <div className="space-y-2">
              <Label>Tema</Label>
              <RadioGroup
                value={theme.mode}
                onValueChange={(value) => setTheme({ ...theme, mode: value as 'light' | 'dark' })}
                className="flex gap-4"
              >
                <div className="flex items-center space-x-2">
                  <RadioGroupItem value="light" id="light" />
                  <Label htmlFor="light" className="cursor-pointer">☀️ Claro</Label>
                </div>
                <div className="flex items-center space-x-2">
                  <RadioGroupItem value="dark" id="dark" />
                  <Label htmlFor="dark" className="cursor-pointer">🌙 Escuro</Label>
                </div>
              </RadioGroup>
            </div>

            <div className="space-y-2">
              <Label>Avatar</Label>
              <div className="flex flex-wrap gap-2">
                {EMOJI_OPTIONS.map((emoji) => (
                  <Button
                    key={emoji}
                    variant={theme.avatar === emoji ? 'default' : 'outline'}
                    size="icon"
                    onClick={() => setTheme({ ...theme, avatar: emoji })}
                    className="text-lg"
                  >
                    {emoji}
                  </Button>
                ))}
              </div>
            </div>

            <div className="space-y-2">
              <Label htmlFor="buttonText">Texto do Botão</Label>
              <Input
                id="buttonText"
                value={theme.buttonText}
                onChange={(e) => setTheme({ ...theme, buttonText: e.target.value })}
                placeholder="Fale conosco"
              />
            </div>

            <div className="space-y-2">
              <Label>Posição do Botão</Label>
              <RadioGroup
                value={theme.buttonPosition}
                onValueChange={(value) => setTheme({ ...theme, buttonPosition: value as 'left' | 'right' })}
                className="flex gap-4"
              >
                <div className="flex items-center space-x-2">
                  <RadioGroupItem value="left" id="left" />
                  <Label htmlFor="left" className="cursor-pointer">⬅️ Esquerda</Label>
                </div>
                <div className="flex items-center space-x-2">
                  <RadioGroupItem value="right" id="right" />
                  <Label htmlFor="right" className="cursor-pointer">➡️ Direita</Label>
                </div>
              </RadioGroup>
            </div>
          </TabsContent>

          <TabsContent value="code" className="space-y-4 mt-4">
            <div className="space-y-2">
              <Label>Código para incorporar</Label>
              <div className="relative">
                <pre className="rounded-lg bg-muted p-4 text-xs overflow-x-auto font-mono">
                  {embedCode}
                </pre>
                <Button
                  variant="outline"
                  size="sm"
                  onClick={handleCopy}
                  className="absolute top-2 right-2"
                >
                  {copied ? <Check className="h-4 w-4" /> : <Copy className="h-4 w-4" />}
                </Button>
              </div>
              <p className="text-xs text-muted-foreground">
                Cole este código antes do fechamento da tag {`</body>`} no seu site.
              </p>
            </div>

            <div className="space-y-2">
              <Label>Link Direto</Label>
              <div className="flex gap-2">
                <Input
                  value={`https://chat.leadchat.com/${chatbot.id}`}
                  readOnly
                  className="font-mono text-sm"
                />
                <Button
                  variant="outline"
                  size="icon"
                  onClick={() => navigator.clipboard.writeText(`https://chat.leadchat.com/${chatbot.id}`)}
                >
                  <Copy className="h-4 w-4" />
                </Button>
              </div>
            </div>
          </TabsContent>
        </Tabs>

        <div className="flex justify-end gap-2 mt-6">
          <Button variant="outline" onClick={onClose}>
            Cancelar
          </Button>
          <Button onClick={handlePublish} disabled={publishing} className="gradient-primary">
            {publishing ? 'Publicando...' : '✓ Publicar Agora'}
          </Button>
        </div>
      </DialogContent>
    </Dialog>
  );
};

export default PublishDialog;
