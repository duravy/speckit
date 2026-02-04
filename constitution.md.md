# Project Constitution: Podcast Website

This document establishes the core, non-negotiable principles for the project.
All AI-generated plans and tasks must strictly adhere to these rules.
- ## Article I: Core Principles
  *   **Static-First Delivery:** The site must ship only HTML, CSS, and JS. There is to be no server-side execution; all assets are delivered via CDN.
  *   **Simplicity over Tooling:** Prefer vanilla HTML, CSS, and JavaScript implementations over complex third-party libraries unless strictly necessary.
  *   **Accessibility & SEO Baseline:** Every page must meet basic accessibility standards and include necessary SEO metadata by default.
- ## Article II: Technical Requirements
  *   **Framework:** Use **Next.js** with a **static site configuration (SSG)**.
  *   **Dependency Management:** Maintain a minimal dependency footprint to avoid bloat and ensure long-term maintainability.
  *   **Target Platform:** Technical outputs must be compatible with static hosting providers such as **Azure Static Web Apps, Cloudflare, or GitHub Pages**.
- ## Article III: Quality Gates & Development Workflow
  *   **Test-Driven Development:** Mandatory tests must be established for core features. All implementation tasks must follow a "test-first" approach where tests are written and failed before core logic is implemented.
  *   **Single Data Model:** Ensure a consistent, single data model is used across the application to maintain architectural integrity.
  *   **Performance Budget:** All features must be optimized for performance to ensure fast loading times across mobile and desktop devices.