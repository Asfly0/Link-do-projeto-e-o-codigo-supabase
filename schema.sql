-- Execute este SQL no Supabase: SQL Editor > New query.
create table if not exists public.users (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  email text not null unique,
  password_hash text not null,
  created_at timestamptz not null default now()
);

-- A tabela não deve ser acessada diretamente pelo navegador.
-- O backend usa a Service Role Key, guardada somente nas variáveis de ambiente.
alter table public.users enable row level security;
