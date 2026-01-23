PRD - Chat de Captura de Leads 1. Visão Geral do Produto 1.1 Objetivo Desenvolver uma aplicação web que permita usuários criar chatbots conversacionais focados em captura e qualificação de leads através de uma interface visual simples, sem necessidade de conhecimento técnico. 1.2 Problema Profissionais de marketing e pequenos negócios precisam capturar leads qualificados em seus sites, mas landing pages estáticas têm baixa conversão e ferramentas robustas são caras ou complexas demais. 1.3 Solução Uma plataforma simplificada onde usuários constroem conversas de captura de leads através de blocos visuais, publicam em seus sites e visualizam os dados capturados em tempo real. 2. Personas e Público-Alvo Persona 1: Gestor de Marketing Digital Necessidades: Capturar leads qualificados, aumentar taxa de conversão de landing pages Dores: Landing pages estáticas têm baixa conversão, formulários longos afastam visitantes Objetivos: Aumentar volume de leads, melhorar qualificação, reduzir custo por lead Persona 2: Empreendedor/Pequeno Negócio Necessidades: Coletar contatos de potenciais clientes de forma profissional Dores: Falta de recursos técnicos, não sabe programar Objetivos: Parecer mais profissional, automatizar coleta de informações Persona 3: Freelancer/Agência Necessidades: Oferecer solução de captura de leads para clientes Dores: Limitações de ferramentas prontas, falta de personalização Objetivos: Entregar projetos customizados rapidamente 3. Funcionalidades Core (MVP) 3.1 Editor Visual de Fluxos Prioridade: P0 (Crítico) Descrição: Interface drag-and-drop para construir conversas de captura Canvas com zoom e pan Biblioteca de blocos na sidebar Conexões visuais entre blocos Undo/redo básico Blocos Essenciais: Início: Mensagem de boas-vindas Mensagem de Texto: Exibir informação ao visitante Pergunta de Texto: Capturar nome, empresa, etc. Pergunta de Email: Validação automática de email Pergunta de Telefone: Formatação automática Escolha Múltipla: Botões para segmentação (ex: "Qual seu interesse?") Condição Simples: Ramificar baseado em resposta anterior Fim: Mensagem de agradecimento 3.2 Sistema de Variáveis Prioridade: P0 Cada pergunta cria uma variável automaticamente Usar variáveis em mensagens (ex: "Obrigado, {{nome}}!") Variáveis do sistema: data_atual, hora_atual 3.3 Lógica Condicional Simples Prioridade: P0 Condições baseadas em escolha múltipla Ramificação do fluxo (ex: se escolheu "Produto A" → perguntas específicas) Máximo 2 níveis de condição para manter simplicidade 3.4 Publicação e Incorporação Prioridade: P0 Formatos: Widget flutuante (botão no canto + popup ao clicar) Embed inline (incorporar direto na página) Link direto compartilhável Personalização Visual: Escolher cor principal (aplica em botões, header) Tema claro/escuro Posição do botão flutuante (direita/esquerda) Texto do botão (ex: "Falar com especialista", "Solicitar orçamento") Avatar opcional (escolher emoji) Geração de Código: html<!-- Código para copiar e colar no site --> <script src="https://app.leadchat.com/widget.js" data-chatbot-id="abc123" data-theme="light" data-color="#0066FF"> </script> 3.5 Painel de Resultados Prioridade: P0 Visualização de Leads: Tabela com todos os leads capturados Colunas: Data/hora, Nome, Email, Telefone, Respostas customizadas Busca e filtro por data Ordenação por coluna Exportação: Download CSV Download Excel Métricas Básicas: Total de visualizações do chat Total de leads capturados Taxa de conversão (leads / visualizações) Taxa de conclusão (finalizaram / iniciaram) 4. Especificações Técnicas 4.1 Modelo de Dados (Client-Side + Storage API) Estrutura de Dados Local: javascript// Chatbot { id: "uuid", name: "Captura de Leads - Produto X", createdAt: "2026-01-20T10:00:00Z", updatedAt: "2026-01-23T15:30:00Z", isPublished: true, theme: { primaryColor: "#0066FF", mode: "light", // light | dark buttonPosition: "right", // right | left buttonText: "Fale conosco", avatar: "😊" // emoji }, blocks: [ { id: "block-1", type: "start", position: { x: 100, y: 100 }, config: { message: "Olá! Vamos conversar sobre como podemos ajudar?" } }, { id: "block-2", type: "question-text", position: { x: 100, y: 250 }, config: { question: "Qual é o seu nome?", variableName: "nome", placeholder: "Digite seu nome" } } // ... mais blocos ], edges: [ { id: "edge-1", source: "block-1", target: "block-2" } // ... mais conexões ] } // Lead/Resposta (Session) { id: "uuid", chatbotId: "uuid", startedAt: "2026-01-23T14:25:00Z", completedAt: "2026-01-23T14:27:30Z", status: "completed", // started | completed | abandoned answers: { "nome": "João Silva", "email": "joao@email.com", "telefone": "+5547999999999", "interesse": "Produto A" }, metadata: { pageUrl: "https://site.com/landing-page", userAgent: "Mozilla/5.0..." } } 4.2 Storage com window.storage API Persistência de Dados: javascript// Salvar chatbot await window.storage.set( `chatbot:${chatbotId}`, JSON.stringify(chatbotData), false // não compartilhado ); // Salvar lead await window.storage.set( `lead:${chatbotId}:${leadId}`, JSON.stringify(leadData), false // privado ao usuário ); // Listar todos os chatbots do usuário const keys = await window.storage.list('chatbot:'); // Listar leads de um chatbot específico const leadKeys = await window.storage.list(`lead:${chatbotId}:`); // Buscar chatbot específico const result = await window.storage.get(`chatbot:${chatbotId}`); const chatbot = result ? JSON.parse(result.value) : null; 4.3 Publicação do Widget Estratégia: Gerar código HTML/JS que o usuário incorpora no site Widget carrega configuração do chatbot via ID armazenado Renderiza chat client-side com React Exemplo de Widget Incorporado: html<!-- Usuário adiciona este código no site dele --> <div id="leadchat-widget" data-chatbot-id="abc123" data-theme="light" data-color="#0066FF"> </div> <script> // Widget carrega configuração do storage // e renderiza chat interativo </script> Compartilhamento de Dados do Chatbot Publicado: javascript// Quando publicar, salvar versão compartilhada (read-only) await window.storage.set( `published:${chatbotId}`, JSON.stringify({ blocks: chatbotData.blocks, edges: chatbotData.edges, theme: chatbotData.theme }), true // COMPARTILHADO - qualquer um pode ler ); // Widget público lê esta versão compartilhada const publishedData = await window.storage.get( `published:${chatbotId}`, true );

```
---

## 5. Experiência do Usuário

### 5.1 Fluxo do Criador

1. **Acessar Aplicação** → Tela inicial
2. **Dashboard** → Ver lista de chatbots ou criar primeiro
3. **Criar Novo** → Começa com template básico
4. **Editor Visual**:
   - Sidebar esquerda: Blocos disponíveis
   - Centro: Canvas com blocos arrastáveis
   - Sidebar direita: Configuração do bloco selecionado
   - Top bar: Nome do chat, Preview, Publicar
5. **Arrastar Blocos** → Configurar textos/perguntas → Conectar
6. **Preview em Tempo Real** → Botão que abre modal simulando o chat
7. **Publicar**:
   - Configurar personalização visual
   - Gerar código de incorporação
   - Copiar e colar no site
8. **Ver Resultados** → Tabela de leads, métricas, exportar

### 5.2 Fluxo do Visitante (Lead)

1. **Acessa Site** → Vê botão flutuante do chat
2. **Clica no Botão** → Chat abre em popup/modal
3. **Lê Mensagem Inicial** → Mensagem de boas-vindas
4. **Responde Perguntas** → Uma por vez, com botão "Próxima"
5. **Completa** → Vê mensagem de agradecimento
6. **Lead Salvo** → Dados armazenados automaticamente

### 5.3 Wireframes Principais

**Dashboard**:
```

+--------------------------------------------------+ | LeadChat Meus Chats [+ Novo Chat] | +--------------------------------------------------+ | | | [Card: Chat 1] [Card: Chat 2] [Card: Chat 3] | | 📊 45 leads 📊 12 leads 📊 8 leads | | ✓ Publicado ✓ Publicado ⚠️ Rascunho | | [Editar] [Ver] [Editar] [Ver] [Editar] [Ver]| | | +--------------------------------------------------+

```
**Editor**:
```

+--------------------------------------------------+ | [Captura de Leads] [👁️ Preview] [✓ Publicar] | +--------------------------------------------------+ | BLOCOS | CANVAS | CONFIGURAR | |-----------|-------------------------|-------------| | 💬 Texto | | Tipo: Texto | | ❓ Pergunta| [Início] | Mensagem: | | 📧 Email | ↓ | [_________] | | 📱 Telefone| [Nome] | | | 🔘 Escolha| ↓ | Placeholder:| | 🔀 Condição| [Email] | [_________] | | 🏁 Fim | ↓ | | | | [Fim] | Variável: | | | | nome | +--------------------------------------------------+

```
**Preview do Chat** (Modal):
```

+--------------------------------+ | 😊 Atendimento [✕] | +--------------------------------+ | Bot: Olá! Como posso ajudar? | | | | Você: [Digite sua resposta...] | | [Enviar →] | +--------------------------------+

```
**Publicar** (Modal):
```

+----------------------------------------+ | Publicar Chat de Leads | +----------------------------------------+ | 🎨 Personalização | | Cor: [#0066FF] ■ | | Tema: ○ Claro ● Escuro | | Avatar: 😊 [Escolher emoji] | | Botão: [____Fale conosco_____] | | Posição: ○ Esquerda ● Direita | | | | 💻 Código para o Site | | ┌────────────────────────────────┐ | | │<div id="leadchat-widget"... │ | | │data-chatbot-id="abc123"></div> │ | | └────────────────────────────────┘ | | [📋 Copiar Código] | | | | [✓ Publicar Agora] | +----------------------------------------+

```
**Painel de Resultados**:
```

+--------------------------------------------------+ | Chat: Captura de Leads [⬇️ Exportar] | +--------------------------------------------------+ | 📊 MÉTRICAS (Últimos 30 dias) | | ┌──────────┬──────────┬───────────────┐ | | │ 234 │ 45 │ 19.2% │ | | │ Vistas │ Leads │ Conversão │ | | └──────────┴──────────┴───────────────┘ | +--------------------------------------------------+ | LEADS [🔍 Buscar]| | | | Data/Hora Nome Email Ações | | ─────────────────────────────────────────────── | | 23/01 14:30 João Silva joao@email.com [👁️] | | 23/01 10:15 Maria Costa maria@email.com [👁️] | | 22/01 16:45 Pedro Santos pedro@email.com [👁️] | | | | Página 1 de 3 [←] [→] | +--------------------------------------------------+

```
**Detalhes do Lead** (Modal ao clicar em 👁️):
```

+----------------------------------------+ | Lead: João Silva [✕] | +----------------------------------------+ | 📅 Data: 23/01/2026 às 14:30 | | 🌐 Página: site.com/landing-page | | | | RESPOSTAS: | | ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ | | Nome: João Silva | | Email: joao@email.com | | Telefone: (47) 99999-9999 | | Interesse: Produto A | | Empresa: Empresa XYZ | | | | [Exportar este lead] | +----------------------------------------+ 6. Requisitos Não-Funcionais 6.1 Performance Chat carrega em < 2 segundos Transição entre perguntas < 100ms Editor suporta até 50 blocos sem lag Salvamento automático a cada alteração (debounced 1s) 6.2 Segurança Sanitização de todos os inputs do usuário Validação de email no formato correto Validação de telefone (formato brasileiro) Dados armazenados com window.storage API Proteção contra XSS em mensagens personalizadas 6.3 Compatibilidade Funciona em Chrome, Firefox, Safari, Edge (últimas 2 versões) Responsivo: desktop (1920x1080), tablet (768px), mobile (375px) Widget funciona em qualquer site HTML 6.4 Acessibilidade Navegação por teclado (Tab, Enter, Esc) Labels ARIA adequados Contraste de cores mínimo 4.5:1 (WCAG AA) Foco visível em todos os elementos interativos 6.5 Usabilidade Mensagens de erro claras e em português Feedback visual imediato em todas as ações Loading states durante salvamento/carregamento Confirmação antes de deletar chatbot ou lead flowchart TD
    A([Início<br/>Mensagem de Boas-vindas])
    
    A --> B[Pergunta de Texto<br/>Nome]
    B --> C[Pergunta de Email<br/>Validação de Email]
    
    C -->|Email válido| D[Pergunta de Telefone]
    C -->|Email inválido| C1[Mensagem de Erro<br/>Digite um email válido]
    C1 --> C
    
    D --> E[Escolha Múltipla<br/>Interesse]
    
    E -->|Produto A| F[Pergunta Específica<br/>Produto A]
    E -->|Produto B| G[Pergunta Específica<br/>Produto B]
    
    F --> H[Mensagem de Agradecimento]
    G --> H
    
    H --> I([Fim])
    
    %% Armazenamento
    H --> J[(Salvar Lead<br/>window.storage)]