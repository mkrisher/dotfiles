---
name: technology-sonar-issue
description: Create Technology-template GitHub issues for the Six Feet Up Technology Sonar. Use whenever the user asks to add a technology to Tech Sonar, create a Sonar entry, or open a Technology issue in sixfeetup/engineering-handbook; apply the required SONAR status and category labels. Do not create an ADR or PR as part of this skill.
---

# Technology Sonar issue

Create a technology issue in `sixfeetup/engineering-handbook` that the `sixfeetup/GH-Tech-Sonar` snapshot generator can display. The Sonar reads issues from the engineering-handbook repository, not from the application repository.

## Sources of truth

- At the start of each issue request, read the current `.github/ISSUE_TEMPLATE/technology.yml` from `sixfeetup/engineering-handbook` (use the local checkout only if it is current; otherwise fetch from the repository). Treat its fields, labels, help text, and required validations as authoritative rather than relying on fields remembered from an example or this skill. If it cannot be read, pause and ask for access or the template; do not create an issue from a guessed structure.
- Read the [Issue Data Model](https://github.com/sixfeetup/GH-Tech-Sonar/blob/main/docs/github-issue-data-model.md) for current label, placement, and PR-evidence semantics.
- Use [issue #234](https://github.com/sixfeetup/engineering-handbook/issues/234) as a content example, not as a source of universal recommendations.
- Inspect the target repository's existing labels with `gh label list --repo sixfeetup/engineering-handbook --limit 200` before selecting them. Do not invent or create labels.

## Draft

1. Extract the current template's title guidance, default labels, body fields (in order), field labels, descriptions, types, and required validations. Gather information for every required field, and optional fields where relevant. Research provided links if useful; do not manufacture adoption decisions or project applicability. Ask for missing substantive information.
2. Choose **one** status label based on the user's stated decision and the current Issue Data Model: `SONAR EXPLORE` (evaluating), `SONAR PROPOSE` (recommended via an open cross-referencing ADR PR), `SONAR ADOPT` (approved via a merged cross-referencing ADR PR), `SONAR HOLD` (do not expand usage), or `SONAR REJECT` (do not use for new work). Use the template's current default status only when consistent with the user's intent. If the decision is unclear, ask; do not infer adoption from enthusiasm alone. Do not combine statuses unless the user explicitly requests multiple placements.
3. Select existing `SONAR CATEGORY …` labels with the user according to the current template and Issue Data Model. If no existing category fits, ask whether to proceed without one (displayed as `Uncategorised`); do not create a new label without explicit authorization.
4. For `PROPOSE` and `ADOPT`, verify a supporting PR in `sixfeetup/engineering-handbook` that cross-references this issue, if one exists. An open PR supports `PROPOSE`; a merged PR supports `ADOPT`. A closed unmerged PR supports neither. The Sonar displays a warning if evidence is missing; do not claim evidence exists when it does not. If creating a new issue before its PR can reference it, tell the user that the PR must later cross-reference the issue and that the placement will warn until it does. If an ADR is needed, the user must explicitly request it separately via the engineering-decision-log skill; this skill does not write ADRs or PRs.
5. Follow the current template's title guidance. Render the body from its current fields in order: use each field's exact label as a Markdown heading, include all required fields, and represent optional fields and non-textarea controls appropriately. Do not copy the headings or section structure from issue #234 if the template has changed. For `HOLD` or `REJECT`, include rationale and applicable migration guidance in relevant current fields. Link known ADR PRs where helpful, but a body link alone is not a substitute for the PR cross-referencing the issue.

## Publish

- Show the proposed title, body, repository, and exact status/category labels to the user; wait for approval before publishing. This is a deliberate exception to the generic github-issues skill's no-inferred-label rule: Technology Sonar requires a status label to include an issue, and the Technology template asks for category labels. Confirm label choices with the user.
- Create the approved issue using `gh issue create --repo sixfeetup/engineering-handbook --title "..." --body-file FILE --label "SONAR ..."` (repeat `--label` for each approved label). Use a uniquely named temporary body file for multiline content and remove it afterward. Do not use `gh issue create --template` to assume form fields will be populated.
- Verify the saved issue body and labels with `gh issue view URL --json title,body,labels,url`. Open the issue in the user's browser with `gh issue view URL --web`.
- Report the issue URL and any remaining ADR/PR cross-reference action or missing-evidence warning. Never create an ADR or PR automatically.
