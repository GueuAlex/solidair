import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../config/app_text.dart';
import '../../../config/palette.dart';
import '../../../constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/infos_column.dart';
import '../../signin/signin_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  ////////////////////////::
  bool isVisible1 = true;
  bool isVisible2 = true;
  //////////////////////////:
  @override
  Widget build(BuildContext context) {
    ///////////
    ///
    ///
    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      onChanged: (value) {
        setState(() {
          isVisible1 = false;
        });
      },
      onTap: () => setState(() {
        isVisible1 = false;
      }),
      style: const TextStyle(
        color: Palette.appPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      onSaved: (email) {},
      decoration: InputDecoration(
        border: InputBorder.none,
        label: AppText.medium(
          isVisible1 ? "Votre email" : '',
          color: Palette.appPrimaryColor,
        ),
      ),
    );
    //////////////////
    ///
    ///
    final passwordField = TextFormField(
      textInputAction: TextInputAction.done,
      obscureText: true,
      onChanged: (value) {
        setState(() {
          isVisible2 = false;
        });
      },
      onTap: () => setState(() {
        isVisible2 = false;
      }),
      style: const TextStyle(
        color: Palette.appPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: AppText.medium(isVisible2 ? "Votre mot de  passe" : '',
            color: Palette.appPrimaryColor),
      ),
    );
    ///////////////
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
            height: 40,
            radius: 5,
            text: 'CONNEXION'.toUpperCase(),
            onPress: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            },
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.pushNamed(context, SigninScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
