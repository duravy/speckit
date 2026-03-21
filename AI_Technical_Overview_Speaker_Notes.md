# AI Technical Overview — Speaker Notes

> **Audience:** Technical professionals (engineers, developers, analysts) with no prior AI/ML background.
> **Tone:** Conversational, grounded in analogies your audience already lives with — databases, functions, APIs, compilers.
> **Timing:** ~3–5 minutes per content slide; ~30 seconds for section dividers.

---

## Slide 1 — From Rules to Reasoning: A Technical Guide to AI · ML · Deep Learning · Generative AI

Good morning / Good afternoon everyone. Let me start with a quick show of hands — how many of you have written an `if-else` block to handle a business rule? Almost everyone. Now, how many of you have built something that *learned* a rule from data, without you writing it yourself? Far fewer hands. That gap — between *telling* a machine what to do and *training* it to figure it out — is exactly what this session is about.

We're going to go from the very first generation of AI — hardcoded decision trees you probably built in the 90s or 2000s — all the way to the large language models like ChatGPT and Claude that your company is probably asking you to evaluate right now.

I want to be very clear about the goal for today: you're not going to walk out of here an ML engineer. But you *will* walk out understanding what these systems actually do under the hood, so when someone says "let's fine-tune the model" or "our context window is full" — you'll know exactly what that means and why it matters.

Let's get into it.

---

## Slide 2 — The AI Stack: Four Overlapping Paradigms

The first thing I want to kill is a misconception: people use "AI," "Machine Learning," "Deep Learning," and "Generative AI" as if they're synonyms. They're not. They're nested subsets — like Russian dolls.

Think of it as a Venn diagram where each inner concept is a *stricter specialisation* of the outer one.

At the outermost layer, **Artificial Intelligence** is the broadest umbrella — anything that makes a machine appear to reason or make decisions. This includes things as old as rule-based expert systems from the 1950s.

**Machine Learning** sits inside that. ML says: instead of a human writing the rules, let the system *learn* the rules from data. Your spam filter is ML. Your fraud detection engine is ML. You give it thousands of examples of "spam" and "not spam," and it builds its own internal decision logic.

**Deep Learning** sits inside ML. It's a specific family of ML algorithms — neural networks with many layers — that are particularly good at raw, unstructured data: images, sound, text. The reason AlphaGo could beat a world champion at Go in 2016 was deep learning, not someone coding Go strategies by hand.

**Generative AI** sits inside deep learning. It's the newest and most exciting layer — models that don't just *classify* or *predict*, they *create*. They generate new text, images, code, audio. GPT-4, Claude, Gemini, DALL·E, Stable Diffusion — all of these are generative AI systems.

The key mental model here: **GenAI ⊂ Deep Learning ⊂ ML ⊂ AI**. Every Generative AI system is also doing deep learning. But not every ML system is generative. Keep that nesting in mind — it'll save you from a lot of confusion in vendor conversations.

---

## Slide 3 — The Progression: From Hardcoded Rules to Learned Intelligence

Now let's walk through the history, because context matters. Each of these four eras had genuinely different engineering approaches, different strengths, and different failure modes — and importantly, they didn't *replace* each other. Your bank still runs rule-based fraud logic alongside an ML fraud model alongside a GenAI chatbot. They co-exist.

**Rule-Based Systems (1950s–1990s):** This is the "if the blood pressure is above 160 and the patient is diabetic, flag for review" era. The famous example is MYCIN, built at Stanford in the 1970s — a medical expert system that could diagnose blood infections better than most junior doctors. It was impressive, but every rule was hand-authored. When you hit a case the rules didn't cover, it fell apart. And maintaining those rules as the world changed was a full-time job.

**Classical Machine Learning (1990s–2012):** Instead of writing rules, you collect labeled examples and let an algorithm find the patterns. Think of building a spam filter: you don't enumerate every spam pattern — you give it 100,000 emails labeled spam and not-spam, and a Random Forest or SVM figures out the boundary. This scaled much better, but it still required engineers to manually select *features* — which columns of data to feed in. Feature engineering was an art form, and getting it wrong tanked model performance.

**Deep Learning (2012–2020):** The big breakthrough in 2012 was AlexNet — a neural network that destroyed the competition on the ImageNet visual recognition challenge. The key insight was: *stop hand-crafting features, let the network learn them itself from raw pixels*. This required GPUs (which had become cheap from the gaming industry) and massive datasets. The same principle that works for images works for text and audio. By 2016–2018, deep learning was powering speech recognition in your phone, real-time translation, and medical image analysis.

**Generative AI (2020–Present):** The Transformer architecture — introduced in a 2017 Google paper called "Attention Is All You Need" — made it possible to train models on essentially the entire written internet. When you scale a Transformer up to billions of parameters and train it on trillions of words, something remarkable emerges: the model doesn't just predict the next word well — it appears to *reason*, to *code*, to *explain*, to *create*. ChatGPT reached 100 million users in two months — faster than any consumer product in history.

The failure modes also evolved. Rule systems were brittle. ML systems needed clean data and good features. Deep learning needed compute and data at scale. GenAI's failure mode is *hallucination* — the model generating confident-sounding text that's factually wrong — plus non-determinism. Same question, different answers. We'll come back to why that is.

---

## Slide 4 — Enterprise Adoption: How Organisations Typically Progress

This chart is showing you an *illustrative* adoption curve — not exact survey data, but it captures a pattern that plays out across most large organisations.

Notice how the lines move in waves. Rule-based systems peaked around 2003–2006 and have been declining slowly since. Classical ML replaced them as the dominant enterprise AI paradigm through the 2010s. Then around 2018–2021, deep learning caught up. And now look at Generative AI — the steepest curve on the chart, crossing Classical ML in 2024 and heading toward 80% enterprise adoption by 2026. That's the speed we're operating at.

The bottom of this slide shows the *typical sequence* a company follows:

First, **Analytics First** — you build your data infrastructure, your data lake or warehouse, your reporting layer. You can't do ML if your data is in six different siloed systems. Most enterprises spent the 2000s here.

Then, **Operationalise ML** — you run your first predictive models in production: churn prediction, demand forecasting, fraud scoring. This is where you learn what MLOps actually means — versioning models, monitoring drift, handling retraining pipelines.

Then, **Scale Deep Learning** — computer vision for quality inspection, NLP for document processing, speech recognition for contact centres. This requires real infrastructure: GPU clusters, model serving, latency SLAs.

Finally, **GenAI Integration** — LLMs as copilots for your engineers, natural language interfaces for your internal tools, automated content generation, agentic workflows. This is where most of you are being asked to move right now.

The practical implication? If your company doesn't have a solid data foundation, jumping straight to GenAI will be painful. These layers are cumulative. The good news is that cloud providers have commoditised layers 1–3 significantly, so you can move faster now than five years ago.

---

## Slide 5 — Section Divider: Predictive AI vs Generative AI

Quick pause — section two. We're going to zoom in on the distinction that matters most for deciding which AI tool to reach for: Predictive AI vs Generative AI. These are fundamentally different problem framings, not just different algorithms.

---

## Slide 6 — Predictive AI vs Generative AI: Two Different Objectives

Let me make this concrete with a single question: *Should we give this loan to this customer?*

A **Predictive AI** model answers that question like a trained classifier. You feed it: credit score, income, debt-to-income ratio, payment history. It returns: 0.83 probability of default. Same inputs, same output, every time. Deterministic, auditable, bounded. You can explain it to a regulator. The model was trained on thousands of labeled historical loans — "this loan defaulted," "this one didn't." It learned where the decision boundary is.

Now ask a **Generative AI** system the same question: it might give you a thoughtful written explanation, or a summary of relevant regulations, or even draft a rejection letter — but you *cannot* use it to reliably produce a numerical risk score you'd stake a lending decision on. It's not deterministic. Ask it twice and you might get two different answers. It samples from a probability distribution, not a lookup table.

Here's a good rule of thumb: if you can clearly define what the *right answer* looks like — a class label, a number, a ranking — reach for Predictive AI. If the right answer is open-ended, contextual, creative, or requires language — reach for Generative AI.

Notice the metrics row. For Predictive AI, you measure accuracy, AUC-ROC, Precision/Recall — things you can compute precisely against a held-out test set. For Generative AI, measurement is much harder: BLEU and ROUGE scores for text quality, human evaluation panels for usefulness, task-specific benchmarks. Evaluating GenAI output is an open research problem.

The most expensive mistake organisations make right now is reaching for a large language model when a simple Random Forest would do the job better, cheaper, and faster. And the second-most expensive mistake is trying to squeeze a generative task — like drafting a contract — into a classification system that can't handle open-ended output. Know which tool you're picking up before you pick it up.

---

## Slide 7 — Section Divider: What LLMs Actually Do

Alright, section three — and this is the deep technical section. We're going to open up the black box of a Large Language Model and look at exactly what's happening inside. No hand-waving.

The spoiler, right on the slide: *it's not a lookup table*. The model is not searching a database of pre-stored answers. It's doing something far more interesting — and that difference explains both its capabilities and its failure modes.

---

## Slide 8 — LLMs: Probability Distributions Over Tokens, Not Fixed Logic

Here's the mental model I want you to leave with for what an LLM does:

*At every step, it's asking: "Given everything I've read so far, what's the most plausible next word?"*

Let's trace through the pipeline on this slide. You type: *"Translate to French: Hello."*

**Step 1 — Tokenise.** The text is broken into chunks called tokens. Tokens aren't words — they're sub-word units. "Hello" might be one token. "Unbelievably" might be three. More on this in a moment.

**Step 2 — Transformer Forward Pass.** Each token becomes a vector of numbers. Those vectors pass through dozens of layers of matrix multiplications — the core of the Transformer architecture. Each layer lets every token "look at" every other token in the context and update its own representation based on what it sees.

**Step 3 — Softmax Distribution.** After all those layers, the model produces a probability score for every token in its vocabulary — roughly 50,000 to 100,000 tokens. In this example: "bonjour" scores 44%, "salut" 26%, "bonsoir" 14%, and so on. This is not a lookup — it's a freshly computed probability distribution, run from scratch every single time.

**Step 4 — Sample and Decode.** One token is selected from that distribution — weighted by its probability. That token gets appended to the context, and the whole process repeats for the next token. This is called *autoregressive decoding*, and it's why generation takes time proportional to output length.

Why does this matter practically? Two reasons. First, the model is *stateless* between requests — there's no memory across conversations unless you explicitly put prior context back in the prompt. Second, because it *samples* from a distribution, the same prompt can produce different outputs on different runs. This is by design, not a bug — and it's controlled by a parameter called Temperature, which we'll cover in a few slides.

The analogy I like: imagine a brilliantly well-read autocomplete — one that's read essentially everything ever published on the internet — making a deeply informed guess about what comes next, token by token. That's an LLM.

---

## Slide 9 — Embeddings: How Tokens Become Meaningful Vectors

Okay, so we tokenise text into integer IDs. But integer IDs — like 9000, 10571, 12142 — are meaningless to a neural network. You can't do meaningful math on arbitrary numbers. The solution is **embeddings**.

An embedding is a translation step: each token ID gets mapped to a dense vector of floating-point numbers. GPT-2 used 512-dimensional vectors. GPT-3 used 1,600 dimensions. GPT-4 is estimated to use around 12,288 dimensions.

Think of it this way: if you've worked with geographic coordinates, you know that London is at (51.5°N, 0.1°W) and Paris is at (48.8°N, 2.3°E). Similar latitudes — and they're indeed both Western European cities. Embeddings do the same thing for meaning: semantically similar words end up close together in this high-dimensional space.

This is why vector arithmetic works. The slide shows the canonical example:

> **King − Man + Woman = Queen**

Subtract the "male" direction in the vector space, add the "female" direction — and you land close to the Queen vector. The model didn't explicitly encode this logic — it *emerged* from training on billions of examples. The model has seen "a king is a male monarch" and "a queen is a female monarch" enough times that the relationship is baked into the geometry of the space.

The corrected example on our slide:
> **Paris − France + Japan = Tokyo**

Paris is to France what Tokyo is to Japan. The "capital city of" relationship is encoded in the vector geometry.

Now here's the limitation of basic embeddings — what the slide calls the **Static Embedding Problem**: if "Apple" always maps to the same vector regardless of context, the model can't distinguish between the fruit and the tech company. Early systems like Word2Vec had this problem.

The fix is **Self-Attention**, which we'll see next — it dynamically adjusts a token's vector representation based on the surrounding words. "I ate an Apple" versus "I bought Apple stock" — the representation of "Apple" shifts depending on context.

---

## Slide 10 — Self-Attention: Context-Aware Meaning Through Q, K, V

Self-Attention is the core mechanism of the Transformer, and once you understand it, the whole architecture clicks into place.

Every token simultaneously plays three roles. Think of a conference room meeting:

- **Query (Q):** "What do I need to understand myself better?" — like raising your hand and asking a question.
- **Key (K):** "What information can I offer to help others?" — like your badge that signals your expertise area.
- **Value (V):** "Here's the actual content I deliver when someone pays attention to me."

For every token, we compute how well its Query matches every other token's Key — this produces an *attention score*. High score = strong relevance. Those scores are normalised with Softmax and then used to compute a weighted sum of all the Value vectors. The result is a new, richer representation of the token that incorporates context from across the entire sequence.

The formula on the slide — `Attention(Q, K, V) = softmax(QKᵀ / √dₖ) · V` — is the mathematical expression of exactly this. The `√dₖ` term is a scaling factor to prevent the dot products from getting too large in high-dimensional spaces.

Let's see it in action with the Apple example:

In **"I ate an Apple"** — the token "Apple" sends out its Query. The Key of "ate" — a food/consumption verb — scores very high against that Query. So "Apple"'s Value vector gets pulled toward the food cluster. Its final representation = fruit.

In **"I bought Apple stock"** — same token "Apple," same Query. But now "bought" and "stock" have high Key scores — finance context. "Apple"'s Value vector shifts toward the company cluster. Final representation = tech company.

Same word, same initial embedding, completely different final representation based on context. That's the power of Self-Attention — it's what allows these models to resolve ambiguity that simple word vectors can't.

---

## Slide 11 — Multi-Head Attention & the Decoder Block Architecture

One attention head looks at one relationship at a time. But language has many simultaneous dimensions — grammar, tone, entities, long-range dependencies. The Transformer runs *multiple heads in parallel*, each specialising in a different aspect:

- **Head 1** might focus on grammar and syntax — subject-verb agreement, clause boundaries.
- **Head 2** might track tone and sentiment — is this formal or informal, positive or negative?
- **Head 3** might resolve entity relationships — who did what to whom.
- **Head 4** might handle long-range dependencies — resolving what "it" refers to three sentences back.

The outputs of all heads are concatenated and projected back into the main representation. This is Multi-Head Attention.

Now zoom out to the full **Decoder Block** on the right side of the slide. This block contains:

1. **Masked Multi-Head Attention** — the token can only look at *previous* tokens, not future ones. This is the causal constraint: during generation, you don't know what comes next.
2. **Layer Normalisation** — keeps the activation values from exploding or vanishing as they move through deep stacks.
3. **Feed-Forward Network (FFN)** — two linear projections with an activation function. This is where a lot of the model's "knowledge" is stored — it acts like a lookup of patterns the model has memorised.
4. Another **Layer Normalisation.**

This entire block is stacked 12 to 96 times depending on the model. GPT-3 uses 96 layers. Each layer refines the token representations further.

Two more important architectural features: **Residual connections** — sometimes called skip connections — pass the input of each sub-layer directly to its output, bypassing the transformation. This prevents the vanishing gradient problem in very deep networks. If you've worked with ResNets in computer vision, it's the same idea. And **Causal Masking** — future tokens are masked with negative infinity before the Softmax, so they effectively get zero attention weight. The model cannot cheat and look ahead.

---

## Slide 12 — Section Divider: Tokens, Context Window & Temperature

Section four — and this is where we go from "how does it work" to "what do I need to know to actually use and build with these things." Three concepts that are absolutely non-negotiable for any practitioner: Tokens, Context Window, and Temperature. Let's go.

---

## Slide 13 — Tokenisation: How Text Becomes Numbers the Model Can Process

Let's look at the tokenisation example on this slide. The sentence *"Transformers don't read words — they read tokens"* breaks into 10 tokens, each with a unique integer ID. Notice that "Transformers" splits into "Trans" and "formers." The apostrophe in "don't" causes a split into "don" and "'t." The space before a word is often bundled into the token — that's a BPE quirk.

**BPE — Byte-Pair Encoding** — is the algorithm most modern models use. It starts with individual characters and iteratively merges the most frequently co-occurring pairs. After millions of merges, you end up with a vocabulary of 50,000–100,000 sub-word units that balance coverage and efficiency. Common words like "the," "is," "and" are single tokens. Rare or technical words fragment into multiple tokens.

This has four practical implications you need to internalise:

**Cost.** API pricing is per-token — both input and output. A 10-page Word document is roughly 5,000–8,000 tokens of input. If you're feeding that to an LLM 10,000 times a day, the numbers add up. Token efficiency is a real engineering concern.

**The ¾ rule.** On average, 1 token ≈ ¾ of an English word. A 750-word page is about 1,000 tokens. This is the number to memorise for back-of-envelope calculations.

**Multilingual variance.** English is the most token-efficient language because BPE vocabularies are built predominantly from English text. Chinese and Japanese characters often map to one token per character — similar to English. But low-resource languages, rare scripts, or highly technical jargon can use 3–5 tokens per character. If you're building a multilingual application, your per-request token cost can vary dramatically by language.

**Code.** Programming languages are often tokenised very efficiently — common keywords, brackets, and identifiers have dedicated tokens. But string literals and comments can be expensive.

One thing to be aware of: tokenisation is model-specific. GPT-4o uses a different vocabulary from Claude 3, which uses a different one from Gemini. When you see "200K context window," that's 200,000 of *that model's* tokens — not a universal unit.

---

## Slide 14 — Context Window: The Working Memory of an LLM

If embeddings are the long-term memory baked into model weights during training, the **context window** is working memory — what the model can "see" and reason about *right now*, during a single conversation or request.

The diagram on this slide shows exactly what competes for that space. At the beginning of most LLM calls you have a **System Prompt** — the instructions your application sends to set the model's persona, capabilities, and constraints. Then comes **Prior Conversation** — all the previous turns in a multi-turn chat, or retrieved documents from a RAG system. Then the **User Prompt** itself. And finally, space for the **Response**. Everything in that window is processed simultaneously in the attention mechanism — the model sees all of it at once. There's no compression happening on older messages.

Now look at the model comparison table. The landscape has changed dramatically. Until 2023, a 16,000-token context window was considered large. Today, Claude Sonnet 4.6, Claude Opus 4.6, GPT-5.4, Gemini 3.1, and Llama 4 Maverick all support **1 million tokens** — that's roughly 750,000 words, or about five complete novels stacked end to end. You could feed the entire codebase of a medium-sized software project and have the model reason about it all at once.

But there's an important caveat at the bottom: the **"lost-in-the-middle" problem**. Research shows that LLMs attend better to information at the beginning and end of the context than to content buried in the middle. If you have a 100-page document and the key fact is on page 50, the model may miss it even though it fits in the context window. This is actively improving with each model generation — but it's a real engineering constraint you need to design around. Strategies include chunking, retrieval-augmented generation, and placing the most critical instructions at the very top and bottom of the prompt.

The practical implication for system design: context window is *not* free. Larger contexts cost more to compute and take longer to process. Don't stuff the context with everything you have — curate what the model actually needs.

---

## Slide 15 — Temperature & Sampling Parameters: Controlling Output Variability

This slide is where the probabilistic nature of LLMs becomes something you can *engineer*, not just accept.

Look at the bar chart. The prompt is "Translate to French: Hello." At all three temperatures, "bonjour" is still the most likely output. But the *distribution shape* changes dramatically.

**Temperature (T)** is the master dial for creativity vs consistency.

At **T = 0.1**, "bonjour" gets 88% of the probability weight. The model is nearly deterministic. Run it a hundred times, you'll almost always get "bonjour." This is what you want for data extraction, structured output, code generation, or any task where correctness is well-defined.

At **T = 0.7**, "bonjour" gets 45%, "salut" 28%, "bonsoir" 15%. The distribution is spread. You'll see variation across runs. This is the sweet spot for conversational AI — natural-sounding but coherent.

At **T = 1.5**, the distribution flattens further — "hola" now gets 10%. You're getting truly creative — or just wrong. Think of the sky example: at T = 1.5, "The sky is ___" might complete as "the sky is weeping" or "the sky is falling" — poetic, unusual, but not reliably accurate. Reserve high temperatures for brainstorming, creative writing, or generating diverse options that a human will then review.

**Top-P (Nucleus Sampling)** adds a smarter filter on top of temperature. Rather than taking all tokens with a fixed count, it takes the *smallest set of tokens whose cumulative probability reaches P*. Using our example with P = 0.90: "blue" is 45%, plus "clear" is 28% — that's 73%. Add "grey" 15% — now 88%. Add "purple" 7% — that's 95%, which exceeds P = 0.90. So Top-P = 0.90 keeps exactly {blue, clear, grey, purple} and discards the rest. The elegance here is that when the model is very confident — say 90% on a single token — Top-P naturally restricts to just that one token. When it's uncertain and the probability is spread, Top-P allows a wider candidate set. It adapts dynamically.

**Top-K** is simpler but less adaptive: always keep the top K tokens by probability, regardless of how much probability mass they represent. With K = 3, you always pick from the three highest-probability tokens. Fast and easy to reason about, but less sensitive to how peaked or flat the distribution is. Many production systems combine Top-K with Top-P for fine-grained control.

The take-home engineering rule: **for anything mission-critical where you need reproducible output, set temperature near zero.** For anything creative or conversational, use T = 0.7–1.0 with Top-P = 0.95 as sensible defaults.

---

## Slide 16 — From Next-Word Predictor to Helpful Assistant: Two Training Stages

There's a question that comes up every time I explain how LLMs work: "If the model is just predicting the next token, how does it know to answer questions helpfully instead of just continuing the text in a weird way?"

The answer is: **training in two stages.**

**Stage 1 — Pre-Training** is where the model learns language, facts, and reasoning from raw text. We're talking about *the internet* — books, Wikipedia, GitHub, academic papers, forums, news — trillions of tokens. The objective is pure and self-supervised: predict the next token. No human labeling needed. The model absorbs the patterns, grammar, world knowledge, and reasoning structures that appear in that text. This is enormously expensive: GPT-3's pre-training was estimated at around $4 million in GPU compute in 2020. Modern frontier models are orders of magnitude more expensive.

What you get after Stage 1 is a **base model** — incredibly knowledgeable, but socially awkward. Ask it "What is the capital of France?" and it might respond "What is the capital of France? Answer: Paris. Or perhaps: What is the capital of Spain? Lisbon." It's *completing text*, not *answering questions*. It doesn't know it's supposed to be an assistant.

**Stage 2 — Supervised Fine-Tuning (SFT)** fixes this. Human annotators write thousands to hundreds-of-thousands of high-quality example dialogues: question → ideal answer. The model is then fine-tuned on these examples — essentially taught "when a human asks something in this format, respond like this." This is much cheaper than pre-training. Most frontier labs also apply a third stage called RLHF — Reinforcement Learning from Human Feedback — where human raters rank model outputs and the model is trained to produce outputs humans prefer. That's what creates the "helpful, harmless, honest" behaviour profile.

The result is a **chat model** that follows instructions, declines unsafe requests, and gives direct answers. Same weights at the core — the knowledge came from pre-training. The personality and behaviour came from fine-tuning.

Why does this matter to you? Because if you're fine-tuning models for your organisation, you're doing Stage 2 — you're teaching the model to specialise, not teaching it everything it knows. And if a model gives you a strange or unhelpful response, it's often a failure of alignment (Stage 2) rather than a failure of knowledge (Stage 1). These have different remedies: better prompting vs fine-tuning vs model selection.

---

## Slide 17 — The Symphony of a Single Token: Complete End-to-End Pipeline

Let's now put the whole picture together in one pass. This slide traces exactly what happens — computationally — every single time the model produces one token. And remember, if the response is 200 words, this runs approximately 270 times.

**Step 1 — Raw Text.** You type your message. It's a string of characters.

**Step 2 — BPE Tokenisation.** That string is mapped to a sequence of integer IDs using the model's vocabulary. "Translate to French: Hello" might become [9000, 10571, 12142, ...]. This happens on the client side before anything hits the model.

**Step 3 — Token Embeddings.** Each integer ID is looked up in an embedding table — a large matrix — and mapped to a dense vector. For GPT-4, each token becomes a vector of 12,288 floating-point numbers.

**Step 4 — Positional Encoding.** A signal is added to each vector encoding its position in the sequence. Without this, the model has no way to know whether "John" appeared before or after "hit" in the sentence. The position signal is either sinusoidal (fixed formula) or learned during training.

**Steps 5 & 6 repeat through N decoder layers:**

**Step 5 — Self-Attention (QKV).** Within each decoder layer, every token attends to all prior tokens, updating its contextual representation. This is the most computationally expensive part — it scales quadratically with sequence length, which is why long contexts are expensive.

**Step 6 — Feed-Forward Network.** Each token's representation passes through a two-layer neural network with an activation function. This step is applied independently to each token position and is where much of the model's factual knowledge is believed to reside.

**Step 7 — Softmax Distribution.** After all N layers, the final hidden state of the last token is projected onto the vocabulary — producing a probability score for every possible next token. This is a vector of 50,000–100,000 numbers.

**Step 8 — Sample & Output.** Temperature and Top-P are applied to that distribution. One token is sampled. It's decoded back to text, appended to the conversation, and the entire pipeline runs again from Step 5 for the next token.

This is happening in milliseconds, on clusters of thousands of GPUs, for millions of simultaneous users. It's an extraordinary piece of engineering. And every token you see streaming onto your screen is the result of this full forward pass.

---

## Slide 18 — The Mental Model to Carry Forward

We've covered a lot of ground. Let me leave you with four things that I genuinely want you to remember and that I think will make you more effective as you engage with AI projects in your organisation.

**One — AI ⊃ ML ⊃ DL ⊃ GenAI — nested, not competing.** These are layered paradigms that co-exist. Your company didn't throw away its databases when it built APIs. It didn't throw away batch jobs when it built real-time systems. In the same way, you're not throwing away your rule-based systems or your ML fraud model when you add a GenAI copilot. The layers compound.

**Two — Predictive AI and Generative AI solve different problems.** When someone comes to you and says "we should use AI for this," your first question should be: is this a prediction problem or a generation problem? Is the right output well-defined and measurable, or is it open-ended and contextual? That single question will save your team enormous time and money by pointing to the right tool class.

**Three — LLMs compute probability, not truth.** Every response is a sample from a distribution. There is no lookup. There is no verification against a ground truth database. The model is generating the most *plausible* next sequence of tokens given its training. This is why hallucinations happen — the model doesn't know what it doesn't know, and "plausible text" is not the same as "factually correct text." Design your systems to account for this: human review, retrieval-augmented grounding, confidence scoring, output validation.

**Four — Token budget, context depth, and temperature are your engineering levers.** You are not just a consumer of a black box. You have dials. Token efficiency affects cost. Context window depth affects reasoning quality. Temperature controls the reproducibility-creativity trade-off. Tune all three deliberately, document what works, and treat prompting as a first-class engineering discipline.

Thank you. I'm happy to take questions.

---

*Speaker notes prepared for: AI_Technical_Overview.pptx*
*Audience: Technical professionals, AI/GenAI newcomers*
*Estimated delivery time: 70–90 minutes for all 18 slides*
