import 'package:flutter/material.dart';
import 'package:solidair/screens/Welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'splashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((_) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const WelcomeScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(0.0),
              child: Image.asset('assets/images/logo1.png'),
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
              height: 150,
              width: 150,
              child:
                  Image.asset('assets/images/loading.gif', fit: BoxFit.cover),
            )
          ],
        ),
      )),
    );
  }
}
