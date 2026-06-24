# Neural Networks: Zero to Agentic Systems

A 90-day self-directed journey from backpropagation fundamentals to production multi-agent systems — built in public.

---

## What This Is

This repo is my learning lab. I'm starting from first principles (building autograd and transformers by hand) and working up through fine-tuning, RAG, and eventually deploying a full multi-agent orchestration system. The goal is genuine understanding, not certificate collecting — every phase ships something real.

Backbone curriculum: [Karpathy — Neural Networks: Zero to Hero](https://karpathy.ai/zero-to-hero.html), layered with fast.ai, Hugging Face courses, and DeepLearning.AI short courses.

Full roadmap: [`90-day-curriculum-checklist.md`](90-day-curriculum-checklist.md)

---

## Four Phases

| Phase | Weeks | Focus | Deliverable |
|-------|-------|-------|-------------|
| **1 — Foundations** | 1–3 | Backprop from scratch, build GPT | From-scratch transformer inference endpoint + write-up |
| **2 — Fine-tuning** | 4–6 | QLoRA, eval, adapter merging | Fine-tuned model API + write-up |
| **3 — Production stack** | 7–9 | RAG, embeddings, MCP, observability | Instrumented RAG service + write-up |
| **4 — Agentic** | 10–13 | LangGraph, multi-agent, HITL | Multi-agent system + capstone write-up |

---

## Projects

- **Project 1 — GPT from scratch:** train a transformer on a personal corpus, serve via inference endpoint
- **Project 2 — Fine-tuned LLM:** QLoRA-fine-tune Llama 3 / Qwen 2.5, expose as API
- **Project 3 — RAG service:** retrieval-augmented generation with Langfuse tracing and retrieval evals
- **Project 4 (Capstone) — Multi-agent system:** agents that pull metrics → run diagnosis patterns → propose fixes, with human-in-the-loop approval and full Langfuse observability

---

## Repo Layout

```
/
├── phase1-foundations/      # micrograd, makemore, nanoGPT notebooks
├── phase2-finetuning/       # QLoRA runs, eval sets, adapter exports
├── phase3-rag/              # RAG pipeline, Langfuse instrumentation
├── phase4-agents/           # LangGraph graphs, multi-agent capstone
├── 90-day-curriculum-checklist.md
└── README.md
```

---

## Stack

- **Core ML:** PyTorch, Hugging Face Transformers / TRL / PEFT
- **Training:** Unsloth (QLoRA), Weights & Biases
- **RAG:** LlamaIndex / LangChain, Langfuse
- **Agents:** LangGraph, MCP, Claude / OpenAI Agents SDK
- **Infra:** vLLM / Ollama, self-hosted server, Runpod / Lambda for GPU runs

---

## Compute Budget

QLoRA runs ~$2–3 each · RAG + agent API calls ~$10–30 total · optional 8×H100 GPT speedrun ~$100.
Realistic total without the speedrun: **$30–60**.

---

## Progress

See the checklist: [`90-day-curriculum-checklist.md`](90-day-curriculum-checklist.md)

Started: June 2026
