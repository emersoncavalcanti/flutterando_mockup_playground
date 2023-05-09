import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../src/themes/color_schemes.g.dart';
import '../../base_page.dart';

class CustomCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String text;
  final String numberExercise;
  final void Function()? function;

  const CustomCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
    required this.numberExercise,
    required this.function,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<BasePageState>()!;
    final themeMode = state.themeMode;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      margin: const EdgeInsets.fromLTRB(15, 20, 13, 0),
      child: Container(
        padding: const EdgeInsets.only(top: 12),
        width: 200,
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 0,
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 13),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.2),
                      color: lightColorScheme.primary,
                    ),
                    width: 43,
                    height: 43,
                    child: Icon(
                        color: themeMode == ThemeMode.dark
                            ? lightColorScheme.onPrimaryContainer
                            : darkColorScheme.onPrimaryContainer,
                        widget.icon),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(right: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Exercicios:',
                          style: TextStyle(
                            color: lightColorScheme.onSurfaceVariant,
                            fontFamily: themeMode == ThemeMode.dark
                                ? 'Montserrat-Regular'
                                : 'Poppins-Regular',
                            fontSize: 12,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11),
                          child: Text(
                            widget.numberExercise,
                            style: const TextStyle(
                              fontFamily: 'Poppins-Medium',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 37, 15, 0),
              child: Text(
                widget.text,
                style: TextStyle(
                    color: lightColorScheme.onSurfaceVariant,
                    fontFamily: themeMode == ThemeMode.dark
                        ? 'Montserrat-Regular'
                        : 'Poppins-Medium',
                    fontSize: 14),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                    top: 41.5, bottom: 22.5, left: 18.56, right: 10.56),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          const Icon(FontAwesomeIcons.github),
                          Text(
                            ' Acessar código fonte',
                            style: TextStyle(
                              fontFamily: themeMode == ThemeMode.dark
                                  ? 'Montserrat-Regular'
                                  : 'Poppins-Medium',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: Container(
                        alignment: Alignment.center,
                        width: 119,
                        height: 34.5,
                        decoration: BoxDecoration(
                          color: lightColorScheme.primary,
                          borderRadius: BorderRadius.circular(59.5),
                        ),
                        child: InkWell(
                          onTap: widget.function,
                          child: Text(
                            'Ver mais',
                            style: TextStyle(
                              color: lightColorScheme.onPrimary,
                              fontFamily: themeMode == ThemeMode.dark
                                  ? 'Poppins-SemiBold'
                                  : 'Poppins-Medium',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
