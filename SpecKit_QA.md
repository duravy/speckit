# SpecKit Evolution: Community Q&A

This document summarizes the community Q&A regarding the evolution of SpecKit, its workflows, and best practices for managing AI-driven development.

---
- ## 1. Documentation & Technical "Drift"
  **Question:** After several iterations, the plan, tasks, and other files can drift from what actually shipped. Do you update those files or leave them as historical? Should we update only the spec doc or all the docs?
  
  **Answer:**
  I prioritize the **specification document** as the sole source of truth.
  * **The Spec:** If you add features mid-implementation (like a testimonial box or newsletter form), ask the LLM to encode those learnings back into the spec.
  * **The Plan:** This is a flexible technical document (API shapes, database choices). Update it only if fundamental technical decisions change (e.g., switching from SQLite to a Cloud Document DB).
  * **The Tasks:** These are transient. You can delete and recreate tasks as the plan evolves.
  * **Priority:** Spec Document > Constitution > Implementation Plan.
  
  ---
- ## 2. Multi-Repo Architecture
  **Question:** My team uses different repos for logic, UI, and GraphQL. Should we use one SpecKit deployment per repo, or one shared repo for specs?
  
  **Answer:**
  Personally, I find **per-repo configurations** work best.
  * **Containment:** SpecKit commands (like `/specify`) create branches within the local repository, keeping the versioning and context contained.
  * **Complexity:** Cross-referencing a central spec repo via Git submodules often increases management overhead unnecessarily.
  * **Shared Standards:** If you have organization-wide standards, you can share a **Constitution** file via a Git submodule, but keep the specific feature specs local to their respective repositories.
  
  ---
- ## 3. Managing "Rogue" AI Changes
  **Question:** While refactoring, the AI (e.g., Cursor) sometimes starts creating files or features that weren't specked out. How do you unwind this?
  
  **Answer:**
  The recipe is to lean heavily into **Git workflows**:
  1.  **Branching:** SpecKit creates a branch for you by default—use it.
  2.  **Staging:** Use a Git client (GitHub Desktop, GitKraken, etc.) to review changes.
  3.  **Discarding:** If the AI goes "off the rails," simply update your spec with the correct requirements and **discard the uncommitted rogue files** in your Git client.
  4.  **Commit Often:** Commit small batches of code that work so you have a "safe" state to return to.
  
  ---
- ## 4. Reusing Specs for Future Refactors
  **Question:** If I refactor my site in the future with a different framework, can I really just reuse the spec? Does the agent rebuild everything from scratch?
  
  **Answer:**
  The spec is an **executable artifact**. Because it focuses on "what" to build rather than "how," you can toss an old spec into a new project context (e.g., moving from Hugo to Jekyll) and ask the AI to rebuild that feature.
  * **Greenfield Projects:** If you started from zero with SpecKit, you can recreate the whole app easily.
  * **Brownfield Projects:** For existing sites, you can recreate any specific feature that has an associated spec file, though it won't automatically recreate parts of the site that were never specked.
  
  ---
- ## 5. Test-Driven Development (TDD) vs. Speed
  **Question:** The current templates force a TDD approach, which is context-heavy and expensive. Can we have a non-TDD option?
  
  **Answer:**
  Yes. While TDD is great for enterprise projects, it’s often overkill for quick prototypes or personal blogs. We are working on a **TDD-less option** for the built-in templates. This will allow you to focus on seeing the product on your screen first and adding tests later if the project becomes more "serious."
  
  ---
- ## 6. SpecKit for Existing Projects
  **Question:** What is the proper way to add features to a website that wasn't originally built with SpecKit?
  
  **Answer:**
  It is the same process as a new project, but you must provide **proactive context**.
  * **Bootstrap Context:** Use an agent file (like `custom.md`) to explain how your project is structured (where components live, how the build works).
  * **Model Intelligence:** Modern LLMs are excellent at scanning folders to suss out relationships, but defining your "source of truth" in a `.specified` folder makes the AI much more accurate during iterations.
  
  ---
- ## 7. Handling Monorepos
  **Question:** How does the constitution fit into a single repo that contains backend, frontend, and database files?
  
  **Answer:**
  Monorepos are a major use case we are currently addressing. The future approach involves:
  * **Granularity:** Allowing multiple `.specified` folders within a single repository (e.g., `/apps/web/.specified` and `/apps/api/.specified`).
  * **Customization:** You keep the same slash commands, but the requirements and constitution are tailored to the specific subdirectory you are working in.
  
  ---
- ### Resources
  * **GitHub:** [github.com/github/spec-kit](https://github.com/github/spec-kit)
  * **Contribute:** Participate in discussions and provide feedback on the repository.