import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/location.dart';

class LocationSlider extends StatelessWidget {
  const LocationSlider({super.key});

  @override
  Widget build(BuildContext context) {
    // Model to represent each card

    // Make a list to represent each card
    List<Location> locations = [
      Location(
        address: "Demande de prêt",
        color: Palette.appPrimaryColor,
        state: "Besoin de financement pour des projets?",
        imagePath: "assets/images/house1.png",
      ),
      Location(
        address: "Demande de soutien",
        color: const Color.fromRGBO(237, 116, 41, 1),
        state: "Un événement heureux ou malheureux?",
        imagePath: "assets/images/house2.png",
      ),
      Location(
        address: "Projet Immobilier",
        color: const Color.fromARGB(255, 52, 133, 151),
        state: "Préparez sereinement votre retraite ...",
        imagePath: "assets/images/house2.png",
      ),
      Location(
        address: "Projet Social",
        color: const Color.fromARGB(255, 48, 85, 138),
        state: "Intégrez l'équipe Sociale pour apporter ...",
        imagePath: "assets/images/house2.png",
      )
    ];
    return SizedBox(
      height: 90,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: locations[index].color,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(169, 176, 185, 0.42),
                    spreadRadius: 0,
                    blurRadius: 8.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 12.0,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: -16.0,
                    top: 0.0,
                    child: Opacity(
                      opacity: 0.69,
                      child: Image.asset(
                        locations[index].imagePath,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${locations[index].address},\n",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            fontSize: 16.0,
                          ),
                        ),
                        TextSpan(
                          text: locations[index].state,
                          style: const TextStyle(
                            fontSize: 13.0,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 15.0,
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}
