import 'package:flutter/material.dart';

class LiveRegionScreen extends StatefulWidget {
  const LiveRegionScreen({super.key});

  @override
  State<LiveRegionScreen> createState() => _LiveRegionScreenState();
}

class _LiveRegionScreenState extends State<LiveRegionScreen> {
  int _resultCount = 0;

  String get _status => switch (_resultCount) {
        0 => 'No results loaded.',
        1 => '1 result loaded.',
        _ => '$_resultCount results loaded.',
      };

  void _loadMore() {
    setState(() => _resultCount += 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic announcements')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Semantics(
              header: true,
              child: Text(
                'Prefer semantic state over disruptive announcements',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'A live region exposes meaningful updates without moving focus. '
              'This is generally preferable to forcing a platform announcement.',
            ),
            const SizedBox(height: 24),
            Semantics(
              container: true,
              liveRegion: true,
              label: _status,
              child: ExcludeSemantics(
                child: Text(
                  _status,
                  key: const ValueKey('result-status'),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: FilledButton(
                onPressed: _loadMore,
                child: const Text('Load 3 more results'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
