import { createContext, useContext, useState, useCallback, useEffect, type ReactNode } from 'react';
import { v4 as uuidv4 } from 'uuid';
import type { User, UserRole, AuthState, LoginCredentials, RegisterCredentials } from '@/types/auth';

const STORAGE_KEY = 'leadchat_users';
const SESSION_KEY = 'leadchat_session';

interface AuthContextType extends AuthState {
  login: (credentials: LoginCredentials) => Promise<{ success: boolean; error?: string }>;
  register: (credentials: RegisterCredentials) => Promise<{ success: boolean; error?: string }>;
  logout: () => void;
}

const AuthContext = createContext<AuthContextType | null>(null);

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};

const getUsers = (): User[] => {
  const data = localStorage.getItem(STORAGE_KEY);
  return data ? JSON.parse(data) : [];
};

const saveUsers = (users: User[]) => {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(users));
};

const getSession = (): string | null => {
  return localStorage.getItem(SESSION_KEY);
};

const saveSession = (userId: string) => {
  localStorage.setItem(SESSION_KEY, userId);
};

const clearSession = () => {
  localStorage.removeItem(SESSION_KEY);
};

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [state, setState] = useState<AuthState>({
    user: null,
    isAuthenticated: false,
    isLoading: true,
  });

  useEffect(() => {
    const userId = getSession();
    if (userId) {
      const users = getUsers();
      const user = users.find(u => u.id === userId);
      if (user) {
        const { password, ...userWithoutPassword } = user;
        setState({
          user: userWithoutPassword,
          isAuthenticated: true,
          isLoading: false,
        });
        return;
      }
    }
    setState(prev => ({ ...prev, isLoading: false }));
  }, []);

  const login = useCallback(async (credentials: LoginCredentials): Promise<{ success: boolean; error?: string }> => {
    await new Promise(resolve => setTimeout(resolve, 300));

    const users = getUsers();
    const user = users.find(u => u.email === credentials.email);

    if (!user) {
      return { success: false, error: 'Email não encontrado' };
    }

    if (user.password !== credentials.password) {
      return { success: false, error: 'Senha incorreta' };
    }

    const { password, ...userWithoutPassword } = user;
    saveSession(user.id);
    setState({
      user: userWithoutPassword,
      isAuthenticated: true,
      isLoading: false,
    });

    return { success: true };
  }, []);

  const register = useCallback(async (credentials: RegisterCredentials): Promise<{ success: boolean; error?: string }> => {
    await new Promise(resolve => setTimeout(resolve, 300));

    const users = getUsers();
    const existingUser = users.find(u => u.email === credentials.email);

    if (existingUser) {
      return { success: false, error: 'Este email já está cadastrado' };
    }

    if (credentials.password.length < 6) {
      return { success: false, error: 'A senha deve ter pelo menos 6 caracteres' };
    }

    const newUser: User = {
      id: uuidv4(),
      email: credentials.email,
      password: credentials.password,
      role: credentials.role,
      createdAt: new Date().toISOString(),
    };

    saveUsers([...users, newUser]);
    const { password, ...userWithoutPassword } = newUser;
    saveSession(newUser.id);
    setState({
      user: userWithoutPassword,
      isAuthenticated: true,
      isLoading: false,
    });

    return { success: true };
  }, []);

  const logout = useCallback(() => {
    clearSession();
    setState({
      user: null,
      isAuthenticated: false,
      isLoading: false,
    });
  }, []);

  return (
    <AuthContext.Provider value={{ ...state, login, register, logout }}>
      {children}
    </AuthContext.Provider>
  );
};
