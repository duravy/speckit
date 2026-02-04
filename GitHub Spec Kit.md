- **GitHub Spec Kit** is an experimental toolkit designed to simplify **Spec-Driven Development**. It provides developers with a structured framework to build software by moving away from "vibe coding"—a process characterized by imprecision and "random rabbit holes"—and toward a more scalable, documented solution.
- ### **Core Components**
  
  The kit relies on several key elements to manage the development lifecycle:
- **Specify CLI**: A command-line tool used to bootstrap projects, download templates, and scaffold custom prompts.
- **The Constitution**: A file that establishes **non-negotiable principles** for a project, such as requiring specific frameworks or mandatory testing.
- **Slash Commands**: Custom prompts (e.g., `/specify`, `/plan`, `/tasks`) that guide AI agents through specific phases of development.
- ### **The Spec-Driven Workflow**
  
  The development process is broken down into three primary stages, each producing markdown artifacts that a "human in the loop" can manually edit or refine:
  
  | Phase | Command | Purpose |
  | **Requirements** | `/specify` | Outlines the **"what" and "why"** of the product, completely detached from technical implementation details. |
  | **Technical Design** | `/plan` | Establishes the technical requirements (e.g., using Next.js or static site configuration) while ensuring they align with the project **Constitution**. |
  | **Execution** | `/tasks` | Breaks the plan into **manageable chunks** or phases, such as setting up skeletons or implementing core logic. |
- ### **Key Features and Benefits**
- **Implementation Agnostic**: Because the initial specification is detached from the "how," developers can switch frameworks (e.g., moving from Next.js to Hugo) or AI models while keeping the same requirements.
- **Git-Integrated**: The system automatically creates **custom git branches** for new features, ensuring experiments do not interfere with the production code.
- **Agent Compatibility**: It supports various AI agents, including **GitHub Copilot, Cursor, and Cloud Code**, and works with both PowerShell and shell scripts.
- **Deterministic Helpers**: The kit uses helper scripts to handle tasks like linking metadata, which ensures the process remains deterministic rather than relying solely on an LLM to figure things out.
- ### **Project Status**
  
  Spec Kit is currently an **open-source experiment** hosted on GitHub. The maintainers emphasize that it is not yet a production-ready scenario and actively seek community feedback, issues, and contributions to improve the tool.
  
  ---
  
  **Clarifying Question:** Are you looking to implement Spec Kit for a specific project, or would you like more details on how to set up the CLI using `uvx`?
  
  <!--EndFragment-->
- How does the project Constitution enforce non-negotiable principles during development?
	- The **Constitution** file in GitHub Spec Kit serves as the foundational authority for a project, encoding **non-negotiable principles** that AI agents must follow throughout the development process. It acts as a set of guardrails to prevent "vibe coding"—imprecise development that leads to random technical rabbit holes—by forcing the implementation to align with pre-defined standards.
	- ### **How the Constitution Enforces Principles**
	  
	  The enforcement of these principles occurs through several mechanisms integrated into the Spec-Driven workflow:
	- **Encoding Technical Requirements:** Developers use the Constitution to mandate specific versions of frameworks (e.g., Next.js), mandatory testing protocols, or architectural styles (e.g., static-first delivery).
	- **Active Consultation during Planning:** When a developer runs the `/plan` command, the AI agent is explicitly instructed to **read and consult the Constitution**. This ensures that the technical design is not just a best guess by the AI but is strictly constrained by the project's established rules.
	- **Constitutional Quality Gates:** The generated plan must pass a **"constitutional check,"** which acts as a gate. This means the AI must verify that its proposed architecture and dependencies (like using minimal dependencies or specific hosting platforms) respect the principles outlined in the Constitution.
	- **Deterministic Guardrails:** By using helper scripts rather than relying solely on the LLM to manage project structure, the Spec Kit ensures that the development process remains **deterministic** and adheres to the established framework without "going off the rails".
	- ### **Examples of Enforced Principles**
	  
	  Based on the sources, a Constitution might include principles such as:
	- **Static First Delivery:** Ensuring the site ships only HTML, CSS, and JS via CDN.
	- **Simplicity over Tooling:** Preferring vanilla implementations over complex third-party libraries.
	- **Platform Specificity:** Requiring that all technical outputs be oriented for specific providers like Cloudflare or Azure.
	- **Mandatory Testing:** Requiring that tests are written and failed before any core implementation begins.
	  
	  ---
	  
	  **Clarifying Question:** Would you like to see an example of a specific Constitution file, or are you interested in how to manually edit these principles to better control your AI agent's output?
	  
	  <!--EndFragment-->
- How does the Constitution help prevent technical rabbit holes during coding?
	- The **Constitution** prevents technical rabbit holes by establishing a set of **non-negotiable principles** that act as guardrails for AI agents. By encoding these rules upfront, the project moves away from "vibe coding"—a process marked by imprecision that often leads to random, unwanted technical directions—and toward a more **scalable, predictable solution**.
	  
	  Here is how the Constitution specifically enforces these boundaries:
	- ### **1. Encoding Mandatory Standards**
	  
	  The Constitution allows developers to lock in specific technical requirements that the AI is not permitted to deviate from. These often include:
	- **Specific Frameworks:** Mandating the use of a particular version of Next.js.
	- **Architectural Style:** Requiring a "static-first delivery" where the site only ships HTML, CSS, and JS via a CDN.
	- **Development Rules:** Forcing a **test-driven development** approach where tests must be written and failed before any core implementation begins.
	- ### **2. Integration into the Planning Phase**
	  
	  When a developer uses the **`/plan`** command to move from requirements to technical design, the agent is explicitly instructed to **consult the Constitution**. This ensures that the technical artifacts created (like data contracts or research files) are grounded in the project's core principles rather than the AI's best guess.
	- ### **3. Constitutional Quality Gates**
	  
	  The Spec Kit implementation includes a **"constitutional check"** as a mandatory gate. This means the generated plan must be verified against the Constitution to ensure it:
	- Uses **minimal dependencies** to avoid bloat.
	- Avoids complex patterns that conflict with the established architecture.
	- Adheres to the project’s specific constraints, such as hosting requirements for platforms like Cloudflare or Azure.
	- ### **4. Reducing LLM Imprecision**
	  
	  By providing a clear reference point, the Constitution reduces the need for the LLM to "figure things out" on its own. This is supplemented by **deterministic helper scripts** that handle project organization and metadata, preventing the AI from wandering into "funky" layouts or incorrect design decisions.
	  
	  ---
	  
	  **Clarifying Question:** To help you set this up, would you like an example of the specific markdown syntax used to define these principles in a `constitution.md` file?
	  
	  <!--EndFragment-->
- Sample Constitution file
	- As we discussed, the **Constitution** is the foundational document that defines the **non-negotiable principles** for your project, acting as a guardrail against the imprecision of "vibe coding".
	  
	  Below is a sample `constitution.md` file based on the principles and technical requirements outlined in the sources. You can use this as a baseline and edit it manually to fit your specific project needs.
	- ### **Sample [[constitution.md]]**
	- ### **How to Use This File**
	- **Placement:** Save this content as `constitution.md` within your project's `memory/` folder.
	- **LLM Consultation:** When you run the `/plan` command, the AI agent will automatically **read and consult this document** to ensure its technical strategy respects these boundaries.
	- **Human in the Loop:** While you can use an LLM to bootstrap this file, it is designed for **manual editing**. If you have a specific design decision (like a centered logo or specific color palette), you should enter those requirements directly into this file.
	  
	  ---
	  
	  **Clarifying Question:** Now that you have a Constitution, would you like to move on to using the `/specify` command to define the product requirements for your first feature?
	  
	  <!--EndFragment-->
- How Specify command works
	- To move forward with the **`/specify`** command, you shift your focus from the project's rules to defining the actual product. This command is designed to establish the **"what" and the "why"** of a feature before any code is written.
	- ### **The Purpose of /specify**
	  
	  The primary goal of the `/specify` command is to create a baseline specification that is **completely detached from the technical implementation**.
	- **Implementation Agnostic:** The spec does not mention specific languages, frameworks, or APIs.
	- **Flexibility:** Because the requirements are decoupled from the tech stack, you can use the same specification even if you later switch from a framework like **Next.js** to something else, like **Hugo**.
	- **Focus on Motivation:** It outlines the user needs and the business motivation for the project.
	- ### **The `/specify` Workflow**
	  
	  When you run the command in an agent-enabled environment like VS Code, the following automated steps occur:
	- **Instruction Processing:** The command triggers a prompt file (`specify.prompt.md`) that guides the AI agent.
	- **Git Branching:** A **new Git branch** is automatically created for the feature. This allows you to experiment and iterate without damaging the production code.
	- **Template Generation:** The agent populates a markdown template in the `specs/` folder, which includes user stories, functional requirements, and edge cases.
	- **Helper Scripts:** The system runs deterministic helper scripts (PowerShell or Bash) to link metadata and organize files, ensuring the AI doesn't "go off the rails".
	- ### **What the Specification Includes**
	  
	  A complete specification generated by this command typically contains several key sections for a "human in the loop" to review:
	  
	  | Section | Description |
	  | **User Scenarios** | Detailed user stories and acceptance scenarios for various personas. |
	  | **Functional Requirements** | A list of specific behaviors the feature must exhibit (e.g., "should have a landing page with one featured episode"). |
	  | **Acceptance Checklist** | A mandatory gate ensuring no implementation details were leaked and all sections are complete. |
	  | **Clarification Items** | A list of "best guess" assumptions made by the AI that the developer should verify or edit manually. |
	- ### **Human-in-the-Loop Refinement**
	  
	  The source emphasizes that you should **not trust the LLM blindly**. Once the markdown file is generated, you are encouraged to go in "with your hands" and manually edit requirements, such as specific design decisions or logo placements, to ensure the spec matches your vision.
	  
	  ---
	  
	  **Clarifying Question:** Would you like to provide a prompt for a specific feature (like the "sleek podcast website" mentioned in the source) so we can walk through how to refine its functional requirements?
	  
	  <!--EndFragment-->
- Generate sample Specs
	- In the **GitHub Spec Kit** workflow, running the `/specify` command generates a markdown specification file in the `specs/` folder. This file is **implementation-agnostic**, meaning it focuses entirely on the "what" and the "why" of the product rather than technical details like frameworks or databases.
	  
	  Below are sample files based on the **Podcast Website** example described in the sources.
	- ### **1. Product Specification File**
	  
	  This is the primary output of the `/specify` command, typically named based on the feature (e.g., `specs/001-podcast-site.md`).
	  
	  ```
	  # Specification: Modern Podcast Website
	  
	  ## 1. Motivation and Overview
	  The goal is to build a sleek, modern podcast website that stands out visually. It serves as a central hub for listeners to browse episodes and learn about the show.
	  
	  ## 2. User Scenarios & Stories
	  *   **As a listener,** I want to see a featured episode on the landing page so I can immediately start with the latest content.
	  *   **As a returning visitor,** I want to browse a full list of episodes in reverse-chronological order.
	  *   **As a curious fan,** I want an "About" and "FAQ" page to learn the background of the show.
	  
	  ## 3. Functional Requirements
	  *   **Landing Page:** Must feature one prominent episode.
	  *   **Episodes Page:** Must list 20 mocked episodes (no real feed integration required).
	  *   **About Page:** General background description of the podcast.
	  *   **FAQ Page:** Frequently asked questions section.
	  *   **Navigation:** A clear header and footer for site-wide navigation.
	  
	  ## 4. Edge Cases
	  *   **Ordering:** If episode dates are missing, the system should default to a reasonable best guess for ordering.
	  *   **Empty States:** Handle scenarios where no episodes are found in the mock data.
	  
	  ## 5. Items Needing Clarification
	  *   **Confirmation:** Confirm if the episode list must be strictly reverse-chronological (newest first).
	  *   **Best Guess:** AI assumes a standard web layout with a centered or sleek navigation bar.
	  
	  ## 6. Review & Acceptance Checklist
	  - [x] No implementation details (no mention of Next.js, APIs, etc.)
	  - [x] All mandatory sections completed
	  - [x] All "Needs Clarification" items addressed or assigned a "best guess"
	  - [x] Content is readable by non-technical stakeholders
	  ```
	- ### **2. Supporting Artifacts**
	  
	  Once you move into the `/plan` phase, the AI generates technical metadata to support the specification.
	- #### **Data Model Outline (`data-model.md`)**
	  
	  This file defines the structure of the data based on the spec's requirements.
	- **Fields:** Episode Title, Description, Publication Date, Audio Link, Duration.
	- **Validation Rules:** Dates must be in ISO format; titles cannot be empty.
	- #### **Research Artifact (`research.mmd`)**
	  
	  The agent may generate a research file using its training data (or live web data if using specific agents like Cloud Code) to find best practices for your specific project.
	- **Focus:** Competitive research on sleek podcast UI/UX and static site accessibility.
	- ### **Key Takeaways for Managing Specs**
	- **Human in the Loop:** These files are meant to be **manually edited**. You should go in "with your hands" to add specific requirements, like a centered logo or a specific color gradient, rather than just letting the AI guess.
	- **Git-Integrated:** Each spec is generated on a **custom Git branch**, ensuring your experimentation doesn't interfere with production code.
	- **Portability:** Because the spec lacks technical details, you can use the same file to ask an AI to build the site in **Next.js, Hugo, or any other framework**.
	  
	  ---
	  
	  **Clarifying Question:** Would you like to see the **Technical Plan** file (`plan.md`) that follows this specification, or should we move on to generating the **Task List** for implementation?
	  
	  <!--EndFragment-->
- How to plan workflow works
	- The **`/plan`** command is the phase where you transition from "what" to build to the **technical design** of "how" to build it. While the specification remains implementation-agnostic, the plan establishes the specific frameworks, data structures, and architectural patterns required for the project.
	- ### **The /plan Workflow**
	  
	  When you run `/plan` in your AI agent, the system performs several automated and grounded steps:
	- **Consulting the Foundation:** The agent is explicitly instructed to read both the **Constitution** (the non-negotiable rules) and the **Specification** (the product requirements) before drafting the plan.
	- **Script Execution:** Like the specify command, it runs **deterministic helper scripts** to prepare the repository and ensure metadata is linked correctly.
	- **Context Grounding:** The agent uses its training data—or live web research if using specific agents like Cloud Code—to generate research artifacts for the technical stack.
	- ### **Key Technical Artifacts Generated**
	  
	  The planning phase produces several critical files in a dedicated folder (e.g., `specs/001-podsite/`):
	- **`plan.md`**: This is the primary technical document. It outlines the **execution flow**, technical context (e.g., Node.js version), primary dependencies (e.g., Next.js), and the target hosting platform.
	- **`data-model.md`**: This file establishes the **data contracts**, defining fields (like episode titles and dates) and validation rules to ensure architectural integrity.
	- **`research.mmd`**: A research artifact that provides inspiration or best practices for the implementation, such as UI/UX standards for sleek designs.
	- ### **The Constitutional Quality Gate**
	  
	  A unique feature of the Spec Kit is the **Constitutional Check**. The generated plan must pass a "gate" where the AI verifies that the proposed architecture respects the principles you set earlier. For example, it must confirm the plan uses **minimal dependencies** and adheres to a **static-first delivery** model if those were mandated in your Constitution.
	- ### **Iterating on the Plan**
	  
	  If the AI's "vibe" or technical choices seem "funky"—such as a weird page layout—you should not just accept it. Because the spec and plan are just **markdown files**, you can manually edit them to add specific requirements, like a centered logo or a specific CSS gradient. You can also switch AI models (e.g., from GPT-5 to Claude Sonnet) and ask the agent to reimplement the plan based on the same specification.
	  
	  ---
	  
	  **Clarifying Question:** Now that the technical architecture is set, are you ready to use the **`/tasks`** command to break this plan down into manageable, implementable chunks?
	  
	  <!--EndFragment-->
- Generate sample plan file
	- A **`plan.md`** file is the technical blueprint that translates your implementation-agnostic requirements into a concrete development strategy. It defines the **technical stack**, architecture, and quality gates, ensuring that the AI agent follows a structured path rather than "vibe coding".
	  
	  Below is an example of a `plan.md` file for a **Podcast Website**, modeled after the technical requirements and outcomes described in the sources.
	- ### **Sample `plan.md`: Podcast Website**
	  
	  ```
	  # Technical Plan: Podcast Website (podsite)
	  
	  ## 1. Execution Flow
	  The implementation will follow a phased approach:
	  1. Environment and project skeleton initialization.
	  2. Data model and mock content setup.
	  3. Core UI components (Header, Footer, Navigation).
	  4. Feature implementation (Landing, Episodes, About, FAQ).
	  5. Accessibility and Performance optimization.
	  
	  ## 2. Technical Context
	  *   **Language:** TypeScript / JavaScript.
	  *   **Runtime:** Node.js (Latest LTS).
	  *   **Framework:** **Next.js** with **Static Site Generation (SSG)**.
	  *   **Styling:** Vanilla CSS or minimal Tailwind (per simplicity principle).
	  
	  ## 3. Primary Dependencies
	  *   **Next.js:** For routing and static export.
	  *   **Lucide-React:** For iconography (if needed).
	  *   **Testing:** Lighthouse for performance and accessibility audits.
	  
	  ## 4. Target Platform
	  The build must be compatible with **static hosting providers** over a CDN, including:
	  *   Azure Static Web Apps.
	  *   GitHub Pages.
	  *   Cloudflare Pages.
	  
	  ## 5. Constitutional Quality Gates
	  The following gates must be passed before the implementation is considered complete:
	  *   **[Pass] Static-First Delivery:** No server-side execution; pure HTML/CSS/JS export.
	  *   **[Pass] Framework Alignment:** Uses Next.js static configuration.
	  *   **[Pass] Minimal Dependencies:** Avoiding heavy third-party libraries.
	  *   **[Pass] Responsive Design:** Must be fully functional on mobile devices.
	  
	  ## 6. Research and Outlines
	  *   **Data Model:** Defined in `data-model.md` (fields for Title, Date, Audio URL).
	  *   **UX Research:** Derived from training data regarding "sleek" podcast UI/UX standards.
	  ```
	- ### **Breakdown of Key Sections**
	  
	  | Section | Purpose |
	  | **Technical Context** | Establishes the specific versions of Node.js and the frameworks being used. |
	  | **Constitutional Gates** | Acts as a **mandatory checkpoint** where the AI verifies that the plan respects the "non-negotiable principles" established in your Constitution. |
	  | **Target Platform** | Explicitly instructs the AI to optimize the build for specific providers like **Azure or GitHub Pages**, preventing architectural drift. |
	  | **Execution Flow** | Provides a high-level roadmap that guides the subsequent creation of individual tasks. |
	- ### **How the Plan is Refined**
	- **Manual Edits:** If the AI generates a "funky" layout or makes incorrect technical assumptions, you should go in "with your hands" and edit the markdown file manually.
	- **Model Switching:** You can use a model like **GPT-5** to generate the initial plan and then switch to **Claude Sonnet** to implement the actual code based on that plan.
	- **Deterministic Helpers:** The plan is supported by helper scripts that ensure project metadata is linked correctly, keeping the process **deterministic**.
	  
	  ---
	  
	  **Clarifying Question:** Now that the technical plan is established, would you like to see how the **`/tasks`** command breaks this plan down into individual, implementable chunks?
	  
	  <!--EndFragment-->
- Generate data-model file
	- In the **GitHub Spec Kit** workflow, the `data-model.md` file (sometimes referred to as a **data contract**) is a technical artifact generated during the **`/plan`** phase,. Its purpose is to establish a clear structure for the data used in the project, including specific fields, validation rules, and derived views to ensure architectural integrity.
	  
	  By defining these contracts upfront, the system ensures that the AI agent has the necessary **executable context** to build consistent software rather than relying on "vibe coding",.
	- ### **Sample data-model.md: Podcast Website**
	  
	  Below is an example of what this file looks like for the podcast project discussed in our conversation, based on the requirements for episodes and site metadata.
	  
	  ```
	  # Data Model: Podcast Website
	  
	  This document defines the data structures and validation rules for the podcast site to ensure consistency across all generated components.
	  
	  ## 1. Episode Entity
	  This model represents an individual podcast episode displayed on the site.
	  
	  | Field | Type | Description | Validation Rules |
	  | :--- | :--- | :--- | :--- |
	  | **id** | String | Unique identifier for the episode. | Must be a UUID or slug. |
	  | **title** | String | The headline of the episode. | Required; max 100 characters. |
	  | **description** | Markdown | A summary of the episode content. | Required. |
	  | **pubDate** | ISO8601 | The date the episode was released. | Must be a valid date; used for sorting. |
	  | **audioUrl** | URL | Link to the hosted audio file. | Must be a valid HTTPS URL. |
	  | **duration** | String | Length of the episode (HH:MM:SS). | Must follow time format. |
	  | **featured** | Boolean | Whether to show on the landing page. | Defaults to false. |
	  
	  ## 2. Site Metadata
	  Global configuration used for SEO and header/footer components.
	  
	  *   **siteTitle:** The name of the podcast (e.g., "The Work Item").
	  *   **tagline:** A brief catchy description for the landing page.
	  *   **socialLinks:** A collection of URLs for platforms like Spotify, Apple Podcasts, and X.
	  
	  ## 3. Validation Rules
	  *   **Ordering:** The episode list must be strictly **reverse-chronological** based on the `pubDate`.
	  *   **Static Integrity:** No data should be fetched from real-time external feeds; all data is mocked for the static build.
	  
	  ## 4. Derived Views
	  *   **Featured View:** Filters for the single most recent episode where `featured` is true.
	  *   **Recent Episodes:** A list of the 20 most recent episodes for the main episodes page.
	  ```
	- ### **Key Components of the Data Model**
	- **Fields and Types:** Clearly defines what data points (like Episode Title or Audio Link) the AI needs to account for in the implementation.
	- **Validation Rules:** Establishes constraints, such as ensuring dates are in the correct format or that titles are not left empty.
	- **Derived Views:** Outlines how the data should be filtered or sorted for specific pages, such as the featured section on the landing page.
	  
	  ---
	  
	  **Clarifying Question:** Now that the data model is defined, would you like to see how the **`/tasks`** command uses this information to break the project into a step-by-step implementation list?
	  
	  <!--EndFragment-->
- Generate sample research file
	- A **research file** (typically named `research.mmd`) is a technical artifact generated during the **`/plan`** phase of the Spec-Driven Development workflow. It provides the AI agent and the development team with a baseline of inspiration, best practices, and "executable context" to ensure the project doesn't rely solely on "vibe coding".
	- ### **Purpose of the Research File**
	- **Grounded Inspiration:** The file uses either the LLM's **training data** or **live web research** (depending on the agent used) to outline how to implement specific features like a "sleek" UI or podcast player.
	- **Agent Variability:** While standard agents like GitHub Copilot use embedded training data to create the file, more advanced agents like **Cloud Code** can perform active web searches to include the "freshest information from the internet".
	- **Technical Baseline:** It helps establish a good project baseline by researching industry standards for the target platform (e.g., Azure, GitHub Pages, or Cloudflare).
	- ### **Sample `research.mmd` (Podcast Website)**
	  
	  Based on the "podsite" example in the sources, a research file would look like this:
	  
	  ```
	  # Research: Sleek Podcast UI/UX & Static Site Best Practices
	  
	  ## 1. UI/UX Trends for "Sleek" Audio Platforms
	  *   **Minimalist Aesthetic:** High-contrast typography and generous whitespace to keep the focus on episode content.
	  *   **Featured Hero Sections:** Use of a single, prominent "Latest Episode" call-to-action on the landing page.
	  *   **Consistent Navigation:** Sticky headers or simplified footers to ensure the "About," "FAQ," and "Episodes" pages are always accessible.
	  
	  ## 2. Static Site Optimization (SSG)
	  *   **Performance:** Ensuring fast load times by shipping only vanilla HTML, CSS, and JS via CDN (Static-First Delivery).
	  *   **SEO Baseline:** Implementing standard meta tags for podcast discovery and social sharing.
	  *   **Accessibility:** Adhering to WCAG standards for audio transcripts and keyboard-navigable players.
	  
	  ## 3. Tech Stack Best Practices
	  *   **Next.js (SSG):** Best practices for generating 20+ static episode pages from mock data without a live server.
	  *   **Lighthouse Standards:** Targeting high scores in performance, accessibility, and SEO audits.
	  *   **Responsive Design:** Optimizing layouts for mobile-first users in 2025.
	  ```
	- ### **How to Use This Artifact**
	- **Review Before Coding:** As a "human in the loop," you should verify the research assumptions before moving to the implementation phase.
	- **Manual Overrides:** If the AI's research produces "garbage" or "funky" layout ideas, you can manually edit this file to force specific design decisions, such as a centered logo or a specific color gradient.
	- **Cross-Model Reimplementation:** You can keep this research file as context and switch models (e.g., from GPT-5 to Claude Sonnet) to see which produces a better implementation based on the same research.
	  
	  ---
	  
	  **Clarifying Question:** Would you like to see how these research findings are converted into actionable tasks via the **`/tasks`** command?
	  
	  <!--EndFragment-->
- How the tasks workflow works
	- The **`/tasks`** command is the final stage of the Spec-Driven workflow, where the technical plan is converted into **actionable, manageable chunks** that an AI agent can execute step-by-step. This process moves development away from "vibe coding" by ensuring the AI has a precise roadmap to follow rather than making guesses about the project's direction.
	- ### **The Tasks Workflow**
	  
	  When you trigger the `/tasks` command, the system performs the following automated steps:
	- **Helper Script Execution:** The command runs deterministic scripts (PowerShell or Bash) to guide the agent and ensure it has the correct context.
	- **Context Verification:** The agent checks task prerequisites using templates and the previously established project artifacts.
	- **Generation of `tasks.md`:** The output is a markdown file that outlines the implementation phases, which is easily editable by the "human in the loop" using any standard editor.
	- ### **Key Components of the Task List**
	  
	  The generated task list typically follows a structured implementation order designed for stability and quality:
	  
	  | Phase | Description |
	  | **Setup** | Initializing the project skeleton (e.g., a Next.js app). |
	  | **Test-First Development** | Establishing tests that **must fail** before any core implementation begins, ensuring a Test-Driven Development (TDD) approach. |
	  | **Core Implementation** | Building the functional components (e.g., Pages, Data Models) only after tests are in place. |
	  | **Refinement & Polish** | Finalizing the site with performance audits (Lighthouse), responsive design, and accessibility documentation. |
	- ### **Implementation and Execution**
	  
	  Once the tasks are defined, the agent takes a proactive role in the coding process:
	- **Model Switching:** While models like **GPT-5** are often used for setting up the initial spec and plan scaffolding, developers may switch to models like **Claude Sonnet 4** for the actual creative coding and implementation phase.
	- **Real-time Updates:** As the agent works, it is instructed to **update the task list** dynamically, marking items as complete as it progresses through the project.
	- **Human Oversight:** Because the tasks are in markdown, you can manually add, remove, or tweak items—such as adding a specific design requirement for a logo—to maintain control over the output.
	  
	  ---
	  
	  **Clarifying Question:** Would you like to see a sample `tasks.md` file for the podcast website, or are you interested in how to switch AI models to start the implementation phase?
	  
	  <!--EndFragment-->
- How to run the Lighthouse aufit
	- In the GitHub Spec Kit workflow, **Lighthouse audits** are treated as a mandatory testing step during the **Integration & Refinement phase** (Phase 4) of development. They are established during the technical planning stage to verify that the project meets the performance and accessibility standards outlined in the project **Constitution**,.
	- ### **How Lighthouse Audits are Integrated**
	  
	  The process for running these audits is baked into the automated lifecycle of the toolkit:
	- **Establishing the Requirement:** When you run the `/plan` command, the AI agent identifies Lighthouse as a **primary dependency for testing**, especially for projects targeting static site generation (SSG).
	- **Task Assignment:** The `/tasks` command automatically generates a specific task to "run lighthouse" under the integration and refinement section.
	- **Agent Execution:** When you instruct an agent (like Claude Sonnet 4) to "implement the tasks," it will attempt to execute the Lighthouse audit as part of its workflow.
	- ### **Environmental Requirements**
	  
	  For the Lighthouse audit to run successfully within the workflow, your local environment must be properly configured. For instance, if the agent attempts a Lighthouse test and **Chrome is not installed** on the machine or VM, the test will fail.
	- ### **Quality Gates**
	  
	  Lighthouse serves as a **Constitutional Quality Gate**. This means the implementation is not considered complete until the site passes these audits, ensuring the final product adheres to:
	- **Performance Budgets:** Ensuring fast loading times for mobile and desktop.
	- **Accessibility Baselines:** Verifying that the site meets WCAG standards and includes proper ARIA tagging,.
	- **SEO Standards:** Confirming that all necessary metadata is present for search engine discovery.
	  
	  ---
	  
	  **Clarifying Question:** Since Lighthouse audits require a build of your project, would you like to know how to run the `npm run build` command to prepare your static site for an audit?
	  
	  <!--EndFragment-->
- Questions and Answers [[GitHub Spec Kit FAQ]]
-