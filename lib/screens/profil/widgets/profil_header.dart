import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/app_text.dart';
import '../../../config/palette.dart';
import '../../../widgets/profil_picture.dart';

class ProfilHeader extends StatelessWidget {
  const ProfilHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.medium(
          'Profil',
          color: Palette.secondWhite,
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: const Color.fromARGB(255, 14, 73, 93),
                        ),
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/profil.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.small(
                          'Hello',
                          color: Palette.secondWhite,
                        ),
                        AppText.large(
                          'KRA Tehua !',
                          fontSize: 22,
                          color: Palette.secondWhite,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.secondWhite,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/pen.svg',
                        color: Palette.greyColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
