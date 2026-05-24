---
name: stack-overflow-search
description: Search Expensify's internal Stack Overflow for how-to questions, architecture overviews, and dev environment issues
alwaysApply: true
---

# Expensify Internal Stack Overflow Search

Search Stack Overflow **only for**:
- "How do I..." questions (running tests, dev setup, using tools)
- High-level system explanations (how ACH works, how reimbursements flow)
- Expensify-specific concepts (peek/process, NVPs, command escalation)
- Troubleshooting/debugging environment issues

**Skip Stack Overflow for**:
- Specific bug fixes (search the code directly)
- Implementation details or schema questions
- Code reviews or understanding specific functions

## Query Guidelines

Good queries (complete questions):
- "How do I run integration tests in Auth?"
- "What is the difference between peek and process?"
- "How does command escalation work in Bedrock?"

Bad queries (use grep instead):
- "AuthTestHelper" (single term)
- "NVP" (too vague)

## Search Method

Use the `mcp_pinecone_search-records` tool with:

```
name: "expensify-stack-overflow"
namespace: "stackoverflow"
query: {
  "topK": 5,
  "inputs": { "text": "<natural language question>" }
}
```

If Stack Overflow returns no relevant results, proceed to search the codebase directly.

## Citing Results

When using information from Stack Overflow:
1. **Reference the link** so the user can verify the full discussion
2. **Check `last_activity_date`** - if >1 year old, note information might be outdated
3. **Validate against code** when possible to confirm accuracy
