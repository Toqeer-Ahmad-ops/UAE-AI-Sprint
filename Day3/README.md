# Day 3: RAG Ingestion Pipeline - UAE AI Automation Sprint

[![n8n](https://img.shields.io/badge/n8n-2.27.4-EA4B71?logo=n8n)](https://n8n.io/)
[![Supabase](https://img.shields.io/badge/Supabase-pgvector-3ECF8E?logo=supabase)](https://supabase.com/)
[![Google Gemini](https://img.shields.io/badge/Gemini-text--embedding--004-4285F4?logo=google)](https://ai.google.dev/)

> Production-grade document ingestion for RAG systems. Built in Dubai for UAE market.

## Problem
UAE businesses store SOPs, contracts, and compliance docs in PDFs/Drive. Manual search wastes hours. Teams need instant, accurate Q&A over their own data.

## Solution  
Automated n8n workflow that ingests documents via webhook → chunks text → generates Gemini embeddings → stores in Supabase pgvector with HNSW index. Includes error handling + audit logging for production reliability.

## Tech Stack
- **Orchestration**: n8n + JavaScript Code nodes
- **AI**: Google Gemini `text-embedding-004` (768 dimensions)
- **Vector Database**: Supabase + `pgvector` extension + `HNSW` index
- **Security**: Postgres RLS enabled, service_role key only
- **Reliability**: Retry 3x with 2s backoff, `rag_logs` audit trail
- **Performance**: <400ms avg insert, cosine similarity search

## Architecture
Webhook → Chunk Text → Gemini Embeddings → Supabase Insert Vector
↓ (on error)
Supabase(Log Error) → rag_logs

## Setup
1. **Supabase**: Run `supabase/schema.sql` to create `documents` + `rag_logs` tables + `match_documents()` RPC
2. **n8n**: Import `n8n/workflow.json` → Add Gemini + Supabase credentials
3. **Test**: POST to webhook: `{"doc_id": "test", "content": "hello world"}`

## Screenshot
| n8n Workflow | Vector Storage | Audit Logs |
| --- | --- | --- |
| ![n8n](screenshot/01-n8n-workflow.png) | ![supabase](screenshot/02-supabase-docs.png) | ![logs](screenshot/03-rag-logs.png) |

## UAE Market Alignment
This project demonstrates skills from current Dubai job posts:
- ✅ Design automation workflows using n8n (primary tool)
- ✅ Integrate AI services for RAG pipelines (Gemini, OpenAI)
- ✅ Build tools with Postgres/Supabase + vector search
- ✅ Test and validate workflows for reliability + QA
- ✅ JavaScript/TypeScript basics for data transformation

**Built by**: Toqeer | Dubai, UAE  
**Status**: Day 3 of 30-Day UAE AI Automation Sprint  
**Open to**: n8n Automation Engineer roles | $35-90/hr | Remote/Dubai
