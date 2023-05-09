import 'package:flutter/material.dart';
import 'package:flutterando_mockup/pages/animations_page/widgets/custom_list.dart';

import '../../src/shared/header.dart';
import '../base_page.dart';
import '../theme_inherited.dart';

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({super.key});

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    context.dependOnInheritedWidgetOfExactType<ThemeInherited>();
    context.findAncestorStateOfType<BasePageState>()!;

    return Scaffold(
      body: Column(
        children: [
          const SafeArea(
            child: Header(
              backPage: true,
              title: 'Animações',
              subtitle: 'Flutterando Masterclass',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 11, left: 12),
            width: size.width,
            height: 500,
            child: ListView(
              children: const [
                CustomList(indice: 1, title: 'Exercício 01'),
                CustomList(indice: 2, title: 'Exercício 02'),
                CustomList(indice: 3, title: 'Exercício 03'),
                CustomList(indice: 4, title: 'Exercício 04'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
