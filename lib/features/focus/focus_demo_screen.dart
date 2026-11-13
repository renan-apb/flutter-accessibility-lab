import 'package:flutter/material.dart';

class FocusDemoScreen extends StatefulWidget {
  const FocusDemoScreen({super.key});

  @override
  State<FocusDemoScreen> createState() => _FocusDemoScreenState();
}

class _FocusDemoScreenState extends State<FocusDemoScreen> {
  final _dialogTriggerFocusNode = FocusNode();
  final _headingFocusNode = FocusNode(debugLabel: 'Focus demo heading');

  @override
  void dispose() {
    _dialogTriggerFocusNode.dispose();
    _headingFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _headingFocusNode.requestFocus();
      }
    });
  }

  Future<void> _showConfirmation() async {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Example dialog'),
        content: const Text(
          'After this dialog closes, focus returns to the button that opened it.',
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close dialog'),
          ),
        ],
      ),
    );

    if (mounted) {
      _dialogTriggerFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focus management')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Focus(
              focusNode: _headingFocusNode,
              child: Semantics(
                header: true,
                child: Text(
                  'Predictable focus is part of navigation',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'This heading receives focus after navigation so a screen-reader '
              'user immediately understands the new context.',
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: FilledButton.tonal(
                focusNode: _dialogTriggerFocusNode,
                onPressed: _showConfirmation,
                child: const Text('Open example dialog'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

