import 'package:flutter/material.dart';

class AccessibleFormScreen extends StatefulWidget {
  const AccessibleFormScreen({super.key});

  @override
  State<AccessibleFormScreen> createState() => _AccessibleFormScreenState();
}

class _AccessibleFormScreenState extends State<AccessibleFormScreen> {
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  bool _agreedToUpdates = false;
  String _status = '';

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Enter an email address.';
    }
    if (!email.contains('@') || !email.contains('.')) {
      return 'Enter an email address in the format name@example.com.';
    }
    return null;
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      setState(() => _status = 'Form not submitted. Review the email field.');
      _emailFocusNode.requestFocus();
      return;
    }

    setState(() {
      _status = _agreedToUpdates
          ? 'Preferences saved. Product updates are enabled.'
          : 'Preferences saved. Product updates are disabled.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accessible form feedback')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Semantics(
                header: true,
                child: Text(
                  'Notification preferences',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Required fields are identified in their labels. Errors explain '
                'how to recover and focus returns to the invalid field.',
              ),
              const SizedBox(height: 24),
              TextFormField(
                autofillHints: const [AutofillHints.email],
                controller: _emailController,
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'name@example.com',
                  labelText: 'Email, required',
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 12),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {
                  setState(() => _agreedToUpdates = value ?? false);
                },
                title: const Text('Send me occasional product updates'),
                value: _agreedToUpdates,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: FilledButton(
                  onPressed: _submit,
                  child: const Text('Save preferences'),
                ),
              ),
              const SizedBox(height: 20),
              Semantics(
                container: true,
                liveRegion: true,
                label: _status.isEmpty ? 'No form status yet.' : _status,
                child: ExcludeSemantics(
                  child: Text(
                    _status,
                    key: const ValueKey('form-status'),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
