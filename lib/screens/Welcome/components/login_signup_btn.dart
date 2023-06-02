import 'package:flutter/material.dart';

import '../../../config/palette.dart';
import '../../../widgets/custom_button.dart';
import '../../Login/login_screen.dart';
import '../../Signup/signup_screen.dart';
import '../../signin/signin_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          color: Palette.primaryColor,
          width: double.infinity,
          height: 40,
          radius: 5,
          text: 'se connecter'.toUpperCase(),
          onPress: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              LoginScreen.routeName,
              (route) => false,
            );
          },
        ),
        const SizedBox(height: 16),
        CustomButton(
          color: Palette.secondaryColor,
          width: double.infinity,
          height: 40,
          radius: 5,
          text: 's\'inscrire'.toUpperCase(),
          onPress: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              SigninScreen.routeName,
              (route) => false,
            );
          },
        )
      ],
    );
  }
}
