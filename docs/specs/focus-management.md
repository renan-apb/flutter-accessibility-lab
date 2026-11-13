# Specification: focus management

## User outcome

A screen-reader or keyboard user always understands when context changes and
can continue from a predictable location after navigation or a modal flow.

## Behaviors

1. Entering the example screen places focus on its descriptive heading.
2. The heading is exposed with heading semantics.
3. Opening a dialog transfers focus into the dialog through platform behavior.
4. Closing the dialog restores focus to the button that opened it.
5. Focus is never moved in response to background data changes.

## Acceptance criteria

- Given the user navigates to the focus example, when the new route finishes
  rendering, then the screen heading receives focus once.
- Given the dialog was opened from its trigger, when the dialog closes, then
  the same trigger receives focus.
- A screen reader announces the new context without requiring exploratory
  swipes from the beginning of the page.

## Validation notes

Focus behavior must be validated with VoiceOver and TalkBack. A widget test can
verify the active Flutter focus node, but it cannot prove the complete platform
screen-reader experience.

