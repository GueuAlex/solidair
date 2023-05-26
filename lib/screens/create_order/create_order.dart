import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidair/widgets/custom_button.dart';
import 'package:solidair/widgets/infos_column.dart';

import '../../config/app_text.dart';
import '../../config/palette.dart';
import '../../constants.dart';

class CreateOrderScreen extends StatefulWidget {
  static String routeName = 'createOrderScreen';
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> requestType = [
    'Request type 1',
    'Request type 2',
    'Request type 3',
    'Request type 4',
    'Request type 5',
    'Request type 6',
    'Request type 3',
    'Request type 4',
    'Request type 5',
    'Request type 6',
  ];

  @override
  Widget build(BuildContext context) {
    ///////////
    ///
    ///
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
          "Enter amount",
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
    ///////////////
    ///
    ///
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: (size.height * 0.30),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/avion1.jpg'),
                fit: BoxFit.cover),
          ),
          child: Container(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            width: double.infinity,
            height: size.height,
            color: Colors.black.withOpacity(0.4),
            child: Center(
              child: AppText.large(
                'Faite votre demande de prestation !',
                color: Palette.whiteColor,
                fontSize: 28,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: size.height * 0.25),
            width: double.infinity,
            height: size.height,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(242, 248, 255, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset('assets/icons/login.svg'),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          // color: Colors.red,
                          child: Center(
                            child: InfosColumn(
                              height: 50,
                              color: Palette.primaryColor,
                              opacity: 0.2,
                              label: 'member',
                              widget: Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText.medium(
                                      'Select member',
                                      color: Palette.appPrimaryColor,
                                    ),
                                    const Icon(
                                      CupertinoIcons.chevron_down,
                                      color: Palette.appPrimaryColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: Center(
                            child: InfosColumn(
                              height: 50,
                              color: Palette.primaryColor,
                              opacity: 0.2,
                              label: 'request type',
                              widget: Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText.medium(
                                      'Select a request type',
                                      color: Palette.appPrimaryColor,
                                    ),
                                    const Icon(
                                      CupertinoIcons.chevron_down,
                                      color: Palette.appPrimaryColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: Center(
                            child: InfosColumn(
                                height: 50,
                                color: Palette.appPrimaryColor,
                                opacity: 0.2,
                                label: 'amount',
                                widget: Expanded(
                                  child: emailField,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: 15.0,
                      left: 15.0,
                    ),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _currentPage == 0
                            ? Container()
                            : Expanded(
                                child: CustomButton(
                                  color: Palette.secondaryColor,
                                  width: double.infinity,
                                  height: 40,
                                  radius: 5,
                                  text: 'Back',
                                  onPress: _currentPage > 0
                                      ? () => _pageController.previousPage(
                                          duration:
                                              const Duration(microseconds: 300),
                                          curve: Curves.bounceIn)
                                      : () {},
                                ),
                              ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: CustomButton(
                            color: Palette.primaryColor,
                            width: double.infinity,
                            height: 40,
                            radius: 5,
                            text: _currentPage == 2 ? 'Done' : 'Next',
                            onPress: _currentPage < 2
                                ? () => _pageController.nextPage(
                                      duration:
                                          const Duration(microseconds: 300),
                                      curve: Curves.ease,
                                    )
                                : () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
