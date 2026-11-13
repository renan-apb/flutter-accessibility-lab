# Specification: dynamic announcements

## User outcome

A screen-reader user is informed when asynchronous content changes without
losing focus or having current speech unnecessarily interrupted.

## Decision

Use semantic state and a live region before requesting an explicit platform
announcement. Direct announcement APIs are reserved for changes that cannot be
represented naturally in the semantics tree.

## Behaviors

1. The current result count is visible and exposed as one semantic node.
2. Loading additional results updates the live-region label.
3. Focus remains on the Load more button.
4. Singular and plural result descriptions are grammatically correct.
5. The update is not communicated through color alone.

## Acceptance criteria

- Given no results are loaded, the status is "No results loaded."
- When three results are added, the status becomes "3 results loaded."
- Repeated activation updates the count without creating duplicate semantic
  nodes or moving focus.

## Platform note

Android discourages disruptive announcement events. Prefer meaningful semantic
changes such as live regions and verify the resulting TalkBack behavior on a
real device or emulator.

