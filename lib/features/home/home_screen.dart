import 'package:flutter/material.dart';
import 'package:flutter_accessibility_lab/features/announcements/live_region_screen.dart';
import 'package:flutter_accessibility_lab/features/focus/focus_demo_screen.dart';
import 'package:flutter_accessibility_lab/features/form/accessible_form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Accessibility Lab')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Semantics(
              header: true,
              child: Text(
                'Production-oriented accessibility patterns',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Each example starts with explicit behavior and accessibility '
              'acceptance criteria, then connects implementation to testing.',
            ),
            const SizedBox(height: 24),
            _DemoCard(
              description:
                  'Validation, error recovery, focus, and status feedback.',
              icon: Icons.fact_check_outlined,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const AccessibleFormScreen(),
                ),
              ),
              title: 'Accessible form feedback',
            ),
            _DemoCard(
              description:
                  'Intentional focus after navigation and modal dismissal.',
              icon: Icons.center_focus_strong_outlined,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const FocusDemoScreen(),
                ),
              ),
              title: 'Focus management',
            ),
            _DemoCard(
              description:
                  'Non-disruptive updates exposed through a semantic live region.',
              icon: Icons.campaign_outlined,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const LiveRegionScreen(),
                ),
              ),
              title: 'Dynamic announcements',
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoCard extends StatelessWidget {
  const _DemoCard({
    required this.description,
    required this.icon,
    required this.onTap,
    required this.title,
  });

  final String description;
  final IconData icon;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 12),
      child: Semantics(
        button: true,
        label: '$title. $description',
        child: ExcludeSemantics(
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Icon(icon, size: 32),
            onTap: onTap,
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(description),
            ),
            title: Text(title),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}

