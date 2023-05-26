import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../config/app_text.dart';
import '../../../config/palette.dart';
import '../../../constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/infos_column.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      style: const TextStyle(
        color: Palette.appPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      onSaved: (email) {},
      decoration: InputDecoration(
        border: InputBorder.none,
        label: AppText.medium(
          "Your email",
          color: Palette.appPrimaryColor,
        ),
      ),
    );
    ////////////
    ///
    ///
    final passwordField = TextFormField(
      textInputAction: TextInputAction.done,
      obscureText: true,
      style: const TextStyle(
        color: Palette.appPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: AppText.medium("Your password", color: Palette.appPrimaryColor),
      ),
    );
    ////////////////
    ///
    ///
    return Form(
      child: Column(
        children: [
          InfosColumn(
            label: 'Email',
            widget: Expanded(child: emailField),
            opacity: 0.1,
            color: Palette.appPrimaryColor,
          ),
          const SizedBox(
            height: 8,
          ),
          InfosColumn(
            label: 'Password',
            widget: Expanded(child: passwordField),
            opacity: 0.1,
            color: Palette.appPrimaryColor,
          ),
          const SizedBox(height: defaultPadding),
          CustomButton(
            color: Palette.primaryColor,
            width: double.infinity,
            height: 35,
            radius: 5,
            text: 'signup'.toUpperCase(),
            onPress: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            },
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
