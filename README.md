# Flutter Accessibility Lab

Production-oriented Flutter accessibility patterns driven by explicit
specifications, testable acceptance criteria, and assistive-technology
validation.

This repository is an original public learning resource. It contains no client
code, proprietary assets, or reconstructed business logic from commercial
projects.

## Why this repository exists

Accessibility guidance often stops at adding a label to a widget. Production
apps also need predictable focus, recoverable errors, meaningful dynamic
updates, resilient text scaling, and a shared definition of what "accessible"
means for Product, Design, QA, and Engineering.

The lab connects four layers:

1. **Specification** — user outcomes, behaviors, edge cases, and acceptance criteria.
2. **Implementation** — focused Flutter examples using platform semantics.
3. **Automated evidence** — widget tests, semantics assertions, and Flutter guidelines.
4. **Manual evidence** — VoiceOver, TalkBack, keyboard, scaling, and inspection tools.

## Included examples

| Example | Engineering focus | Specification |
| --- | --- | --- |
| Accessible form feedback | Validation, error recovery, focus, semantic status | [`accessible-form-feedback.md`](docs/specs/accessible-form-feedback.md) |
| Focus management | Route context and focus restoration after a dialog | [`focus-management.md`](docs/specs/focus-management.md) |
| Dynamic announcements | Live regions and non-disruptive updates | [`dynamic-announcements.md`](docs/specs/dynamic-announcements.md) |

See the [accessibility test matrix](docs/test-matrix.md) for the boundary
between automated checks and manual assistive-technology testing.

## Run locally

Prerequisites:

- Flutter stable
- A supported Android, iOS, or web target

```bash
flutter pub get
flutter run
```

This repository intentionally does not commit generated platform folders. If
you need them for a local clone, generate only the platforms you use:

```bash
flutter create . --project-name flutter_accessibility_lab \
  --platforms=android,ios,web
```

## Quality checks

```bash
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
```

CI runs the same checks on every pull request and push to `main`.

## Accessibility principles demonstrated

- Prefer native Flutter controls before adding custom semantics.
- Expose meaningful state rather than duplicating visible text.
- Treat focus movement as a product behavior with explicit triggers.
- Prefer semantic updates and live regions over disruptive announcements.
- Provide visible and programmatic feedback for errors and success.
- Keep automated checks and manual screen-reader validation complementary.
- Document accessibility acceptance criteria before implementation.

## What automated tests cannot prove

A passing semantics test does not guarantee a usable VoiceOver or TalkBack
experience. Platform bridges, announcement timing, traversal order, gestures,
large-text behavior, and composite widgets require manual validation. The test
matrix records both forms of evidence rather than treating automation as a
replacement for disabled-user experience.

## References

- [Flutter accessibility overview](https://docs.flutter.dev/ui/accessibility)
- [Flutter accessibility testing](https://docs.flutter.dev/ui/accessibility/accessibility-testing)
- [Flutter `Semantics` API](https://api.flutter.dev/flutter/widgets/Semantics-class.html)
- [Web Content Accessibility Guidelines](https://www.w3.org/WAI/standards-guidelines/wcag/)

## License

MIT © Renan Andrade

