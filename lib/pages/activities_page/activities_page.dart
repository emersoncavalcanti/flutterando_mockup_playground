import 'package:flutter/material.dart';
import '../animations_page/animations_page.dart';
import '../base_page.dart';
import '../theme_inherited.dart';
import 'widgets/custom_card.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => ActivitiesPageState();
}

class ActivitiesPageState extends State<ActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<ThemeInherited>();
    final state = context.findAncestorStateOfType<BasePageState>()!;

    return ListView(
      children: [
        CustomCard(
            image: state.themeMode == ThemeMode.light
                ? Image.asset('assets/images/running-light.png')
                : Image.asset('assets/images/running-dark.png'),
            title: 'Animações',
            text:
                'Estudos sobre animações implicítas e controladas, contendo 4 exercícios e 2 estudos',
            numberExercise: '4',
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnimationsPage(),
                ),
              );
            }),
        CustomCard(
          image: state.themeMode == ThemeMode.light
              ? Image.asset('assets/images/glasses-light.png')
              : Image.asset('assets/images/glasses-dark.png'),
          title: 'Leitura de Mockup',
          text:
              'Aplicação da técnica de leitura de mockup, contendo 2 exercícios',
          numberExercise: '2',
          function: () {},
        ),
        CustomCard(
          image: state.themeMode == ThemeMode.light
              ? Image.asset('assets/images/toys-light.png')
              : Image.asset('assets/images/toys-dark.png'),
          title: 'Playground',
          text: 'Ambiente destinado a testes e estudos em geral',
          numberExercise: '3',
          function: () {},
        ),
      ],
    );
  }
}
