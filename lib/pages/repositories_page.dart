import 'package:flutter/material.dart';

import '../src/shared/header.dart';

class RepositoriesPage extends StatelessWidget {
  const RepositoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SafeArea(
          child: Header(
            title: 'Repositórios',
            subtitle: 'Flutterando Masterclass',
          ),
        ),
      ],
    );
  }
}
