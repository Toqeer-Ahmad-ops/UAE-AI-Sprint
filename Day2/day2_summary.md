# Day 2 Summary — Foundations

**Date**: 2026-06-26  
**Time**: 9:00 AM – 1:00 PM GST  
**Goal**: Supabase + n8n + API fundamentals

## 5-Point Summary

1. **Created Supabase tables with enterprise security**
   - Tables: `leads`, `ingestion_logs` with `uuid`, `timestamptz`, `jsonb`
   - Enabled RLS + policies: service_role only, anon blocked
   - Proved with curl: service_role = `201`, anon = `401 Unauthorized`

2. **Inserted sample data via GUI + SQL**
   - Used Table Editor to add test lead
   - Ran INSERT via SQL Editor to verify permissions

3. **Built n8n workflow: Webhook → Set → Supabase**
   - POST webhook at `/webhook-test/day2_webhook`
   - Set node maps `name`, `email`, `source` from JSON body
   - Supabase node inserts to `leads` table
   - Error workflow logs failures to `ingestion_logs`

4. **Tested GET/POST APIs on public + private endpoints**
   - JSONPlaceholder: GET `/posts/1` = `200`, POST `/posts` = `201`
   - Supabase REST: Verified auth headers + RLS behavior
   - Documented `Content-Type`, `Authorization`, status codes

5. **Organized all Day 2 assets for portfolio**
   - Folder: `UAE-AI-Sprint/Day2/`
   - Files: `supabase_schema_day2.md`, `n8n_workflow_day2.json`, `api_basics_cheatsheet.md`, `day2_summary.md`
   - Ready to push to GitHub private repo

## Key Win
Never used anon key for writes. Service_role + RLS = enterprise standard achieved on Day 2.

## Loom Demo
Loom link: [COMING SOON]

## Blockers + Fixes
| Blocker | Fix |
| --- | --- |
| Postman Cloud Agent can’t hit localhost | Installed Postman Desktop Agent |
| 404 on JSONPlaceholder | Removed space in URL |
| 401 on Supabase | Used service_role key, not anon |
| Markdown preview broken | Fixed unclosed code blocks |

## Day 3 Plan
1. **Enable pgvector** — `create extension vector` in Supabase
2. **Create documents table** — `id`, `content`, `embedding vector(1536)`
3. **Build ingestion** — n8n: Read PDF → Chunk → OpenAI Embed → Store vectors
4. **Test search** — SQL `SELECT * FROM documents ORDER BY embedding <=> '[query]' LIMIT 5`

## Time Used
Hour 1: 60min | Hour 2: 60min | Hour 3: 60min | Hour 4: 90min | Total: 4h 30min