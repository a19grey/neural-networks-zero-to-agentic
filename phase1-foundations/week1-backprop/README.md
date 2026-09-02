# Week 1 — Backprop + Language Model Basics

**Goal:** Understand backpropagation from first principles, then apply it to character-level language modeling with PyTorch tensors.

**Source:** [Karpathy — Neural Networks: Zero to Hero](https://karpathy.ai/zero-to-hero.html) · [Course repo](https://github.com/karpathy/nn-zero-to-hero) · [micrograd repo](https://github.com/karpathy/micrograd)

**Time budget:** ~6 hours of video + ~4–6 hours coding/exercises (3 learning nights + buffer)

**Prerequisites:** Python 3.11+, Phase 0 setup complete (uv venv, wandb via fnox)

--- 

## Week deliverables

- [ ] All three lecture notebooks saved in this folder (`lecture1_micrograd.ipynb`, `lecture2_makemore_bigram.ipynb`, `lecture3_makemore_mlp.ipynb`)
- [ ] All in-video exercises completed (Colab for L1; E01–E06 for L2; E01–E03 for L3)
- [ ] Notebooks pushed to GitHub with outputs cleared

---

## Lecture 1 — The spelled-out intro to neural networks and backpropagation: building micrograd

**~2h26m** · Autograd engine from scratch, manual backprop, train a tiny MLP

| Resource | Link |
|----------|------|
| Video | [YouTube — building micrograd](https://www.youtube.com/watch?v=VMj-3S1tku0) |
| Notebooks | [nn-zero-to-hero/lectures/micrograd](https://github.com/karpathy/nn-zero-to-hero/tree/master/lectures/micrograd) |
| Repo | [karpathy/micrograd](https://github.com/karpathy/micrograd) |
| Exercise (Colab) | [micrograd exercises](https://colab.research.google.com/drive/1FPTx1RXtBfc4MaTkf7viZZD4U2F9gtKN?usp=sharing) |


**Key concepts:** scalar derivatives · chain rule · `Value` autograd object · compute graphs · manual vs automatic backprop · gradient descent · training loop

### Watch

- [ ] Watch the full lecture (~2h26m)
- [ ] 00:00 — intro + micrograd overview
- [ ] 00:08 — derivatives (single input, then multiple inputs)
- [ ] 00:19 — building the core `Value` object + graph visualization
- [ ] 00:32 — manual backprop example #1 (simple expression)
- [ ] 00:52 — manual backprop example #2 (a neuron)
- [ ] 01:09 — implement `backward()` for each operation (+, ×, tanh, etc.)
- [ ] 01:17 — backprop through a full expression graph
- [ ] 01:27 — fix the "node used twice" bug; break up tanh
- [ ] 01:39 — same graph in PyTorch (comparison)
- [ ] 01:43 — build a tiny MLP library in micrograd
- [ ] 01:51 — loss function + collect parameters
- [ ] 02:01 — gradient descent loop; train the network
- [ ] 02:16 — walkthrough of full micrograd source on GitHub
- [ ] 02:21 — peek at PyTorch's C++ backward for tanh

### Demo tasks

- [ ] Copy the lecture notebook(s) into this folder; add a title cell (lecture name, date, key concept)
- [ ] Implement the `Value` class: forward ops (`+`, `*`, `tanh`, `exp`, etc.) and `.backward()`
- [ ] Do both manual backprop examples on paper *before* coding — verify your gradients match the code
- [ ] Build `Neuron`, `Layer`, and `MLP` classes; train on the tiny moon dataset from the video
- [ ] Compare micrograd gradients to PyTorch autograd on the same expression (they should match)
- [ ] Complete the [Google Colab exercise](https://colab.research.google.com/drive/1FPTx1RXtBfc4MaTkf7viZZD4U2F9gtKN?usp=sharing) without peeking at solutions first
- [ ] *(Stretch)* Read through [karpathy/micrograd](https://github.com/karpathy/micrograd) end-to-end and annotate anything you couldn't have written yourself

---

## Lecture 2 — The spelled-out intro to language modeling: building makemore

**~1h58m** · Bigram character-level LM, `torch.Tensor`, NLL loss, sampling

| Resource | Link |
|----------|------|
| Video | [YouTube — building makemore (bigrams)](https://www.youtube.com/watch?v=PaCmpygFfXo) |
| Notebook | [makemore_part1_bigrams.ipynb](https://github.com/karpathy/nn-zero-to-hero/blob/master/lectures/makemore/makemore_part1_bigrams.ipynb) |
| Dataset | [names.txt](https://github.com/karpathy/makemore/blob/master/names.txt) (bundled in makemore repo) |
| Reference impl | [karpathy/makemore](https://github.com/karpathy/makemore) |

**Key concepts:** autoregressive LM · bigram counts · `torch.Tensor` indexing/broadcasting · negative log-likelihood · sampling from a model · train/dev/test splits (preview)

**Useful prep (if tensors feel rusty):**
- [CS231n Python/Numpy tutorial](https://cs231n.github.io/python-numpy-tutorial/)
- [PyTorch Tensor basics](https://pytorch.org/tutorials/beginner/basics/tensorqs_tutorial.html)

### Watch

- [ ] Watch the full lecture (~1h58m)
- [ ] 00:00 — intro: character-level language modeling roadmap
- [ ] 00:03 — load and explore `names.txt`
- [ ] 00:06 — count bigrams (Python dict approach)
- [ ] 00:12 — count bigrams in a 2D `torch.Tensor` ("training" the model)
- [ ] 00:18 — normalize rows → probabilities; NLL loss
- [ ] 00:25 — `torch.Tensor` subtleties (dtype, device, broadcasting)
- [ ] 00:35 — sampling: generate names from the bigram model
- [ ] 00:45 — neural-net version of the bigram model (`nn.Linear` + softmax/NLL)
- [ ] 00:55 — `F.one_hot` vs direct indexing into weight rows
- [ ] 01:05 — `F.cross_entropy` and why it's preferred
- [ ] 01:15 — full training loop; compare counting vs neural net

### Demo tasks

- [ ] Copy [makemore_part1_bigrams.ipynb](https://github.com/karpathy/nn-zero-to-hero/blob/master/lectures/makemore/makemore_part1_bigrams.ipynb) into this folder and run it end-to-end
- [ ] Reproduce the counting bigram model from scratch (no copy-paste of the count loop)
- [ ] Reproduce the neural-net bigram model; confirm loss matches the counting approach
- [ ] Sample at least 10 generated names from your trained model
- [ ] **E01:** Train a **trigram** model (2 chars in → predict 3rd). Counting or neural net. Did loss improve over bigram?
- [ ] **E02:** Split data 80/10/10 (train/dev/test). Train bigram + trigram on train only; evaluate on dev and test. What do you see?
- [ ] **E03:** Tune smoothing/regularization strength on the dev set; plot train vs dev loss. Evaluate best setting once on test.
- [ ] **E04:** Remove `F.one_hot`; index directly into rows of `W`. Confirm identical results.
- [ ] **E05:** Replace manual NLL with `F.cross_entropy`. Explain why the built-in is better.
- [ ] **E06:** *(Meta)* Invent and complete one extension exercise of your own (e.g. different dataset, 4-gram, visualize bigram heatmap)

---

## Lecture 3 — Building makemore Part 2: MLP

**~1h15m** · Embedding table, 2-layer MLP char-LM, learning rate search, train/val/test splits

| Resource | Link |
|----------|------|
| Video | [YouTube — makemore Part 2: MLP](https://youtu.be/TCH_1BHY58I) |
| Notebook | [makemore_part2_mlp.ipynb](https://github.com/karpathy/nn-zero-to-hero/blob/master/lectures/makemore/makemore_part2_mlp.ipynb) |
| Colab (exercises) | [MLP exercises notebook](https://colab.research.google.com/drive/1YIfmkftLrz6MPTOO9Vwqrop2Q5llHIGK?usp=sharing) |
| Paper | [Bengio et al. 2003 — A Neural Probabilistic Language Model](https://www.jmlr.org/papers/volume3/bengio03a/bengio03a.pdf) |

**Key concepts:** character embeddings · MLP language model · `F.cross_entropy` · minibatch training · learning rate tuning · overfitting one batch vs full dataset · train/val/test splits · sampling from MLP

### Watch

- [ ] Watch the full lecture (~1h15m)
- [ ] 00:00 — intro + Bengio 2003 paper walkthrough
- [ ] 00:09 — rebuild training dataset (context → next char)
- [ ] 00:12 — embedding lookup table
- [ ] 00:18 — hidden layer + `torch.Tensor` internals (storage, views)
- [ ] 00:29 — output layer + NLL loss
- [ ] 00:32 — `F.cross_entropy` and why
- [ ] 00:37 — training loop; overfit a single batch first
- [ ] 00:41 — full-dataset training with minibatches
- [ ] 00:45 — find a good initial learning rate (LR range test)
- [ ] 00:53 — train/val/test splits and why
- [ ] 01:00 — experiment: larger hidden layer
- [ ] 01:05 — visualize character embeddings
- [ ] 01:07 — experiment: larger embedding size
- [ ] 01:13 — sample names from the trained MLP

### Demo tasks

- [ ] Copy [makemore_part2_mlp.ipynb](https://github.com/karpathy/nn-zero-to-hero/blob/master/lectures/makemore/makemore_part2_mlp.ipynb) into this folder and run it end-to-end
- [ ] Implement the MLP from scratch: embedding → hidden (tanh) → logits → `F.cross_entropy`
- [ ] Overfit a single batch (loss → ~0) before training on the full dataset
- [ ] Run the learning-rate range test; pick an LR and log the choice in your notebook
- [ ] Split into train/val/test; track val loss each epoch
- [ ] Sample generated names; compare quality to the Lecture 2 bigram model
- [ ] **E01:** Tune hyperparameters to **beat validation loss 2.2** (Karpathy's benchmark in the video)
- [ ] **E02:** (1) Compute the loss you'd expect with perfectly uniform predictions at init. Compare to what you actually get. (2) Fix initialization so starting loss is closer to the uniform baseline.
- [ ] **E03:** Read Bengio et al. 2003; implement and try one idea from the paper. Did it help?
- [ ] Log at least one training run to W&B (`model`, `dataset`, `lr`, `batch_size`, `epochs`) via `fnox exec -- python ...`

---

## Optional — visual intuition

- [ ] [3Blue1Brown — Neural Networks series](https://www.3blue1brown.com/topics/neural-networks) (watch before or alongside Lecture 1 for geometric intuition on what neurons are doing)

---

## Notes

<!-- Add your own notes here as you work through the material -->
