# PRD - Chat de Captura de Leads - Estado Atual da Implementação

> **Data de Atualização:** 23 de Janeiro de 2026  
> **Tipo de Projeto:** Prototipo de Frontend para integração com Backend  
> **Status Geral:** ✅ MVP Funcional com Recursos Essenciais Implementados

## 1. Visão Geral do Produto

### 1.1 Objetivo
Desenvolver uma aplicação web que permita usuários criar chatbots conversacionais focados em captura e qualificação de leads através de uma interface visual simples, sem necessidade de conhecimento técnico.

### 1.2 Problema
Profissionais de marketing e pequenos negócios precisam capturar leads qualificados em seus sites, mas landing pages estáticas têm baixa conversão e ferramentas robustas são caras ou complexas demais.

### 1.3 Solução
Uma plataforma simplificada onde usuários constroem conversas de captura de leads através de blocos visuais, publicam em seus sites e visualizam os dados capturados em tempo real.

## 2. Personas e Público-Alvo

### Persona 1: Gestor de Marketing Digital
- **Necessidades:** Capturar leads qualificados, aumentar taxa de conversão de landing pages
- **Dores:** Landing pages estáticas têm baixa conversão, formulários longos afastam visitantes
- **Objetivos:** Aumentar volume de leads, melhorar qualificação, reduzir custo por lead

### Persona 2: Empreendedor/Pequeno Negócio
- **Necessidades:** Coletar contatos de potenciais clientes de forma profissional
- **Dores:** Falta de recursos técnicos, não sabe programar
- **Objetivos:** Parecer mais profissional, automatizar coleta de informações

### Persona 3: Freelancer/Agência
- **Necessidades:** Oferecer solução de captura de leads para clientes
- **Dores:** Limitações de ferramentas prontas, falta de personalização
- **Objetivos:** Entregar projetos customizados rapidamente

## 3. Funcionalidades Core (MVP)

### 3.1 Editor Visual de Fluxos
**Status:** ✅ **CONCLUÍDO**  
**Prioridade:** P0 (Crítico)

#### Implementado:
- ✅ Interface drag-and-drop para construir conversas
- ⚠️ Canvas (sem zoom/pan avançado - versão básica)
- ✅ Biblioteca de blocos na sidebar esquerda
- ✅ Conexões visuais entre blocos (linhas SVG animadas)
- ❌ Undo/redo - **NÃO IMPLEMENTADO** (para integração com backend)

#### Blocos Disponíveis:
- ✅ **Início (Start):** Mensagem de boas-vindas
- ✅ **Mensagem de Texto:** Exibir informação ao visitante
- ✅ **Pergunta de Texto:** Capturar nome, empresa, etc.
- ✅ **Pergunta de Email:** Campo com tipo `email`
- ✅ **Pergunta de Telefone:** Campo com tipo `tel`
- ✅ **Escolha Múltipla:** Botões para segmentação
- ✅ **Condição Simples:** Bloco de ramificação de lógica
- ✅ **Fim (End):** Mensagem de agradecimento

### 3.2 Sistema de Variáveis
**Status:** ✅ **CONCLUÍDO**  
**Prioridade:** P0

#### Implementado:
- ✅ Cada pergunta cria variável automaticamente (`variableName`)
- ✅ Interpolação de variáveis em mensagens (ex: `"Obrigado, {{nome}}!"`)
- ✅ Sistema de substituição dinâmica durante a conversa
- ❌ Variáveis do sistema (data_atual, hora_atual) - **NÃO IMPLEMENTADO**

### 3.3 Lógica Condicional Simples
**Status:** ⚠️ **PARCIALMENTE IMPLEMENTADO**  
**Prioridade:** P0

#### Implementado:
- ✅ Bloco de Condição na biblioteca
- ✅ Estrutura de dados suporta condições
- ⚠️ Execução em preview (precisa de refinamento)
- ⚠️ Ramificações baseadas em respostas anteriores

#### Limitações:
- Sem limite de níveis de condição (estrutura permite, mas UX pode ser desafiadora)
- Recomendação: Máximo 2 níveis para manter simplicidade

### 3.4 Publicação e Incorporação
**Status:** ⚠️ **PROTOTIPADO**  
**Prioridade:** P0

#### Implementado:
- ✅ Modal de publicação com personalização
- ✅ Gera código HTML/JS para copiar
- ⚠️ Widget preview em modal (não flutuante ainda)
- ❌ Embed inline - **NÃO IMPLEMENTADO** (para backend)
- ❌ Link direto compartilhável - **NÃO IMPLEMENTADO** (para backend)

#### Personalização Visual Implementada:
- ✅ Seletor de cor principal (aplica em componentes)
- ✅ Tema claro/escuro (light | dark)
- ✅ Posição do botão (direita | esquerda)
- ✅ Texto customizável do botão
- ✅ Seletor de avatar (8 emojis padrão)

#### Geração de Código:
```html
<!-- LeadChat Widget -->
<div id="leadchat-widget"
  data-chatbot-id="abc123"
  data-theme="light"
  data-color="#0066FF">
</div>
<script src="https://app.leadchat.com/widget.js"></script>
```

**Nota:** URL do script é placeholder. Será substituída durante integração com backend.

### 3.5 Painel de Resultados
**Status:** ✅ **CONCLUÍDO**  
**Prioridade:** P0

#### Visualização de Leads:
- ✅ Tabela com todos os leads capturados
- ✅ Colunas: Data/hora, Nome, Email, Status
- ✅ Busca por nome/email
- ✅ Filtro por status (Completado, Abandonado, Todos)
- ✅ Visualização detalhada em modal
- ✅ Modal mostra todas as respostas capturadas

#### Exportação:
- ✅ Download CSV com formatação
- ⚠️ Download Excel (exporta como CSV com extensão .xlsx)

#### Métricas Básicas:
- ✅ Total de visualizações do chat
- ✅ Total de leads capturados
- ✅ Taxa de conversão (%)
- ✅ Taxa de conclusão (%)

## 4. Especificações Técnicas

### 4.1 Stack Tecnológico
- **Frontend:** React 18 + TypeScript
- **Styling:** Tailwind CSS + shadcn/ui
- **State Management:** React Hooks + React Query
- **Roteamento:** React Router v6
- **Animações:** Framer Motion
- **Armazenamento:** LocalStorage (para prototipagem)
- **Build:** Vite
- **Testes:** Vitest

### 4.2 Modelo de Dados (Client-Side)

#### Estrutura de Chatbot:
```typescript
interface Chatbot {
  id: string;                      // UUID
  name: string;                    // Nome do chatbot
  createdAt: string;               // ISO 8601
  updatedAt: string;               // ISO 8601
  isPublished: boolean;            // Status de publicação
  theme: {
    primaryColor: string;          // Hex color (#0066FF)
    mode: 'light' | 'dark';
    buttonPosition: 'right' | 'left';
    buttonText: string;            // Ex: "Fale conosco"
    avatar: string;                // Emoji
  };
  blocks: Block[];                 // Array de blocos
  edges: Edge[];                   // Array de conexões
}
```

#### Estrutura de Bloco:
```typescript
interface Block {
  id: string;                      // UUID
  type: BlockType;                 // start | message | question-text | ...
  position: { x: number; y: number };
  config: {
    message?: string;              // Para start, message, end
    question?: string;             // Para perguntas
    variableName?: string;         // Para capturar variável
    placeholder?: string;          // Para inputs
    options?: string[];            // Para choice
    conditionVariable?: string;    // Para condition
    conditionValue?: string;       // Para condition
  };
}
```

#### Estrutura de Lead/Resposta:
```typescript
interface Lead {
  id: string;                      // UUID
  chatbotId: string;               // Referência ao chatbot
  startedAt: string;               // ISO 8601
  completedAt?: string;            // ISO 8601 (opcional)
  status: 'started' | 'completed' | 'abandoned';
  answers: {
    [variableName: string]: string // Ex: { nome: "João", email: "..." }
  };
  metadata: {
    pageUrl: string;               // URL da página
    userAgent: string;             // User agent do navegador
  };
}
```

### 4.3 Storage - LocalStorage
**Status:** ✅ **IMPLEMENTADO**

#### Chaves Utilizadas:
- `leadchat_chatbots` - Array de todos os chatbots
- `leadchat_leads` - Array de todos os leads

#### Implementação:
- ✅ Salvamento automático em JSON
- ✅ Carregamento ao inicializar aplicação
- ✅ Mock data gerada para prototipagem

### 4.4 Fluxo de Sessão de Chat
**Status:** ✅ **IMPLEMENTADO**

O hook `useChatSession` gerencia o fluxo da conversa:
1. Inicia no bloco "start"
2. Navega entre blocos seguindo as edges
3. Captura respostas em um objeto de `answers`
4. Interpola variáveis nas mensagens
5. Marca como completo quando atinge bloco "end"
6. Salva lead automaticamente após conclusão

## 5. Páginas Implementadas

### Dashboard (`/`)
- ✅ Lista de chatbots com cards
- ✅ Contagem de leads por chatbot
- ✅ Status de publicação
- ✅ Botões: Editar, Ver Resultados
- ✅ Dialog para criar novo chatbot
- ✅ Dialog de confirmação para deletar
- ✅ Estado vazio com chamada para ação

### Editor (`/editor/:id`)
- ✅ Sidebar esquerda com biblioteca de blocos
- ✅ Canvas central com blocos arrastáveis
- ✅ Painel direito com configuração de bloco
- ✅ Conexões visuais entre blocos
- ✅ Preview em tempo real (modal)
- ✅ Dialog de publicação
- ✅ Botões: Voltar, Preview, Publicar
- ✅ Input de nome do chatbot

### Resultados (`/results/:id`)
- ✅ Métricas principais em cards
- ✅ Tabela de leads com filtros
- ✅ Busca por nome/email
- ✅ Filtro por status
- ✅ Modal com detalhes do lead
- ✅ Botão de exportação (CSV)
- ✅ Navegação entre páginas
- ✅ Loading states

### NotFound (`*`)
- ✅ Página 404 com mensagem
- ✅ Link para voltar ao dashboard

## 6. Componentes Principais

### Layout
- ✅ `Header` - Navegação superior com logo e links

### Editor
- ✅ `BlockLibrary` - Sidebar com blocos disponíveis
- ✅ `EditorCanvas` - Canvas para drag-and-drop
- ✅ `FlowBlock` - Componente individual de bloco
- ✅ `BlockConfigPanel` - Painel de configuração
- ✅ `ChatPreview` - Modal de preview do chat
- ✅ `PublishDialog` - Dialog de publicação

### Dashboard
- ✅ `ChatbotCard` - Card individual do chatbot
- ✅ `CreateChatbotDialog` - Dialog para criar novo

### UI (Componentes Shadcn)
- ✅ Accordion, AlertDialog, Button, Card, Dialog, Input
- ✅ Label, RadioGroup, Select, Table, Tabs, Toast, Tooltip
- ✅ Badge, Skeleton, Sheet, e mais

## 7. Hooks Personalizados

### `useChatbots()`
- ✅ Lista de chatbots
- ✅ Criar chatbot
- ✅ Deletar chatbot
- ✅ Loading state

### `useChatbot(id)`
- ✅ Buscar chatbot específico
- ✅ Atualizar blocos
- ✅ Publicar chatbot
- ✅ Set chatbot (atualizar estado)

### `useLeads(chatbotId)`
- ✅ Lista de leads
- ✅ Calcular métricas
- ✅ Exportar para CSV

### `useChatSession(chatbot)`
- ✅ Gerenciar fluxo da conversa
- ✅ Navegar entre blocos
- ✅ Capturar respostas
- ✅ Interpolar variáveis
- ✅ Salvar lead automaticamente

## 8. Requisitos Não-Funcionais

### 8.1 Performance
- ⚠️ Chat carrega em < 2s (depende de backend)
- ✅ Transição entre perguntas < 100ms
- ✅ Editor suporta 50+ blocos sem lag
- ✅ Salvamento automático (debounce 300ms)

### 8.2 Segurança
- ⚠️ Sanitização de inputs (parcial - para backend implementar)
- ✅ Validação básica de email (HTML5)
- ✅ Validação de telefone (tipo tel)
- ✅ Dados locais com localStorage
- ⚠️ Proteção contra XSS (depende de backend)

### 8.3 Compatibilidade
- ✅ Chrome, Firefox, Safari, Edge (últimas versões)
- ✅ Responsivo: desktop, tablet, mobile
- ⚠️ Widget funciona em qualquer site HTML (prototipado)

### 8.4 Acessibilidade
- ✅ Navegação por teclado (Tab, Enter)
- ✅ Labels adequados
- ✅ Contraste de cores (Tailwind WCAG)
- ✅ Foco visível em elementos

### 8.5 Usabilidade
- ✅ Mensagens de erro em português
- ✅ Feedback visual imediato (toast notifications)
- ✅ Loading states
- ✅ Confirmação antes de deletar

## 9. Próximos Passos - Integração com Backend

### Para Implementação:

#### 9.1 Autenticação
- [ ] Sistema de login/registro
- [ ] JWT ou session-based auth
- [ ] Proteção de rotas

#### 9.2 API REST/GraphQL
- [ ] Endpoints CRUD para chatbots
- [ ] Endpoints para leads
- [ ] Endpoints para métricas

#### 9.3 Widget Distribuído
- [ ] Implementar widget flutuante real
- [ ] Script de incorporação dinâmico
- [ ] Suporte a múltiplos temas por página

#### 9.4 Recursos Avançados
- [ ] Undo/Redo com histórico
- [ ] Templates de chatbot
- [ ] Automações (webhooks, integrações)
- [ ] Análise avançada
- [ ] A/B testing de fluxos

#### 9.5 Segurança
- [ ] HTTPS obrigatório
- [ ] Validação de CORS
- [ ] Rate limiting
- [ ] Sanitização no backend

#### 9.6 Performance
- [ ] Caching de chatbots publicados
- [ ] CDN para widget script
- [ ] Paginação de leads
- [ ] Índices de banco de dados

## 10. Estrutura de Arquivos

```
src/
├── components/
│   ├── dashboard/          # Dashboard específico
│   ├── editor/             # Editor visual específico
│   ├── layout/             # Layout comum
│   └── ui/                 # Componentes shadcn
├── hooks/                  # Custom hooks
│   ├── useMockApi.ts       # API mockada
│   └── use-toast.ts        # Toast notifications
├── lib/
│   └── utils.ts            # Utilidades
├── pages/                  # Páginas principais
│   ├── Dashboard.tsx
│   ├── Editor.tsx
│   ├── Results.tsx
│   └── NotFound.tsx
├── types/
│   └── chatbot.ts          # Tipos TypeScript
└── App.tsx                 # App principal
```

## 11. Mock Data para Testes

A aplicação inicia com 3 chatbots de exemplo:
1. **Captura de Leads - Produto X** (Publicado) - 15 leads
2. **Qualificação - Serviços** (Publicado) - 15 leads
3. **Rascunho - Nova Campanha** (Não publicado)

Cada chatbot tem template básico com:
- Bloco de Início
- Pergunta de Nome
- Pergunta de Email
- Bloco de Fim

## 12. Notas Importantes

### Este é um Protótipo
- ✅ Todas as funcionalidades core funcionam localmente
- ⚠️ Dados são persistidos em localStorage (não sincronizam entre abas)
- ⚠️ Widget é prototipado (URL placeholder)
- ❌ Sem autenticação real
- ❌ Sem backend

### Segurança
- Quando integrar com backend, implementar:
  - Validação serverside
  - Sanitização de inputs
  - HTTPS
  - CORS adequado
  - Rate limiting

### Performance
- Quando em produção, considerar:
  - Lazy loading de componentes
  - Code splitting
  - Caching de chatbots publicados
  - CDN para assets

---

**Última atualização:** 23 de Janeiro de 2026  
**Versão:** 1.0.0 (MVP Prototipado)  
**Próximo Marco:** Integração com Backend API
