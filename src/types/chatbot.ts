// Block types for the visual flow editor
export type BlockType = 
  | 'start'
  | 'message'
  | 'question-text'
  | 'question-email'
  | 'question-phone'
  | 'choice'
  | 'condition'
  | 'end';

export interface Position {
  x: number;
  y: number;
}

export interface BlockConfig {
  message?: string;
  question?: string;
  variableName?: string;
  placeholder?: string;
  options?: string[];
  conditionVariable?: string;
  conditionValue?: string;
}

export interface Block {
  id: string;
  type: BlockType;
  position: Position;
  config: BlockConfig;
}

export interface Edge {
  id: string;
  source: string;
  target: string;
  label?: string;
}

export interface ChatbotTheme {
  primaryColor: string;
  mode: 'light' | 'dark';
  buttonPosition: 'right' | 'left';
  buttonText: string;
  avatar: string;
}

export interface Chatbot {
  id: string;
  name: string;
  createdAt: string;
  updatedAt: string;
  isPublished: boolean;
  theme: ChatbotTheme;
  blocks: Block[];
  edges: Edge[];
  _count?: {
    leads: number;
  };
}

export interface LeadAnswer {
  [key: string]: string;
}

export interface LeadMetadata {
  pageUrl: string;
  userAgent: string;
}

export interface Lead {
  id: string;
  chatbotId: string;
  startedAt: string;
  completedAt?: string;
  status: 'started' | 'completed' | 'abandoned';
  answers: LeadAnswer;
  metadata: LeadMetadata;
}

export interface ChatbotMetrics {
  totalViews: number;
  totalLeads: number;
  conversionRate: number;
  completionRate: number;
}

// Block metadata for the editor
export interface BlockMeta {
  type: BlockType;
  label: string;
  icon: string;
  color: string;
  description: string;
}

export const BLOCK_METADATA: BlockMeta[] = [
  {
    type: 'start',
    label: 'Início',
    icon: 'Play',
    color: 'block-start',
    description: 'Mensagem de boas-vindas'
  },
  {
    type: 'message',
    label: 'Mensagem',
    icon: 'MessageSquare',
    color: 'block-message',
    description: 'Exibir informação ao visitante'
  },
  {
    type: 'question-text',
    label: 'Texto',
    icon: 'Type',
    color: 'block-question',
    description: 'Capturar nome, empresa, etc.'
  },
  {
    type: 'question-email',
    label: 'Email',
    icon: 'Mail',
    color: 'block-email',
    description: 'Validação automática de email'
  },
  {
    type: 'question-phone',
    label: 'Telefone',
    icon: 'Phone',
    color: 'block-phone',
    description: 'Formatação automática'
  },
  {
    type: 'choice',
    label: 'Escolha',
    icon: 'ListChecks',
    color: 'block-choice',
    description: 'Botões para segmentação'
  },
  {
    type: 'condition',
    label: 'Condição',
    icon: 'GitBranch',
    color: 'block-condition',
    description: 'Ramificar baseado em resposta'
  },
  {
    type: 'end',
    label: 'Fim',
    icon: 'CheckCircle',
    color: 'block-end',
    description: 'Mensagem de agradecimento'
  }
];
