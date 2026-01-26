import { createContext, useContext, useState, useCallback, useEffect, type ReactNode } from 'react';
import { api } from '@/lib/api';
import type { User, AuthState, LoginCredentials, RegisterCredentials } from '@/types/auth';

const SESSION_KEY = 'leadchat_session';
const ACCESS_TOKEN_KEY = 'leadchat_accessToken';
const REFRESH_TOKEN_KEY = 'leadchat_refreshToken';

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

const getSession = (): string | null => {
  return localStorage.getItem(SESSION_KEY);
};

const saveTokens = (accessToken: string, refreshToken: string, userId: string) => {
  localStorage.setItem(ACCESS_TOKEN_KEY, accessToken);
  localStorage.setItem(REFRESH_TOKEN_KEY, refreshToken);
  localStorage.setItem(SESSION_KEY, userId);
};

const clearSession = () => {
  localStorage.removeItem(SESSION_KEY);
  localStorage.removeItem(ACCESS_TOKEN_KEY);
  localStorage.removeItem(REFRESH_TOKEN_KEY);
};

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [state, setState] = useState<AuthState>({
    user: null,
    isAuthenticated: false,
    isLoading: true,
  });

  const fetchProfile = useCallback(async () => {
    try {
      const data = await api.get<{ id: string; email: string; role: string }>('/auth/me');
      setState({
        user: {
          id: data.id,
          email: data.email,
          role: data.role.toLowerCase() as any,
          createdAt: '', // API doesn't return this in standard getProfile but we can adapt
        },
        isAuthenticated: true,
        isLoading: false,
      });
    } catch (error) {
      clearSession();
      setState({
        user: null,
        isAuthenticated: false,
        isLoading: false,
      });
    }
  }, []);

  useEffect(() => {
    const token = localStorage.getItem(ACCESS_TOKEN_KEY);
    if (token) {
      fetchProfile();
    } else {
      setState(prev => ({ ...prev, isLoading: false }));
    }
  }, [fetchProfile]);

  const login = useCallback(async (credentials: LoginCredentials): Promise<{ success: boolean; error?: string }> => {
    try {
      const response = await api.post<{ user: any; tokens: any }>('/auth/login', credentials);

      saveTokens(
        response.tokens.accessToken,
        response.tokens.refreshToken,
        response.user.id
      );

      setState({
        user: {
          id: response.user.id,
          email: response.user.email,
          role: response.user.role?.toLowerCase() || 'creator',
          createdAt: new Date().toISOString(),
        },
        isAuthenticated: true,
        isLoading: false,
      });

      return { success: true };
    } catch (error: any) {
      return { success: false, error: error.message };
    }
  }, []);

  const register = useCallback(async (credentials: RegisterCredentials): Promise<{ success: boolean; error?: string }> => {
    try {
      const response = await api.post<{ user: any; tokens: any }>('/auth/register', credentials);

      saveTokens(
        response.tokens.accessToken,
        response.tokens.refreshToken,
        response.user.id
      );

      setState({
        user: {
          id: response.user.id,
          email: response.user.email,
          role: response.user.role?.toLowerCase() || 'creator',
          createdAt: new Date().toISOString(),
        },
        isAuthenticated: true,
        isLoading: false,
      });

      return { success: true };
    } catch (error: any) {
      return { success: false, error: error.message };
    }
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
