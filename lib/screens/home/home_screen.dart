import 'package:flutter/material.dart';
import 'package:solidair/config/palette.dart';

import '../../widgets/location_slider.dart';
import 'widgets/latest_orders.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'homeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 0.0,
          top: -20.0,
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              "assets/images/washing_machine_illustration.png",
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kToolbarHeight,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        // FlutterIcons.keyboard_backspace_mdi,
                        Icons.abc,
                        color: Palette.primaryColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Bienvenue,\n",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              TextSpan(
                                text: "FlutterPanda!",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/images/dp.png",
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 200.0,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: Color.fromRGBO(242, 248, 255, 1),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "Services",
                        style: TextStyle(
                          color: Color.fromRGBO(19, 22, 33, 1),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7.0),
                    const SizedBox(
                      height: 100,
                      child: Center(
                        // lets make a widget for the cards
                        child: LocationSlider(),
                      ),
                    ),
                    LatestOrders(),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
