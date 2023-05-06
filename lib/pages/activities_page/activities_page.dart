import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../animations_page/animations_page.dart';
import '../theme_inherited.dart';
import 'components/custom_card.dart';
import 'package:material_symbols_icons/symbols.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => ActivitiesPageState();
}

class ActivitiesPageState extends State<ActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<ThemeInherited>();
    return ListView(
      children: [
        CustomCard(
            icon: FontAwesomeIcons.personRunning,
            title: 'Animações',
            text:
                'Estudos sobre animações implicítas e controladas, contendo 4 exercícios e 2 estudos',
            numberExercise: '4',
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AnimationsPage()),
              );
            }),
        CustomCard(
          icon: FontAwesomeIcons.glasses,
          title: 'Leitura de Mockup',
          text:
              'Aplicação da técnica de leitura de mockup, contendo 2 exercícios',
          numberExercise: '2',
          function: () {},
        ),
        CustomCard(
          icon: Symbols.toys_fan,
          title: 'Playground',
          text: 'Ambiente destinado a testes e estudos em geral',
          numberExercise: '3',
          function: () {},
        ),
      ],
    );
  }
}
