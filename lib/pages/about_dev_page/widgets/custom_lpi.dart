import 'package:flutter/material.dart';

import '../../../src/themes/color_schemes.g.dart';

class CustomLpi extends StatelessWidget {
  final String title;
  final double valueBar;

  const CustomLpi({super.key, required this.title, required this.valueBar});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 0,
            child: SizedBox(
              width: 70,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  color: lightColorScheme.onSurfaceVariant,
                  fontSize: 11,
                ),
              ),
            )),
        Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  color: lightColorScheme.primary,
                  backgroundColor: darkColorScheme.background,
                  minHeight: 9,
                  value: valueBar,
                ),
              ),
            )),
      ],
    );
  }
}
