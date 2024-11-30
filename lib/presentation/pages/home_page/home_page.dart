import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    this.initialSlug,
    required this.child,
  });

  final String? initialSlug;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('New Page'),
      ),
    );
  }
}
