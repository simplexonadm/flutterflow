import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import { AuthProvider, useAuth } from "@/contexts/AuthContext";
import ProtectedRoute from "@/components/ProtectedRoute";
import Dashboard from "./pages/Dashboard";
import Editor from "./pages/Editor";
import Results from "./pages/Results";
import Login from "./pages/Login";
import ClientForms from "./pages/ClientForms";
import FormView from "./pages/FormView";
import NotFound from "./pages/NotFound";

const queryClient = new QueryClient();

const RootRedirect = () => {
  const { user, isLoading } = useAuth();
  
  if (isLoading) {
    return null;
  }
  
  if (!user) {
    return <Navigate to="/login" replace />;
  }
  
  if (user.role === 'client') {
    return <Navigate to="/forms" replace />;
  }
  
  return <Dashboard />;
};

const App = () => (
  <QueryClientProvider client={queryClient}>
    <TooltipProvider>
      <Toaster />
      <Sonner />
      <BrowserRouter>
        <AuthProvider>
          <Routes>
            <Route path="/login" element={<Login />} />
            
            <Route path="/" element={
              <ProtectedRoute>
                <RootRedirect />
              </ProtectedRoute>
            } />
            
            <Route path="/editor/:id" element={
              <ProtectedRoute allowedRoles={['creator']}>
                <Editor />
              </ProtectedRoute>
            } />
            
            <Route path="/results/:id" element={
              <ProtectedRoute allowedRoles={['creator']}>
                <Results />
              </ProtectedRoute>
            } />
            
            <Route path="/forms" element={
              <ProtectedRoute allowedRoles={['client']}>
                <ClientForms />
              </ProtectedRoute>
            } />
            
            <Route path="/form/:id" element={
              <ProtectedRoute allowedRoles={['client']}>
                <FormView />
              </ProtectedRoute>
            } />
            
            <Route path="*" element={<NotFound />} />
          </Routes>
        </AuthProvider>
      </BrowserRouter>
    </TooltipProvider>
  </QueryClientProvider>
);

export default App;
