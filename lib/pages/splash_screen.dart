import 'package:flutter/material.dart';
import 'package:flutterando_mockup/pages/base_page.dart';
import 'package:flutterando_mockup/src/themes/color_schemes.g.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BasePage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: darkColorScheme.background,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 71,
            right: 70,
          ),
          child: ScaleTransition(
            scale: _animation,
            child: SizedBox(
              width: 287,
              height: 75,
              child: Image.asset('assets/images/masterclass_logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
