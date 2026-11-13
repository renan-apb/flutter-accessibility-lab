# Accessibility test matrix

Automated checks catch regressions, but they do not replace assistive-technology
testing. This matrix makes the boundary explicit.

| Area | Automated evidence | Manual evidence |
| --- | --- | --- |
| Labels and roles | Semantics finders; labeled tap-target guideline | VoiceOver and TalkBack output |
| Tap targets | Android and iOS target-size guidelines | Reachability and accidental activation |
| Contrast | Flutter text-contrast guideline | Disabled states, images, dark mode |
| Focus | Active focus-node assertions | Screen-reader announcement and navigation order |
| Dynamic updates | Semantic label/state assertions | Live-region timing and speech interruption |
| Text scaling | Widget overflow tests at selected scales | Largest OS text and display settings |
| Reading order | Selected semantics-tree assertions | Swipe navigation and rotor/local context menu |
| Keyboard | Focus traversal tests where practical | Hardware keyboard and switch-access behavior |

## Release spot check

For each supported platform:

1. Complete every primary flow with the screen reader enabled.
2. Repeat the flow at the largest supported text size.
3. Verify focus after navigation, dialogs, full-screen content, and errors.
4. Verify loading, success, empty, and error states.
5. Run platform inspection tools and record findings separately from manual
   assistive-technology results.

