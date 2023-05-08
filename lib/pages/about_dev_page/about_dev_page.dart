import 'package:flutter/material.dart';
import 'package:flutterando_mockup/pages/about_dev_page/widgets/custom_LPI.dart';
import 'package:flutterando_mockup/pages/about_dev_page/widgets/custom_card.dart';
import 'package:flutterando_mockup/src/themes/color_schemes.g.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../base_page.dart';

class AboutDevPage extends StatefulWidget {
  const AboutDevPage({super.key});

  @override
  State<AboutDevPage> createState() => _AboutDevPageState();
}

class _AboutDevPageState extends State<AboutDevPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    context.findAncestorStateOfType<BaseScreenState>()!;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(
          top: 13,
          right: 13,
          left: 14,
        ),
        width: size.width,
        height: size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            child: SizedBox(
              width: size.width,
              height: 302,
              child: Column(
                children: [
                  Container(
                    width: 116,
                    height: 116,
                    margin: const EdgeInsets.only(top: 8, bottom: 13),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: darkColorScheme.background,
                        width: 4,
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignInside,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/dev.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text(
                    'Emerson Cavalcanti',
                    style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Duis rhoncus dui venenatis consequat porttitor. Etiam aliquet congue consequat. In posuere, nunc sit amet laoreet blandit, urna sapien.',
                      style: TextStyle(
                        color: lightColorScheme.onSurfaceVariant,
                        fontFamily: 'Poppins-Medium',
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30.52),
                    width: 160,
                    height: 30,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(FontAwesomeIcons.whatsapp),
                          Icon(FontAwesomeIcons.githubAlt),
                          Icon(FontAwesomeIcons.instagram),
                          Icon(FontAwesomeIcons.facebookF),
                        ]),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'Tecnologias Favoritas',
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: 110,
            width: size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CustomCard(
                  title: 'Flutter',
                ),
                CustomCard(
                  title: 'Flutter',
                ),
                CustomCard(
                  title: 'Flutter',
                ),
                CustomCard(
                  title: 'Flutter',
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'Habilidades e Competências',
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 14,
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23),
            ),
            child: Container(
              padding: const EdgeInsets.all(15),
              width: size.width,
              height: 181,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CustomLpi(title: 'Dart/Flutter', valueBar: 0.75),
                    CustomLpi(title: 'React', valueBar: 0.48),
                    CustomLpi(title: 'Javascript', valueBar: 0.65),
                    CustomLpi(title: 'HTML', valueBar: 0.90),
                    CustomLpi(title: 'CSS', valueBar: 0.78),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}

class CustomLPI {}
