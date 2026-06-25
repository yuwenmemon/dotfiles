## Commit Messages

Format: `<type>(<scope>): <subject>`

Types: `feat`, `fix`, `chore`, `docs`, `refactor`, `test`, `ci`, `style`, `perf`, `build`

- Subject line only, no body
- Max 72 characters total
- Imperative mood, lowercase, no period
- Scope is optional but encouraged

## Code Comments

- Avoid repeating the same explanation in multiple places. Put the comment at the most useful level of abstraction.
- Keep comments direct and succinct while preserving enough context for the reader to understand the why.
- Write literally, not figuratively. State the mechanism plainly — no metaphors, anthropomorphism, or "clever" phrasing. The reader should never have to decode an image to understand the code.
- Refer to things by names the reader can see in the code (e.g. "the job resource columns above"), not abstract concepts they have to map back to it (e.g. "the resource sublist").
- Prefer a concrete behavior over an abstract description of it: "returns one row per project" rather than "without multiplying rows".

Confusing (avoid):
`// ...so unlike the resource sublist it rides along on the project-list search without multiplying rows.`

Clear (prefer):
`// ...so we can request it here and still get one row per project, unlike the job resource columns above.`

## GitHub Conversation Replies

Different rules apply based on who authored the comment being replied to:

- **Bot comments** (e.g. MelvinBot, BugZero, GitHub Actions, dependabot, copilot, any account with `[bot]` in the login or `type: "Bot"` from the GitHub API) — the agent may post the reply directly via `gh` or the API. Prefix the body with `(Yuwen's Agent) ` so reviewers know it's automated.
- **Human comments** — do NOT post automatically. Draft the proposed reply in chat for Yuwen to review, then he sends it manually (or explicitly tells the agent to post it). If he does ask the agent to post on his behalf, still prefix with `(Yuwen's Agent) `.

If the author type is uncertain, treat the comment as human and draft in chat.

This applies to PR review-thread replies, PR issue comments, and GitHub issue comments. It does NOT apply to commit messages, PR titles, or PR descriptions.

Keep `(Yuwen's Agent)` replies concise and non-redundant. Say the useful part directly, avoid restating the same point in multiple ways, and include only the context needed for the reviewer or bot to understand the response.

## After Creating a Pull Request

Creating a PR is the start of a monitoring loop, not the end of the task. After opening a PR, run the `babysit-pr` skill to watch it until CI and bots settle and to respond to actionable bot comments.
