import 'package:flutter/material.dart';

import 'main_page.dart';
import 'screens/Login/login_screen.dart';
import 'screens/Signup/signup_screen.dart';
import 'screens/signin/signin_screen.dart';
import 'splash/splash_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        fontFamily: "Gordita",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      //home: const SplashScreen(),
      //home: const MyHomePage(),
      //initialRoute: ,
      routes: {
        '/': (ctxt) => const MainPage(),
        SplashScreen.routeName: (ctxt) => const SplashScreen(),
        LoginScreen.routeName: (ctxt) => const LoginScreen(),
        SignUpScreen.routeName: (ctxt) => const SignUpScreen(),
        SigninScreen.routeName: (ctxt) => const SigninScreen(),
      },
    );
  }
}
