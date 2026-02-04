### Bootstrap OpenPoker app
	- **Iterative Prompting Sequence**
		- **Iteration 1: Establishing Core Purpose and Values**
			- *Focus on the high-level goal and general behavior of the app*
			- ```
			  Prompt: "Act as a Lead Architect. 
			  I am starting a new project called 'OpenPoker' using the GitHub Spec Kit. 
			  Please generate an initial constitution.md file. 
			  The core purpose is a web-based, real-time Planning Poker app for Agile teams.
			  Include three basic principles:
			  1) Zero-friction entry (no user registration required),
			  2) No anchoring bias (votes are hidden until everyone has voted), and 
			  3) Mobile-first design."
			  ```
		- **Iteration 2: Adding Technical Stack Constraints**
			- *Once the base is set, define your preferred tools to prevent the AI from "vibe coding" with random libraries*
				- ``` 
				  Prompt: "Update the 'OpenPoker' constitution with a 'Tech Stack' section.
				  Add these principles: 
				  1) Modern Frontend (use React with TypeScript and Vite),
				  2) Utility Styling (use Tailwind CSS exclusively), and 
				  3) Real-time Sync (use Firebase or WebSockets for instant state updates).
				  ```
		- **Iteration 3: Defining Architecture and Testing Standards**
			- *Finalize the rules by enforcing structure and quality.*
				- ``` 
				  Prompt: "Refine the 'OpenPoker' constitution by adding 'Architecture' 
				  and 'Quality' sections. Principles to add: 
				  1) Library-First (keep business logic in independent, testable services,
				  not in React components), 
				  2) Type Strictness (no 'any' types allowed), and 
				  3) Automated Validation (every feature must have unit tests for the core logic)."
				  ```
				-