### Should developers update all documentation (spec, plan, and tasks) when the final implementation drifts from the original plan, or just the spec doc?
	- Developers should prioritize keeping the **specification (spec) document** updated as the **sole source of truth** for a project. While updating all documentation is generally a good idea, the priority and necessity of updates depend on which part of the project has drifted.
	- ### **Documentation Priority Hierarchy**
	  
	  According to the creator, not all artifacts are created equal. They should be prioritized in the following order:
	  
	  | Priority | Document | Role |
	  | **High** | **Spec Document & Constitution** | The "durable artifact" that reflects the final intended output and core rules. |
	  | **Medium** | **Implementation Plan** | The technical spec (API shapes, frameworks, databases). |
	  | **Low** | **Tasks** | Temporary reflections of the implementation plan. |
	- ### **When to Update Specific Files**
	- **The Spec Document:** This must be updated to encode learnings from the implementation process so that the document accurately reflects the final output. Because the spec is "durable," it allows you to recreate features later, even if you change technical frameworks.
	- **The Implementation Plan:** This only needs updating if **core implementation details** change. For example, if you decide to switch from a SQL database to a document database, you should update the plan. If the technical foundations remain the same, the plan can often be left as is.
	- **Tasks:** These are considered highly flexible. If they drift significantly, you can simply **delete and recreate** them based on the updated implementation plan.
	- ### **The "Spec as Code" Philosophy**
	  
	  The creator emphasizes that the specification is essentially an **executable artifact**. By keeping the spec updated with "learnings" from the LLM conversation, you ensure that if you ever need to refactor or move to a different tech stack, you can simply provide the spec to an AI agent to rebuild the feature.
	- ### **Workflow Recommendation: Use Git**
	  
	  To manage implementation drift effectively, developers should lean heavily on **Git workflows**:
	- **Commit often** when things work as intended.
	- If an AI agent goes "off the rails" and creates unintended files, **update the spec**, discard the incorrect code changes in your git client, and use the updated spec to re-run the process.
	  
	  Are you interested in how this documentation strategy changes when working with "brownfield" projects (existing codebases) versus new ones?
	  
	  <!--EndFragment-->
- ### How should SpecKit be used across **multiple repositories**? Is it better to have one SpecKit per repo or a shared repo for high-level specs?
	- Using one **SpecKit deployment per repository** is the recommended approach because it keeps the work contained and makes management significantly easier than trying to coordinate across multiple repositories.
	- ### **The Case for Per-Repo Configuration**
	  
	  The creator suggests that bootstrapping SpecKit for a specific project within its own repository is the most effective workflow for several reasons:
	- **Containment:** When you operate in a single repository, things remain constrained and manageable.
	- **Version Control:** The `specify` command creates new branches within that specific repository, encoding templates and specs directly into the project's version history.
	- **Context Relevancy:** Specifications for one repository are often not applicable to another; for example, specs for a mobile application would vary greatly from those for a web app.
	- **Reduced Complexity:** A shared "high-level" spec repo requires cross-referencing through tools like **git submodules**, which increases the complexity of managing the code.
	- ### **Managing Shared Content**
	  
	  If your organization requires certain standards to be shared across all projects, you can use a hybrid approach:
	- **Shared Constitutions:** You can maintain a central **Constitution** (defining how web apps are built organization-wide) and pull it into individual repositories via a **git submodule**.
	- **Granularity for Monorepos:** For complex projects that house the backend, frontend, and database in a single repository, the creator suggests using **multiple `.specified` folders**. This provides granularity, allowing you to have separate folders for the API, front-end, and monitoring solutions while using the same custom slash commands.
	  
	  In summary, while high-level content like a Constitution can be shared, the **implementation specs** and **technical plans** should remain local to the specific repository they describe to ensure coherence and ease of use.
	  
	  Do you have questions about how to set up these git submodules for a shared Constitution, or are you more interested in the monorepo structure mentioned at the end?
	  
	  <!--EndFragment-->
- ### What is the best process to capture correct specs and "unwind" changes if an AI agent starts creating unintended files or going "off the rails"?
	- The best process for handling an AI agent that has gone "off the rails" is to utilize a **Git-centric workflow** while maintaining the **specification (spec) document** as the project's "sole source of truth". By treating the spec as an **executable artifact**, you can update the requirements and discard incorrect code changes without losing project momentum.
	- ### **The "Unwinding" Process**
	  
	  If an AI agent begins creating unintended files or ignoring prior features, follow these steps to reset the implementation:
	- **Encode the Correct Requirements:** Identify where the agent went wrong and update the **specification document** to reflect the exact intended output.
	- **Discard Rogue Changes:** Use a **Git client** (such as GitHub Desktop, Git Kraken, or Sublime Merge) to identify uncommitted files or code blocks that the agent created in error.
	- **Commit the Updated Spec:** Ensure that the corrected spec document is checked into your branch and **committed** so the "learnings" are preserved.
	- **Reset and Re-run:** Discard the incorrect code changes and use the updated, committed spec to have the agent re-attempt the implementation.
	- ### **Why Git is Essential to SpecKit**
	  
	  The creator emphasizes that getting familiar with **branching, staging, and committing** is the most important skill for using SpecKit effectively.
	- **Automatic Isolation:** The `specify` command automatically creates a **new branch** for each iteration, which keeps rogue changes contained and easy to "unfurl".
	- **Frequent Commits:** You should **commit often** when the implementation is working correctly. This creates a safe "save point" to return to if a rogue agent goes astray during a subsequent prompt.
	- **Flexible Code vs. Durable Specs:** While code changes are considered flexible and can be discarded, the **spec document** is a durable artifact that should be meticulously maintained to reflect the final envisioned output.
	- ### **Capturing "Correct" Specs**
	  
	  To prevent the agent from drifting in the first place, the creator suggests focusing on **proactive context**. For projects not originally built with SpecKit ("brownfield" projects), you should provide as much information as possible about the existing codebase—such as file structures and component relationships—so the agent understands where to look before it starts creating new, redundant files.
	  
	  Would you like to know more about how to provide this proactive context for an existing project, or perhaps how the "Constitution" file helps guide the agent's behavior?
	  
	  <!--EndFragment-->
- ### How does the process of **refactoring** a website using only existing specs work? Does the agent go through features one by one in a new project?
	- Refactoring a website using existing specs works by detaching the **technical implementation** from the **specification**, allowing you to treat the spec as an **"executable artifact"** that an AI agent can use to rebuild features in a new environment. While the agent can recreate features based on these specs, the process depends heavily on whether the project was originally built with SpecKit.
	- ### **The Refactoring Process**
	  
	  When you decide to move a project to a new framework or technology stack (e.g., moving from Hugo to Jekyll), the process follows this logic:
	- **Durable Artifacts:** Because SpecKit specs focus on the "what" rather than the "how," they do not include technical implementation details like specific API shapes or frameworks.
	- **The Spec as "Code":** You provide the existing spec to a coding agent or LLM and instruct it to **rebuild the feature** within the context of the new project.
	- **Context-Aware Rebuilding:** The agent scans the new project's structure and uses the "durable" requirements in the spec to generate the equivalent functionality using the new toolset or framework.
	- ### **Feature-by-Feature Recreation**
	  
	  Regarding your question about going through features "one by one," the source suggests that the feasibility of this depends on the project's history:
	- **Greenfield Projects (New Apps):** If you started a brand-new application and encoded every feature (e.g., landing page, user profile, checkout) into specs from the beginning, you can essentially **recreate the entire application** in a new framework by providing those specs to the AI.
	- **Brownfield Projects (Existing Apps):** For websites not originally built with SpecKit, the agent **cannot** automatically recreate the whole site. It can only refactor or recreate the specific features or bug fixes that were actually **encoded into spec files**.
	- ### **The "Brownfield" Limitation**
	  
	  If you are working on an existing site, the agent will not "know" how to recreate components like the "About" page or the "Home" page unless you have proactively gone back and created specs for those existing structures. Without those specific artifacts, the agent lacks the necessary instructions to rebuild them in a new project.
	  
	  Are you planning to refactor an existing "brownfield" project, or are you starting a new project where you want to ensure your specs are future-proof for a later refactor?
	  
	  <!--EndFragment-->
- ### Can SpecKit support a **non-TDD (Test-Driven Development)** approach to save on context and credits, as the current templates require creating tests first?
	- Yes, SpecKit will support a **non-TDD (Test-Driven Development)** approach soon, as the creator is proactively working on a **"TDD-less option"** for the toolkit.
	  
	  While the current built-in templates mandate a TDD workflow—requiring users to create tests before implementation—the creator acknowledges that this is not appropriate for every scenario.
	- ### **Why a Non-TDD Option is Being Added**
	  
	  The shift toward a non-TDD option is driven by several practical concerns raised by the community:
	- **Context and Cost Efficiency:** The creator agrees that building out tests can be "very heavy" and significantly consumes **AI context and credits**.
	- **Prototyping Speed:** For "quick prototypy iterative scenarios," the priority is often to see and interact with the product immediately rather than focusing on test coverage.
	- **Project Suitability:** While TDD is valuable for "serious enterprisy projects," it is often unnecessary for simpler tasks, such as adding a new page to a personal site.
	- ### **Future Workflow Changes**
	  
	  Once this update is released, the TDD requirement will no longer be "baked in by default". Instead:
	- **Direct Implementation:** You will be able to request the product or feature directly without the intermediate testing step.
	- **Optional Testing:** You will still have the flexibility to **add test-driven elements later** as the project matures or becomes more complex.
	  
	  By moving away from a mandatory TDD structure, SpecKit aims to become more "lightweight" and better suited for rapid development cycles.
	  
	  Are you currently finding the credit usage a significant blocker for your projects, or are you more concerned about the time it takes to generate the initial tests?
	  
	  <!--EndFragment-->
- ### What is the proper way to add features to an **existing website** (a "brownfield" project) that was not originally built with SpecKit?
	- The proper way to add features to a **brownfield project** (one not originally built with SpecKit) is to focus heavily on providing **proactive context** to the AI agent. While the core process is similar to a new project, your primary task is to ensure the LLM understands the existing codebase's structure and relationships before it attempts to generate new code.
	- ### **The Brownfield Workflow**
	  
	  According to the sources, you should follow these steps to integrate SpecKit into an existing site:
	- **Bootstrap the Agent File (`cloud.md`):** Use the agent file to explicitly define how your project is structured, how it is built, and what its core components are.
	- **Provide Technical Context:** Since the site wasn't built with SpecKit, the agent lacks historical "memory" of the code. You must inform it of specific locations, such as where `.tsx` components live, to prevent it from looking at compiled folders by mistake.
	- **Encode Existing Structures (Optional but Recommended):** If you eventually want to refactor the entire site, you must manually create specs for existing parts like the landing page or blog post layout. Without these "durable artifacts," the agent cannot recreate those specific features later.
	- **Use Standard Commands:** Once the context is set, you can use standard SpecKit commands like `/specify` to build new features (e.g., a podcast player or a reading list) on top of your custom theme.
	- ### **Key Considerations for Existing Sites**
	  
	  | Factor | Description |
	  | **The Context Bottleneck** | The biggest challenge is ensuring the AI knows "where to look" for existing relationships so it doesn't create redundant or conflicting files. |
	  | **Dynamic Context** | Modern LLMs are increasingly good at "sussing out" context on their own by scanning folders, but they still require human oversight to avoid gaps. |
	  | **Engineer in Control** | Because the project is brownfield, you must remain aware of where the agent is looking (e.g., ensuring it modifies source components rather than compiled ones). |
	- ### **Why Context Matters**
	  
	  Providing this context ahead of time turns your specifications into **"executable artifacts"**. Even if your original site used a different engine (like moving from WordPress to Hugo), having these spec files allows an AI agent to rebuild those features in your current environment because the requirements are detached from the original implementation.
	  
	  Would you like to know more about how to structure the `cloud.md` file specifically for a brownfield project, or should we discuss how to handle Git branching in this scenario?
	  
	  <!--EndFragment-->
- ### How does the **constitution** fit into complex monorepos that contain front-end, back-end, and database files in a single repository?
	- In complex monorepos, the **constitution** fits by providing **architectural granularity**. While a single repository might contain front-end, back-end, and database files, SpecKit allows you to use multiple `.specified` folders to define different rules and standards for each specific layer of the application.
	- ### **Granular Configuration via Multiple Folders**
	  
	  Because a monorepo contains distinct technological stacks, the creator is testing a method to split the configuration to match the project's complexity:
	- **Dedicated `.specified` Folders:** You can have separate folders for your **backend, frontend, and API/monitoring solutions**.
	- **Customized Rules:** Each folder’s constitution can define different requirements. For example, the backend constitution might mandate **Test-Driven Development (TDD)**, while the frontend constitution might allow for a quicker, non-TDD approach.
	- **Context Isolation:** By embedding the constitution directly into the specific sub-folder where you are operating, the AI agent receives the most relevant instructions for that particular part of the codebase.
	- ### **Sharing Standards Across the Repo**
	  
	  If you need to maintain coherence across these different components, you can use **Git workflows**:
	- **Git Submodules:** For organization-wide standards, a central constitution can be maintained in a separate repo and pulled into each part of the monorepo using a **git submodule**.
	- **Generic Slash Commands:** Even with multiple constitutions, the custom slash commands (like `/specify` and `/clarify`) remain **generic**. The command itself does not change, but the LLM uses the specific constitution and templates associated with the folder you are currently working in.
	- ### **Current Development Status**
	  
	  This multi-folder approach for complex monorepos is currently being **tested and refined**. The creator intends to release a finalized, documented approach soon to help developers manage these non-constrained environments effectively.
	  
	  Would you like to explore how to structure the specific rules for a backend vs. a frontend constitution, or are you interested in how the implementation plan differs for these layers?
	  
	  <!--EndFragment-->
- [[SpecKit_QA]]