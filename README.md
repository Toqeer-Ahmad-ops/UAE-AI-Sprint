# 🚀 30-Day UAE AI Automation Sprint 🇦🇪

[![Location](https://img.shields.io/badge/Location-Dubai,_UAE-black)](https://u.ae/)
[![n8n](https://img.shields.io/badge/n8n-Automation-EA4B71?logo=n8n)](https://n8n.io/)
[![RAG](https://img.shields.io/badge/RAG-English_|_Arabic-4285F4)](https://github.com/Toqeer-Ahmad-ops)
[![Docker](https://img.shields.io/badge/Docker-Self_Hosted-2496ED?logo=docker)](https://www.docker.com/)
[![Open to Work](https://img.shields.io/badge/Open_to_Work-AI_Automation_Engineer-success)](https://www.linkedin.com/in/toqeer-ahmad-498800220)

> Building production-grade AI Automation systems for the UAE market using n8n, Google Gemini, Supabase, RAG, and enterprise workflows.

---

# 🎯 Goal

Become job-ready for:

- AI Automation Engineer
- n8n Developer
- RAG Engineer
- AI Solutions Engineer

by building real-world production projects focused on UAE business use cases.

---

# 📌 Project Overview

This repository documents my **30-Day UAE AI Automation Sprint**.

Each day I build a practical AI automation project while learning production best practices used by modern companies.

The focus is on:

- Enterprise AI Automation
- Retrieval-Augmented Generation (RAG)
- Workflow Automation with n8n
- Google Gemini APIs
- Supabase pgvector
- Docker
- REST APIs
- English & Arabic AI systems

---

# 📅 Sprint Progress

| Day | Project | Tech Stack | Status |
|------|----------|------------|--------|
| Day 1 | AI Automation Foundations | AI Fundamentals | ✅ Complete |
| Day 2 | n8n Workflow Practice | n8n + JavaScript | ✅ Complete |
| Day 3 | Enterprise RAG Document Ingestion | n8n + Gemini Embedding 2 + Supabase pgvector | ✅ Complete |
| Day 4 | Enterprise RAG Retrieval API | n8n + RAG + Semantic Search | ✅ Complete |
| Day 5 | Enterprise HR Assistant API (Bilingual) | n8n + Gemini 2.5 Flash + Metadata RAG | ✅ Complete |
| Day 6 | Enterprise WhatsApp AI Assistant + RAG | n8n + WhatsApp API + Gemini + RAG | 🚧 In Progress |


---

# 🚀 Featured Projects

| Project | Repository | Stack | Status |
|---------|------------|-------|--------|
| Enterprise RAG API – Bilingual HR Assistant (EN/AR) | [enterprise-rag-api-bilingual-hr-assistant](https://github.com/Toqeer-Ahmad-ops/enterprise-rag-api-bilingual-hr-assistant) | n8n + Gemini 2.5 Flash + Embedding 2 (768) + Supabase pgvector + Metadata Search | ✅ Complete |
| End-to-End Arabic Workflow – Dubai Real Estate | [end-to-end-arabic-workflow-dubai](https://github.com/Toqeer-Ahmad-ops/end-to-end-arabic-workflow-dubai) | n8n + Arabic OCR + Gemini | ✅ Complete |

## 📚 Day 3 — Enterprise RAG Document Ingestion

Production-ready ingestion pipeline that:

- Receives HR documents through an API
- Splits documents into semantic chunks
- Generates vector embeddings
- Stores vectors inside Supabase pgvector
- Logs successful and failed ingestions

**Skills**

- n8n
- JavaScript
- Gemini Embedding 2
- Supabase
- PostgreSQL
- pgvector

🔗 Repository:
https://github.com/Toqeer-Ahmad-ops/enterprise-rag-api-bilingual-hr-assistant
---

## 🤖 Day 4 — Enterprise RAG Retrieval API

Production-ready bilingual Retrieval-Augmented Generation (RAG) API.

The workflow:

- Understands semantic meaning
- Performs vector similarity search
- Retrieves relevant company knowledge
- Generates grounded answers
- Supports English and Arabic
- Returns structured API responses

**Features**

- Semantic Search
- Enterprise RAG
- Prompt Engineering
- Source Attribution
- Bilingual Responses (EN/AR)
- Production API Design

🔗 Repository:
https://github.com/Toqeer-Ahmad-ops/enterprise-rag-api-bilingual-hr-assistant
---
## 🧠 Day 5 — Enterprise HR Assistant API (Bilingual) — NEW

**Complete end-to-end bilingual RAG system:**

- Metadata-aware retrieval (filter by project/developer/type)
- Cross-lingual AR→EN search
- Grounded, hallucination-resistant answers
- Enterprise logging + Postman-tested API
- Handles real Dubai HR documents

**Flow:** PDF Upload → Extract Text → OCR Cleaning → Chunk (1000/200) → Gemini Embedding 2 (768) → Supabase pgvector → User Question → Detect Language (EN/AR) → Query Embedding → Metadata-Aware Vector Search → Build Context → Gemini 2.5 Flash → Grounded Answer → Log Metrics

# 🏗 Architecture

<p align="center">
  <img src="https://github.com/Toqeer-Ahmad-ops/enterprise-rag-api-bilingual-hr-assistant/blob/main/assets/architecture-v2.png?raw=true" alt="Enterprise Bilingual RAG Architecture" width="100%" />
</p>

<details>
<summary>📄 View Mermaid Source</summary>

```mermaid
flowchart TD
    A[PDF Upload] --> B[Extract Text From PDF] --> C[OCR Cleaning] --> D[Chunk Documents<br/>1000 / 200] --> E[Gemini Embedding 2<br/>768] --> F[(Supabase pgvector Database)]
    F --- G[User Question]
    G --> H[Detect Language<br/>EN / AR] --> I[Gemini Query Embedding] --> J[Metadata-Aware Vector Search] --> K[Build Retrieval Context] --> L[Gemini 2.5 Flash] --> M[Grounded Final Answer] --> N[Log Query + Retrieval Metrics]

🔗 Repository:
https://github.com/Toqeer-Ahmad-ops/enterprise-rag-api-bilingual-hr-assistant

# 🛠️ Skills Demonstrated

- n8n Workflow Automation
- Enterprise AI Automation
- Google Gemini APIs
- Retrieval-Augmented Generation (RAG)
- Prompt Engineering
- JavaScript
- REST APIs
- Supabase
- PostgreSQL
- pgvector
- HNSW Indexing
- Docker
- Semantic Search
- Bilingual AI (English & Arabic)

---

# 📈 Current Learning Roadmap

✅ Workflow Automation

✅ Vector Databases

✅ Enterprise RAG

✅ API Development

✅ Prompt Engineering

🚧 Enterprise AI Agents

🚧 WhatsApp Automation

🚧 AI Voice Agents

🚧 Multi-Agent Systems

🚧 MCP Servers

---

# 🌍 Target Use Cases

Projects are designed around real UAE business scenarios such as:

- HR Assistants
- Employee Handbooks
- SOP Search
- Internal Knowledge Bases
- Real Estate
- Healthcare
- Legal Documents
- Customer Support Automation

---

# 📂 Portfolio Structure

This repository serves as the central portfolio for my 30-Day UAE AI Automation Sprint.

Each major project is published in its own dedicated GitHub repository with documentation, workflows, screenshots, and source code.

The sprint repository tracks my learning journey and links to each completed project.

---

# 🎯 Career Goal

I'm building this portfolio publicly while preparing for opportunities as an:

- AI Automation Engineer
- n8n Developer
- RAG Engineer
- AI Solutions Engineer

📍 Dubai, UAE

🌍 Open to Remote Opportunities

---

# 📬 Connect With Me

**Toqeer Ahmad**

📍 Dubai, UAE 🇦🇪

🔗 LinkedIn

https://www.linkedin.com/in/toqeer-ahmad-498800220

⭐ Follow my journey as I build one production-ready AI automation project every day.
