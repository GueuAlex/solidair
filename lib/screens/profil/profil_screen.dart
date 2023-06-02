import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_text.dart';
import '../../config/palette.dart';
import 'widgets/profil_header.dart';

class ProfilScreen extends StatelessWidget {
  static String routeName = 'profilScreen';
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: size.height,
          margin: EdgeInsets.only(top: size.height * 0.25),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(242, 248, 255, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //const ActionsButton(),

                  const SizedBox(height: 20),
                  ///////////
                  Container(
                    margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.8,
                          color: Palette.greyColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppText.medium('Mon compte'),
                                Chip(
                                  backgroundColor: Colors.transparent,
                                  label: AppText.small(' '),
                                )
                              ],
                            ),
                            const Icon(
                              CupertinoIcons.chevron_right,
                              color: Palette.greyColor,
                              size: 18,
                            )
                          ],
                        ),
                        /////
                        ///
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.8,
                          color: Palette.greyColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppText.medium('Messages'),
                                Chip(
                                  backgroundColor: Palette.secondaryColor,
                                  label: AppText.small(
                                    '1',
                                    color: Palette.secondWhite,
                                  ),
                                )
                              ],
                            ),
                            const Icon(
                              CupertinoIcons.chevron_right,
                              color: Palette.greyColor,
                              size: 18,
                            )
                          ],
                        ),
                        /////
                        ///
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppText.medium('Mes demandes'),
                                Chip(
                                  backgroundColor: Colors.transparent,
                                  label: AppText.small(' '),
                                )
                              ],
                            ),
                            const Icon(
                              CupertinoIcons.chevron_right,
                              color: Palette.greyColor,
                              size: 18,
                            )
                          ],
                        ),
                        /////
                        ///
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(
                              0, 0), // décalage de l'ombre en x et y
                          blurRadius: 5, // rayon de flou de l'ombre
                          spreadRadius: 2, // propagation de l'ombre
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.8,
                          color: Palette.greyColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppText.medium('Changer mot de passe'),
                                Chip(
                                  backgroundColor: Colors.transparent,
                                  label: AppText.small(' '),
                                )
                              ],
                            ),
                            const Icon(
                              CupertinoIcons.chevron_right,
                              color: Palette.greyColor,
                              size: 18,
                            )
                          ],
                        ),
                        /////
                        ///
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppText.medium('Support'),
                                Chip(
                                  backgroundColor: Colors.transparent,
                                  label: AppText.small(' '),
                                )
                              ],
                            ),
                            const Icon(
                              CupertinoIcons.chevron_right,
                              color: Palette.greyColor,
                              size: 18,
                            )
                          ],
                        ),
                        /////
                        ///
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(
                              0, 0), // décalage de l'ombre en x et y
                          blurRadius: 5, // rayon de flou de l'ombre
                          spreadRadius: 2, // propagation de l'ombre
                        ),
                      ],
                    ),
                  ),
                  //////////////////////////
                  ///
                  ///
                  //////////////////////////
                  Container(
                    margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppText.medium(
                                  'Se déconnecter',
                                  fontWeight: FontWeight.bold,
                                  color: Palette.secondaryColor,
                                ),
                                Chip(
                                  backgroundColor: Colors.transparent,
                                  label: AppText.small(' '),
                                )
                              ],
                            ),
                            const Icon(
                              CupertinoIcons.chevron_right,
                              color: Colors.transparent,
                              size: 18,
                            )
                          ],
                        ),
                        /////
                        ///
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),

        ///////////////////////////////////////////////////////////////////
        ////////////////  profil header                   /////////////////
        ////////////////////////////////////////////////////////////////////
        const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(right: 10, left: 10, top: 8),
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: ProfilHeader(),
            ),
          ),
        )
        ////////////////////////////////////////////////////////////////////
        ///////////////     and profil header           ///////////////////
        ////////////////////////////////////////////////////////////////////
      ],
    );
  }
}

class ActionsButton extends StatelessWidget {
  const ActionsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50, left: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 65,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Palette.appPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset:
                          const Offset(0, 0), // décalage de l'ombre en x et y
                      blurRadius: 5, // rayon de flou de l'ombre
                      spreadRadius: 2, // propagation de l'ombre
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.power,
                    size: 30,
                    color: Palette.secondWhite,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              AppText.medium('Action 1', color: Palette.greyColor)
            ],
          ),
          Column(
            children: [
              Container(
                height: 65,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset:
                          const Offset(0, 0), // décalage de l'ombre en x et y
                      blurRadius: 5, // rayon de flou de l'ombre
                      spreadRadius: 2, // propagation de l'ombre
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.lock,
                    size: 30,
                    color: Palette.greyColor.withOpacity(0.8),
                  ),
                ),
              ),
              const SizedBox(height: 3),
              AppText.medium('Action 2', color: Palette.greyColor)
            ],
          ),
          Column(
            children: [
              Container(
                height: 65,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset:
                          const Offset(0, 0), // décalage de l'ombre en x et y
                      blurRadius: 5, // rayon de flou de l'ombre
                      spreadRadius: 2, // propagation de l'ombre
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.vpn_key,
                    size: 30,
                    color: Palette.greyColor.withOpacity(0.8),
                  ),
                ),
              ),
              const SizedBox(height: 3),
              AppText.medium('Action 3', color: Palette.greyColor)
            ],
          )
        ],
      ),
    );
  }
}
