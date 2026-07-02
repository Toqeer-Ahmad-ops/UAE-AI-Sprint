-- Day 3: RAG Ingestion Schema for UAE Enterprise
-- Built in Dubai for bilingual EN/AR compliance docs

create extension if not exists vector;

-- Main documents table with HNSW index + UAE enterprise fields
create table public.documents (
  id bigserial primary key,
  doc_id text not null,
  title text,
  content text not null,
  embedding vector(768),
  metadata jsonb default '{}'::jsonb, -- language, version, is_latest
  created_at timestamptz default now()
);

-- HNSW index for fast vector search
create index documents_embedding_idx on public.documents 
using hnsw (embedding vector_cosine_ops);

-- Enterprise indexes for UAE use cases
create index documents_doc_id_idx on public.documents (doc_id);
create index documents_is_latest_idx on public.documents ((metadata->>'is_latest')) where (metadata->>'is_latest') = 'true';

-- Audit logs for UAE compliance + QA
create table public.rag_logs (
  id bigserial primary key,
  doc_id text,
  status text, -- success | failed
  error_message text,
  created_at timestamptz default now()
);

-- RLS for security - UAE JD requirement
alter table public.documents enable row level security;
alter table public.rag_logs enable row level security;

-- RPC for vector search - used in Day 4
create or replace function match_documents(
  query_embedding vector(768),
  match_count int default 5,
  filter_language text default null
)
returns table (
  id bigint,
  doc_id text,
  content text,
  similarity float
)
language plpgsql
as $$
begin
  return query
  select
    documents.id,
    documents.doc_id,
    documents.content,
    1 - (documents.embedding <=> query_embedding) as similarity
  from documents
  where (filter_language is null or documents.metadata->>'language' = filter_language)
    and (documents.metadata->>'is_latest' = 'true' or documents.metadata->>'is_latest' is null)
  order by documents.embedding <=> query_embedding
  limit match_count;
end;
$$;
