# Specification: accessible form feedback

## User outcome

A user can understand what information is required, recover from validation
errors, and confirm whether the form was submitted while using touch,
keyboard navigation, VoiceOver, or TalkBack.

## Behaviors

1. The email field identifies itself as required in its visible label.
2. Submitting an empty or malformed email displays a specific correction.
3. After an invalid submission, focus moves to the invalid email field.
4. The form-level status explains that submission did not occur.
5. A successful submission updates a semantic live region without moving focus.
6. The checkbox exposes its checked state and can be toggled independently.
7. Every interactive target meets the platform minimum target size.

## Acceptance criteria

- Given the email field is empty, when Save preferences is activated, then the
  field displays "Enter an email address" and receives focus.
- Given the email is malformed, when the form is submitted, then the error
  suggests the expected `name@example.com` format.
- Given the form is valid, when it is submitted, then a visible and semantic
  status confirms whether product updates are enabled.
- The result is understandable without relying on color, position, or sound.

## Automated evidence

- Widget tests cover invalid and valid submissions.
- Semantics finders verify the form-level status.
- Flutter accessibility guidelines check labels, contrast, and tap targets.

## Manual evidence

- VoiceOver: verify reading order, error discovery, focus, and rotor navigation.
- TalkBack: verify field label, error feedback, checkbox state, and live-region
  behavior without interrupting unrelated speech.
- Large text: verify the form at the largest supported system text size.

