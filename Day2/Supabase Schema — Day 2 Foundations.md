# Supabase Schema — Day 2 Foundations

**Date**: 2026-06-26  
**Goal**: Secure tables + RLS + tested REST access

---

## 1. Tables DDL

Run this in Supabase SQL Editor:
```sql
-- Leads table for webhook captures
create table leads (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  email text,
  source text,
  raw_payload jsonb,
  created_at timestamptz default now()

);
-- Logs table for error handling
create table ingestion_logs (
  id uuid primary key default gen_random_uuid(),
  workflow_name text,
  status text check (status in ('success','error')),
  error_msg text,
  payload jsonb,
  created_at timestamptz default now()
);
```
---

## 2. Row Level Security Policies

```sql
-- Enable RLS
alter table leads enable row level security;
alter table ingestion_logs enable row level security;

-- Service role can do everything
create policy "service_role_all_leads" on leads
  for all to service_role 
  using (true) 
  with check (true);

create policy "service_role_all_logs" on ingestion_logs
  for all to service_role 
  using (true) 
  with check (true);

-- Block anon completely
create policy "block_anon_leads" on leads for all to anon using (false);
create policy "block_anon_logs" on ingestion_logs for all to anon using (false);
```
---

## 3. REST API Tests — curl
Test 1: Insert with service_role — should return 201
```bash
curl -X POST "https://pnafbhfijmaaxsertzof.supabase.co/rest/v1/leads" \
  -H "apikey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBuYWZiaGZpam1hYXhzZXJ0em9mIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MTk0OTY4NSwiZXhwIjoyMDk3NTI1Njg1fQ.iVQKeKAhvNO27viXu24C-0ngxqXUQkkY5JNumwirB2Q" \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBuYWZiaGZpam1hYXhzZXJ0em9mIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MTk0OTY4NSwiZXhwIjoyMDk3NTI1Njg1fQ.iVQKeKAhvNO27viXu24C-0ngxqXUQkkY5JNumwirB2Q" \
  -H "Content-Type: application/json" \
  -H "Prefer: return=representation" \
  -d '{"name":"Day2 Test","email":"day2@test.com","source":"curl"}'
```

  Test 2: Insert with anon key — should return 401 Unauthorized
```bash
  curl -X POST "https://pnafbhfijmaaxsertzof.supabase.co/rest/v1/leads" \
  -H "apikey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBuYWZiaGZpam1hYXhzZXJ0em9mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODE5NDk2ODUsImV4cCI6MjA5NzUyNTY4NX0.Zcp8oViq9wBFEJrJGtdB1KXY7q5CZN7lwgO1duWLbRw" \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBuYWZiaGZpam1hYXhzZXJ0em9mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODE5NDk2ODUsImV4cCI6MjA5NzUyNTY4NX0.Zcp8oViq9wBFEJrJGtdB1KXY7q5CZN7lwgO1duWLbRw" \
  -H "Content-Type: application/json" \
  -d '{"name":"Should Fail","email":"fail@test.com","source":"curl"}'
```

##  4. Results Screenshot Notes

Test 1: Got 201 Created + row back. RLS allows service_role.
Test 2: Got 401 Unauthorized. RLS correctly blocks anon. Never use anon key for writes.
Test 3: Got 200 OK + JSON array. Read works.

## 5. Environment Variables Used

Never commit these. Store in .env:

SUPABASE_URL=https://pnafbhfijmaaxsertzof.supabase.co
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBuYWZiaGZpam1hYXhzZXJ0em9mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODE5NDk2ODUsImV4cCI6MjA5NzUyNTY4NX0.Zcp8oViq9wBFEJrJGtdB1KXY7q5CZN7lwgO1duWLbRw
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBuYWZiaGZpam1hYXhzZXJ0em9mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODE5NDk2ODUsImV4cCI6MjA5NzUyNTY4NX0.Zcp8oViq9wBFEJrJGtdB1KXY7q5CZN7lwgO1duWLbRw