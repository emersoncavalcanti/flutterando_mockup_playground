import 'package:flutter/material.dart';
import 'package:flutterando_mockup/src/themes/color_schemes.g.dart';

class CustomList extends StatelessWidget {
  final String title;
  final int indice;
  const CustomList({super.key, required this.title, required this.indice});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: SizedBox(
        width: size.width,
        height: 64,
        child: Row(children: [
          Flexible(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.only(
                left: 14,
              ),
              width: 33,
              height: 33,
              decoration: BoxDecoration(
                color: lightColorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                '$indice',
                style: TextStyle(
                  color: lightColorScheme.onPrimary,
                  fontFamily: 'Poppins-Medium',
                  fontSize: 15,
                ),
              )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
