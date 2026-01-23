export type UserRole = 'creator' | 'client';

export interface User {
  id: string;
  email: string;
  password: string;
  role: UserRole;
  createdAt: string;
}

export interface AuthState {
  user: Omit<User, 'password'> | null;
  isAuthenticated: boolean;
  isLoading: boolean;
}

export interface LoginCredentials {
  email: string;
  password: string;
}

export interface RegisterCredentials {
  email: string;
  password: string;
  role: UserRole;
}
