import 'package:flutter/material.dart';

import '../src/shared/header.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Header(
          title: 'Animações',
          subtitle: 'Flutterando Masterclass',
        ),
      ),
    );
  }
}
