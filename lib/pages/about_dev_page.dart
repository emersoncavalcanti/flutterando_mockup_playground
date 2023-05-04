import 'package:flutter/material.dart';

import '../src/shared/header.dart';

class AboutDevPage extends StatelessWidget {
  const AboutDevPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SafeArea(
          child: Header(
            title: 'Sobre o dev',
            subtitle: 'Flutterando Masterclass',
          ),
        ),
      ],
    );
  }
}
