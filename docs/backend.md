# Plano de Implementação - Backend Real com PostgreSQL

> **Data:** 23 de Janeiro de 2026  
> **Objetivo:** Migrar de mock data (localStorage) para backend real com autenticação, API REST e banco de dados PostgreSQL  
> **Status:** Planejamento

## 1. Visão Geral da Migração

### 1.1 Objetivo Geral
Eliminar dependência de localStorage para mock data e implementar um backend robusto que:
- Persista dados em PostgreSQL
- Ofereça API REST para todas as operações
- Implemente autenticação segura com JWT
- Proteja endpoints e dados de usuários
- Suporte múltiplos usuários e chatbots simultâneos

### 1.2 Arquitetura Proposta

```
Frontend (React + Vite)
    ↓
API REST (Node.js + Express)
    ↓
PostgreSQL Database
```

### 1.3 Escopo da Migração

#### Dados a Migrar:
- Usuários (autenticação)
- Chatbots (com blocos e edges)
- Leads capturados
- Métricas e histórico

#### Funcionalidades a Implementar:
- ✅ Autenticação com JWT
- ✅ CRUD para chatbots
- ✅ CRUD para leads
- ✅ Endpoints de métricas
- ✅ Validação serverside
- ✅ Rate limiting
- ✅ CORS

---

## 2. Stack Técnico Proposto

### 2.1 Backend
```
Node.js 18+
├── Express.js 4.x (Framework HTTP)
├── TypeScript (Type safety)
├── Prisma ORM (Database abstraction)
├── PostgreSQL 14+ (Database)
├── jsonwebtoken (JWT Auth)
├── bcryptjs (Password hashing)
├── cors (CORS)
├── dotenv (Environment variables)
└── vitest (Testing)
```

### 2.2 Dependências do Backend (package.json)
```json
{
  "dependencies": {
    "express": "^4.18.2",
    "typescript": "^5.3.3",
    "@prisma/client": "^5.7.1",
    "jsonwebtoken": "^9.1.2",
    "bcryptjs": "^2.4.3",
    "cors": "^2.8.5",
    "dotenv": "^16.3.1",
    "express-validator": "^7.0.0",
    "uuid": "^9.0.1"
  },
  "devDependencies": {
    "@types/express": "^4.17.21",
    "@types/node": "^20.10.6",
    "@types/jsonwebtoken": "^9.0.7",
    "@types/bcryptjs": "^2.4.6",
    "prisma": "^5.7.1",
    "ts-node": "^10.9.2",
    "nodemon": "^3.0.2",
    "vitest": "^1.1.0"
  }
}
```

### 2.3 Estrutura de Diretórios (Backend Novo)
```
backend/
├── src/
│   ├── controllers/
│   │   ├── authController.ts       # Login, register, refresh token
│   │   ├── chatbotController.ts    # CRUD de chatbots
│   │   ├── leadController.ts       # CRUD de leads
│   │   └── metricsController.ts    # Cálculos de métricas
│   ├── middleware/
│   │   ├── authMiddleware.ts       # Validação JWT
│   │   ├── validationMiddleware.ts # Validação de inputs
│   │   └── errorMiddleware.ts      # Tratamento de erros
│   ├── routes/
│   │   ├── authRoutes.ts
│   │   ├── chatbotRoutes.ts
│   │   ├── leadRoutes.ts
│   │   └── metricsRoutes.ts
│   ├── services/
│   │   ├── authService.ts          # Lógica de autenticação
│   │   ├── chatbotService.ts       # Lógica de negócio chatbots
│   │   ├── leadService.ts          # Lógica de negócio leads
│   │   └── tokenService.ts         # Gerenciar JWT tokens
│   ├── types/
│   │   └── index.ts                # Tipos compartilhados
│   ├── app.ts                      # Configuração Express
│   └── server.ts                   # Entry point
├── prisma/
│   └── schema.prisma               # Schema do banco
├── .env.example
├── package.json
├── tsconfig.json
└── README.md
```

---

## 3. Modelo de Dados (PostgreSQL)

### 3.1 Schema Prisma

```prisma
// prisma/schema.prisma

generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

// Usuários
model User {
  id        String   @id @default(uuid())
  email     String   @unique
  password  String
  role      UserRole @default(CREATOR)
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  chatbots Chatbot[]
  
  @@map("users")
}

enum UserRole {
  CREATOR
  CLIENT
}

// Chatbots
model Chatbot {
  id          String   @id @default(uuid())
  name        String
  userId      String
  user        User     @relation(fields: [userId], references: [id], onDelete: Cascade)
  
  isPublished Boolean  @default(false)
  
  // Theme
  primaryColor    String   @default("#0066FF")
  themeMode       String   @default("light") // light | dark
  buttonPosition  String   @default("right") // right | left
  buttonText      String   @default("Fale conosco")
  avatar          String   @default("🤖")
  
  // Content
  blocks        Block[]
  edges         Edge[]
  leads         Lead[]
  
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  
  @@map("chatbots")
}

// Blocos do editor
model Block {
  id          String   @id @default(uuid())
  chatbotId   String
  chatbot     Chatbot  @relation(fields: [chatbotId], references: [id], onDelete: Cascade)
  
  type        String   // start, message, question-text, etc.
  positionX   Float
  positionY   Float
  
  // Config
  message         String?
  question        String?
  variableName    String?
  placeholder     String?
  options         String? // JSON array stored as string
  conditionVariable String?
  conditionValue  String?
  
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  
  @@map("blocks")
}

// Conexões entre blocos
model Edge {
  id        String   @id @default(uuid())
  chatbotId String
  chatbot   Chatbot  @relation(fields: [chatbotId], references: [id], onDelete: Cascade)
  
  source    String   // Block id
  target    String   // Block id
  label     String?
  
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  
  @@map("edges")
}

// Leads capturados
model Lead {
  id          String   @id @default(uuid())
  chatbotId   String
  chatbot     Chatbot  @relation(fields: [chatbotId], references: [id], onDelete: Cascade)
  
  status      LeadStatus @default(STARTED)
  
  // Respostas capturadas
  answers     LeadAnswer[]
  
  // Metadata
  pageUrl     String?
  userAgent   String?
  
  startedAt   DateTime @default(now())
  completedAt DateTime?
  updatedAt   DateTime @updatedAt
  
  @@map("leads")
}

enum LeadStatus {
  STARTED
  COMPLETED
  ABANDONED
}

// Respostas individuais capturadas
model LeadAnswer {
  id          String   @id @default(uuid())
  leadId      String
  lead        Lead     @relation(fields: [leadId], references: [id], onDelete: Cascade)
  
  variableName String
  value       String
  
  createdAt DateTime @default(now())
  
  @@map("lead_answers")
}

// Sessões (opcional, para refresh tokens)
model RefreshToken {
  id        String   @id @default(uuid())
  userId    String
  token     String   @unique
  expiresAt DateTime
  
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  
  @@map("refresh_tokens")
}
```

---

## 4. Endpoints da API REST

### 4.1 Autenticação
```
POST   /api/auth/register      - Criar conta
POST   /api/auth/login         - Login
POST   /api/auth/refresh       - Renovar token
POST   /api/auth/logout        - Logout
GET    /api/auth/me            - Perfil do usuário (protegido)
```

### 4.2 Chatbots
```
GET    /api/chatbots           - Listar chatbots do usuário (protegido)
POST   /api/chatbots           - Criar novo chatbot (protegido)
GET    /api/chatbots/:id       - Obter chatbot específico (protegido)
PUT    /api/chatbots/:id       - Atualizar chatbot (protegido)
DELETE /api/chatbots/:id       - Deletar chatbot (protegido)
POST   /api/chatbots/:id/publish - Publicar chatbot (protegido)
GET    /api/chatbots/:id/public  - Obter chatbot público (sem autenticação)
```

### 4.3 Blocos (dentro de chatbots)
```
POST   /api/chatbots/:id/blocks      - Criar bloco (protegido)
PUT    /api/chatbots/:id/blocks/:blockId - Atualizar bloco (protegido)
DELETE /api/chatbots/:id/blocks/:blockId - Deletar bloco (protegido)
```

### 4.4 Edges (conexões)
```
POST   /api/chatbots/:id/edges       - Criar edge (protegido)
DELETE /api/chatbots/:id/edges/:edgeId - Deletar edge (protegido)
```

### 4.5 Leads
```
GET    /api/chatbots/:id/leads       - Listar leads (protegido)
POST   /api/chatbots/:id/leads       - Criar novo lead (público)
GET    /api/chatbots/:id/leads/:leadId - Detalhes do lead (protegido)
PUT    /api/chatbots/:id/leads/:leadId - Atualizar status lead (público/protegido)
```

### 4.6 Métricas
```
GET    /api/chatbots/:id/metrics     - Métricas do chatbot (protegido)
GET    /api/chatbots/:id/analytics   - Analytics detalhado (protegido)
```

---

## 5. Estratégia de Migração

### 5.1 Fase 1: Setup Inicial (1-2 dias)

#### 1.1.1 Criar projeto backend
```bash
mkdir backend
cd backend
npm init -y
npm install express typescript @types/express @types/node ts-node nodemon
npm install prisma @prisma/client
npm install jsonwebtoken bcryptjs cors dotenv express-validator
npm install --save-dev @types/jsonwebtoken @types/bcryptjs
```

#### 1.1.2 Configurar Prisma
```bash
npx prisma init
# Configurar DATABASE_URL em .env
# Criar schema.prisma (seção 3.1)
npx prisma migrate dev --name init
```

#### 1.1.3 Estrutura base Express
- Criar `src/app.ts` com configuração Express
- Criar `src/server.ts` como entry point
- Configurar middleware (cors, json, logger)
- Configurar tratamento de erros

### 5.2 Fase 2: Implementar Autenticação (2-3 dias)

#### 2.1 Serviço de Autenticação
- Hash de senhas com bcryptjs
- Geração de JWT tokens
- Refresh token system
- Validação de credenciais

#### 2.2 Routes e Controllers
- POST `/api/auth/register` - com validação
- POST `/api/auth/login` - com validação
- POST `/api/auth/refresh`
- GET `/api/auth/me` - protegido

#### 2.3 Middleware de Autenticação
- `authMiddleware.ts` para validar JWT
- Extrair userId do token
- Retornar 401 se inválido

### 5.3 Fase 3: CRUD de Chatbots (2-3 dias)

#### 3.1 Endpoints
- GET `/api/chatbots` - listar do usuário
- POST `/api/chatbots` - criar
- PUT `/api/chatbots/:id` - atualizar
- DELETE `/api/chatbots/:id` - deletar

#### 3.2 Serviço (chatbotService.ts)
- Validar ownership (usuário só acessa seus chatbots)
- Criar com template padrão
- Soft delete ou hard delete

#### 3.3 Validações
- Nome obrigatório
- Não permitir duplicatas de nome por usuário
- Validar tamanho máximo

### 5.4 Fase 4: Blocos e Edges (2 dias)

#### 4.1 Endpoints
- POST/PUT/DELETE de blocos
- POST/DELETE de edges

#### 4.2 Validações
- Validar que bloco pertence ao chatbot do usuário
- Validar tipos de bloco
- Validar posição (x, y)
- Validar edges (source/target existem)

### 5.5 Fase 5: Leads e Captura (2 dias)

#### 5.1 Endpoint de Captura (Público)
- POST `/api/chatbots/:id/leads` - criar novo lead
- PUT `/api/chatbots/:id/leads/:leadId` - atualizar respostas
- Sem autenticação necessária (widget em site externo)

#### 5.2 Endpoint de Listagem (Protegido)
- GET `/api/chatbots/:id/leads` com filtros
- Busca por nome/email
- Filtro por status
- Paginação

#### 5.3 Serviço
- Validar chatbot existe e está publicado
- Capturar answers
- Salvar metadata (URL, user agent)

### 5.6 Fase 6: Métricas (1-2 dias)

#### 6.1 Endpoints
- GET `/api/chatbots/:id/metrics` - resumo
  - Total de visualizações (como rastrear?)
  - Total de leads
  - Taxa de conversão
  - Taxa de conclusão

#### 6.2 Serviço
- Cálculos agregados
- Cache opcional

### 5.7 Fase 7: Integração Frontend (3-4 dias)

#### 7.1 Remover Mock Data
- Deletar `useMockApi.ts`
- Remover inicialização de dados em localStorage

#### 7.2 Criar Serviço HTTP
- `src/services/api.ts` - axios/fetch wrapper
- Interceptores para JWT
- Tratamento de erros centralizado

#### 7.3 Atualizar Hooks
- `useAuth()` - chamar `/api/auth/*`
- `useChatbots()` - chamar `/api/chatbots`
- `useChatbot(id)` - chamar `/api/chatbots/:id`
- `useLeads(id)` - chamar `/api/chatbots/:id/leads`

#### 7.4 Atualizar Componentes
- AuthContext usar API real
- Login page fazer POST real
- Dashboard carregar dados da API
- Editor salvar em tempo real

#### 7.5 Testes
- Testar fluxo completo
- Validar persistência
- Verificar proteção de rotas

---

## 6. Considerações de Segurança

### 6.1 Autenticação
- ✅ Senhas hasheadas com bcryptjs (10+ rounds)
- ✅ JWT com expiração (15min para access, 7 dias para refresh)
- ✅ Refresh token em HttpOnly cookie (ou localStorage com cuidado)
- ✅ Validar origem em CORS

### 6.2 Validação
- ✅ Validação de inputs no backend (express-validator)
- ✅ Validação de tipos (TypeScript)
- ✅ Sanitização de strings
- ✅ Limite de tamanho de payloads

### 6.3 Proteção
- ✅ Rate limiting nos endpoints
- ✅ HTTPS obrigatório em produção
- ✅ CORS restritivo
- ✅ SQL Injection prevenido com Prisma
- ✅ XSS prevenido (React escapa strings)
- ✅ CSRF token se necessário

### 6.4 Dados Sensíveis
- ✅ Nunca retornar password em responses
- ✅ Usar variáveis de ambiente para secrets
- ✅ Logs não incluem senhas/tokens

---

## 7. Variáveis de Ambiente

### 7.1 Backend (.env)
```
# Database
DATABASE_URL="postgresql://user:password@localhost:5432/leadchat_db"

# JWT
JWT_SECRET="sua_chave_secreta_super_longa_aqui"
JWT_REFRESH_SECRET="outro_secret_para_refresh_token"
JWT_EXPIRATION="15m"
JWT_REFRESH_EXPIRATION="7d"

# Server
PORT=3000
NODE_ENV="development"

# CORS
FRONTEND_URL="http://localhost:5173"
```

### 7.2 Frontend (.env)
```
VITE_API_URL="http://localhost:3000/api"
VITE_API_TIMEOUT="10000"
```

---

## 8. Dependências PostgreSQL Locais

### 8.1 Instalação PostgreSQL
```bash
# Windows (usando chocolatey)
choco install postgresql

# Ou download de: https://www.postgresql.org/download/windows/
```

### 8.2 Criar Database
```bash
psql -U postgres
CREATE DATABASE leadchat_db;
CREATE USER leadchat WITH PASSWORD 'sua_senha';
ALTER ROLE leadchat WITH CREATEDB;
GRANT ALL PRIVILEGES ON DATABASE leadchat_db TO leadchat;
```

### 8.3 Connection String
```
postgresql://leadchat:sua_senha@localhost:5432/leadchat_db
```

---

## 9. Testes Sugeridos

### 9.1 Testes de Autenticação
- ✅ Register com email válido
- ✅ Register com email duplicado (erro)
- ✅ Login com credenciais válidas
- ✅ Login com credenciais inválidas
- ✅ Refresh token válido
- ✅ Refresh token expirado
- ✅ Acessar rota protegida sem token (401)

### 9.2 Testes de Chatbots
- ✅ Criar chatbot
- ✅ Listar apenas chatbots do usuário
- ✅ Atualizar chatbot próprio
- ✅ Tentar atualizar chatbot de outro usuário (403)
- ✅ Deletar chatbot
- ✅ Publicar chatbot

### 9.3 Testes de Leads
- ✅ Capturar lead em chatbot publicado
- ✅ Tentar capturar em chatbot não publicado (erro)
- ✅ Listar leads apenas para proprietário
- ✅ Filtrar por status
- ✅ Buscar por nome/email

### 9.4 Testes de Integração
- ✅ Fluxo completo: Register → Create Chatbot → Preview → Publish → Capture Lead → View Results

---

## 10. Deployment

### 10.1 Ambientes
```
Local Development: localhost:3000 (backend) + localhost:5173 (frontend)
Staging: staging.api.leadchat.com
Production: api.leadchat.com
```

### 10.2 Opções de Hosting
- **Backend:** Railway, Render, Vercel, DigitalOcean App Platform, AWS EC2
- **Database:** Railway, Render, DigitalOcean, AWS RDS, Heroku
- **Frontend:** Vercel, Netlify, AWS S3 + CloudFront

### 10.3 Docker (Optional)
```dockerfile
# Dockerfile.backend
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npx prisma generate
EXPOSE 3000
CMD ["node", "dist/server.js"]
```

---

## 11. Timeline Estimada

| Fase | Tarefa | Dias |
|------|--------|------|
| 1 | Setup Prisma + PostgreSQL | 1-2 |
| 2 | Autenticação JWT | 2-3 |
| 3 | CRUD Chatbots | 2-3 |
| 4 | Blocos e Edges | 2 |
| 5 | Leads e Captura | 2 |
| 6 | Métricas | 1-2 |
| 7 | Integração Frontend | 3-4 |
| **Total** | | **15-20 dias** |

---

## 12. Checklist de Implementação

### Setup & Database
- [x] Criar projeto backend
- [x] Instalar dependências
- [x] Configurar PostgreSQL
- [x] Setup Prisma
- [x] Criar migration inicial
- [x] Validar conexão

### Autenticação
- [x] Model User no Prisma
- [x] Hash de senhas
- [x] Routes de auth
- [x] JWT tokens
- [x] Middleware de autenticação
- [x] Refresh token logic

### Chatbots
- [x] Models Block, Edge, Chatbot
- [x] Controllers CRUD
- [x] Validações
- [x] Testes

### Leads
- [x] Model Lead, LeadAnswer
- [x] Endpoint de captura
- [x] Listagem e filtros
- [x] Testes

### Métricas
- [ ] Cálculos de métricas
- [ ] Endpoints
- [ ] Testes

### Frontend
- [ ] Serviço HTTP
- [ ] Atualizar hooks
- [ ] Remover mock data
- [ ] Testes e-2-e
- [ ] Integração completa

---

## 13. Referências e Recursos

### Documentação
- [Prisma Docs](https://www.prisma.io/docs/)
- [Express.js Guide](https://expressjs.com/)
- [JWT Best Practices](https://tools.ietf.org/html/rfc8949)
- [PostgreSQL Docs](https://www.postgresql.org/docs/)

### Ferramentas Úteis
- [Postman](https://www.postman.com/) - Testar API
- [pgAdmin](https://www.pgadmin.org/) - Gerenciar PostgreSQL
- [DBeaver](https://dbeaver.io/) - Client SQL universal

---

**Próximo Passo:** Iniciar com a Fase 1 (Setup Inicial)

