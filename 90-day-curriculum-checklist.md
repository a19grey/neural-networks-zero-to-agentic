# 90-Day Curriculum — Ordered Action Checklist

Work top to bottom. Default cadence: **3 nights learning + 2 nights building per week.** Bold items are the things you deploy/publish — those are the actual portfolio. When a week slips, cut a learning item, never a deploy item.

---

## Week 0 — Setup (one evening)

- [ ] Create accounts: [Hugging Face](https://huggingface.co/join) · [Weights & Biases](https://wandb.ai) (free, for training logs) · a GPU-rental account ([Runpod](https://www.runpod.io) / [Lambda](https://lambda.ai) / [Vast.ai](https://vast.ai))
- [ ] Decide portfolio structure on your site — one subpage per project (e.g. `/projects/gpt-from-scratch`)
- [ ] Create a public GitHub repo + a blog surface for the four write-ups

---

## PHASE 1 — Foundations (Weeks 1–3)
Hub for all videos + code: **[Karpathy — Neural Networks: Zero to Hero](https://karpathy.ai/zero-to-hero.html)** · [GitHub repo](https://github.com/karpathy/nn-zero-to-hero)

### Week 1 — backprop + language-model basics
- [ ] Lecture 1 — *micrograd* (autograd + backprop from scratch)
- [ ] Lecture 2 — *makemore* (bigram, intro to tensors)
- [ ] Lecture 3 — *makemore* (MLP; train/dev/test, hyperparams)
- [ ] Do the in-video exercises; push notebooks to GitHub
- [ ] *(Optional intuition)* [3Blue1Brown neural-net series](https://www.3blue1brown.com/topics/neural-networks)

### Week 2 — internals + GPT
- [ ] Lecture 4 — activations/gradients, BatchNorm
- [ ] Lecture 5 — backprop ninja *(skim — the calculus is trivial for you)*
- [ ] Lecture 6 — WaveNet / deeper nets
- [ ] Lecture 7 — **"Let's build GPT"** (the core one)
- [ ] Start training a nanoGPT on a personal corpus (your writing / hardware docs / OpenClaw archive)

### Week 3 — tokenizer + ship Project 1
- [ ] Lecture 8 — "Let's build the GPT Tokenizer"
- [ ] Read the [nanochat repo](https://github.com/karpathy/nanochat) end-to-end as a textbook
- [ ] *(Optional headliner, ~$100)* Run the nanochat speedrun on rented 8×H100
- [ ] **DEPLOY — Project 1:** serve your from-scratch transformer as an inference endpoint + minimal web UI on your server
- [ ] **WRITE-UP 1:** *"What I learned training a GPT from scratch"*

---

## PHASE 2 — Training & fine-tuning (Weeks 4–6)

### Week 4 — top-down practical
- [ ] [fast.ai Practical Deep Learning](https://course.fast.ai) — Lessons 1–2
- [ ] fast.ai — Lesson 3 (+ deployment sections)
- [ ] [HF LLM Course](https://huggingface.co/learn/llm-course) — intro + transformers chapters

### Week 5 — fine-tuning mechanics
- [ ] HF LLM Course — fine-tuning / TRL chapters
- [ ] Read the [Unsloth fine-tuning guide](https://docs.unsloth.ai/get-started/fine-tuning-llms-guide)
- [ ] Prep a 500–2,000-example ChatML dataset in a domain where you have an edge
- [ ] First QLoRA run (Llama 3.1 8B / Qwen 2.5 7B, rank 16), ~$2–3 GPU

### Week 6 — evaluate + ship Project 2
- [ ] Build a held-out eval set; compare base vs fine-tuned side-by-side
- [ ] Merge adapters, export ([Ollama](https://ollama.com) / [vLLM](https://docs.vllm.ai))
- [ ] **DEPLOY — Project 2:** fine-tuned model as an inference API on your server
- [ ] **WRITE-UP 2:** *"When fine-tuning beats RAG (and when it doesn't)"*
- [ ] *(Optional, ties to FPV)* QLoRA a small vision-language model for drone-inspection defect tagging

---

## PHASE 3 — Production stack (Weeks 7–9)

### Week 7 — RAG + embeddings
- [ ] [DeepLearning.AI — Agentic RAG / LlamaIndex short course](https://www.deeplearning.ai/courses/)
- [ ] Build a basic RAG over your corpus
- [ ] Add a retrieval eval (hit-rate / faithfulness)

### Week 8 — observability + structured outputs
- [ ] Self-host [Langfuse](https://langfuse.com) on your server
- [ ] Instrument the RAG with Langfuse traces
- [ ] DeepLearning.AI — *Structured Outputs* short course + [Pydantic](https://docs.pydantic.dev) typed tool I/O

### Week 9 — MCP + ship Project 3
- [ ] [HF MCP Course](https://huggingface.co/learn/mcp-course) — build your first MCP server
- [ ] Wrap one of your tools as an MCP server
- [ ] **DEPLOY — Project 3:** instrumented, evaluated RAG service, self-hosted
- [ ] **WRITE-UP 3:** *"Building a RAG system you can actually measure"*

---

## PHASE 4 — Agentic orchestration (Weeks 10–13)

### Week 10 — agent fundamentals
- [ ] [HF Agents Course](https://huggingface.co/learn/agents-course) — Unit 1 (earn the Fundamentals certificate)
- [ ] HF Agents Course — Units 2–3 (smolagents, LlamaIndex)
- [ ] Build a single tool-using agent end-to-end

### Week 11 — LangGraph deep dive (production standard)
- [ ] [DeepLearning.AI — AI Agents in LangGraph](https://www.deeplearning.ai/short-courses/ai-agents-in-langgraph/)
- [ ] [LangGraph docs](https://langchain-ai.github.io/langgraph/) — state, checkpointing, conditional edges
- [ ] Add human-in-the-loop (`interrupt`) + retries to an agent
- [ ] LangGraph long-term memory (LangMem) course

### Week 12 — lab SDK + multi-agent
- [ ] Go deep on ONE: [Claude Agent SDK](https://github.com/anthropics/claude-agent-sdk-python) ([docs](https://docs.claude.com)) **or** [OpenAI Agents SDK](https://openai.github.io/openai-agents-python/)
- [ ] Skim the other; write your own framework-selection cheat-sheet
- [ ] *(Optional, 1 evening)* [CrewAI](https://docs.crewai.com) multi-agent prototype
- [ ] Stand up the multi-agent skeleton for the capstone

### Week 13 — ship capstone + portfolio
- [ ] **DEPLOY — Capstone (Project 4):** multi-agent system on your server. Strongest instantiation: productionize OpenClaw's content-diagnosis — agents pull IG metrics → run your diagnosis patterns → propose script-level fixes, with HITL approval + Langfuse traces + an eval suite
- [ ] **WRITE-UP 4:** flagship post + architecture diagram
- [ ] Build the portfolio page tying all 4 live demos + 4 posts into one narrative
- [ ] Write one framework-agnostic *systems/architecture* post (the eng-manager signal)
- [ ] Claim certificates: HF Agents + 1–2 DeepLearning.AI

---

## Ongoing — ~30 min/week
- [ ] Skim [Simon Willison's blog](https://simonwillison.net) + the frontier labs' release notes to stay current

---

### Compute budget recap
QLoRA runs ~$2–3 each · Langfuse self-host $0 · agent/RAG API calls ~$10–30 total · optional nanochat speedrun ~$100. **Realistic total: ~$30–60 without the speedrun, ~$120–180 with it.** Every course above is free.
