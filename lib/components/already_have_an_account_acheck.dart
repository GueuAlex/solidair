import 'package:flutter/material.dart';

import '../config/palette.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Pas encore inscrit ? " : "Déjà inscrit ? ",
          style: const TextStyle(
            color: Palette.primaryColor,
          ),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? 'S\'inscrire' : "Se connecter",
            style: const TextStyle(
              color: Palette.appPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
