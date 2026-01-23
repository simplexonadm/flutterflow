# LeadChat - Chatbot Builder Platform

## Overview

LeadChat is a visual chatbot builder platform for creating lead capture and qualification flows. Users can design conversational chatbots through a drag-and-drop flow editor, publish them, and collect leads through interactive chat forms. The platform supports two user roles: creators who build chatbots, and clients who can fill out published forms.

## User Preferences

Preferred communication style: Simple, everyday language.

## System Architecture

### Frontend Framework
- **React 18 with TypeScript** - Single-page application architecture
- **Vite** - Build tool and development server (configured on port 5000)
- **React Router** - Client-side routing with protected routes

### UI Component System
- **shadcn/ui** - Pre-built accessible components based on Radix UI primitives
- **Tailwind CSS** - Utility-first styling with custom design tokens
- **Framer Motion** - Animation library for transitions and interactions
- **Lucide React** - Icon library

### State Management
- **React Context** - AuthContext for user authentication state
- **TanStack Query** - Server state management (configured but using mock data currently)
- **Local Storage** - Persistent storage for mock data (users, chatbots, leads)

### Authentication System
- Role-based access control with two roles: `creator` and `client`
- Session persistence via localStorage
- Protected routes with role-based redirects
- Creators access dashboard and editor; clients access form views only

### Flow Editor Architecture
The visual editor uses a block-based system with:
- **Block Types**: start, message, question-text, question-email, question-phone, choice, condition, end
- **Canvas**: Drag-and-drop positioning with connection lines between blocks
- **Configuration Panel**: Right sidebar for block property editing
- **Preview Mode**: Live chat simulation before publishing

### Data Models
- **Chatbot**: Contains blocks array, edges for connections, theme settings, publish status
- **Block**: Type, position coordinates, configuration (message, variable name, options)
- **Lead**: Captured answers linked to chatbot ID with timestamps
- **User**: Email, hashed password, role, creation date

### Page Structure
- `/login` - Authentication (login/register)
- `/` - Dashboard (creators only) - list and manage chatbots
- `/editor/:id` - Flow editor for building chatbots
- `/results/:id` - Lead analytics and export
- `/forms` - Client form list (clients only)
- `/form/:id` - Interactive form view for lead capture

## External Dependencies

### UI Framework
- Radix UI primitives (dialog, dropdown, tabs, etc.)
- class-variance-authority for component variants
- cmdk for command palette functionality

### Data & Forms
- react-hook-form with zod resolvers (configured but forms use controlled components)
- date-fns for date formatting
- uuid for generating unique identifiers

### Development & Testing
- Vitest with jsdom for unit testing
- ESLint with TypeScript and React plugins
- PostCSS with Tailwind and autoprefixer

### Current State
The application currently uses **mock APIs with localStorage** for all data persistence. The `useMockApi` hook simulates backend operations. When connecting to a real backend, replace these mock implementations with actual API calls while maintaining the same interface.