import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidair/config/functions.dart';
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
  final PageController _pageController = PageController();
  int _currentPage = 0;
  ////////////////////////////////////////////////////////////
  ///
  ///
  bool isVisible = true;

  //////////////////////////////////////////////////////////////////////
////////////////// selected service type confings ////////////////////
//////////////////////////////////////////////////////////////////////
  ///
  ///
  final List<String> _selectedOption = [
    'Demande de Prêt',
    'Demande de Soutien',
    'Projet Immobilier',
    'Projet Social'
  ];
  String _selectedType = '';

  ///
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    ///////////
    ///
    ///
    final emailField = TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      onChanged: (value) {
        setState(() {
          isVisible = false;
        });
      },
      style: const TextStyle(
        color: Palette.appPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      onSaved: (email) {},
      decoration: InputDecoration(
        border: InputBorder.none,
        label: AppText.medium(
          isVisible ? "Entrez un montant" : '',
          color: Palette.appPrimaryColor,
        ),
      ),
    );
    //////////////////
    ///
    ///
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
                'Faites votre demande de prestation !',
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
                    child: SvgPicture.asset('assets/icons/injury-amico.svg'),
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
                        InkWell(
                          onTap: () => _showBottomSheet(context),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            // color: Colors.red,
                            child: Center(
                              child: InfosColumn(
                                height: 50,
                                color: Palette.primaryColor,
                                opacity: 0.2,
                                label: 'Services',
                                widget: Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText.medium(
                                        _selectedType.isEmpty
                                            ? 'Sélectionnez un type de service'
                                            : _selectedType,
                                        color: Palette.appPrimaryColor,
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        color: Palette.appPrimaryColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        /*    SizedBox(
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
                                      'Select a request',
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
                        ), */
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Center(
                            child: InfosColumn(
                              height: 50,
                              color: Palette.appPrimaryColor,
                              opacity: 0.2,
                              label: 'Amount',
                              widget: Expanded(
                                child: emailField,
                              ),
                            ),
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
                                  text: 'RETOUR',
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
                            text: _currentPage == 1 ? 'SOUMETTRE' : 'SUIVANT',
                            onPress: _currentPage < 1
                                ? () {
                                    _pageController.nextPage(
                                      duration:
                                          const Duration(microseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  }
                                : () {
                                    print(_currentPage);
                                    if (_currentPage == 1) {
                                      Functions.showLoadingSheet(ctxt: context);
                                      Future.delayed(const Duration(seconds: 3))
                                          .then(
                                        (_) {
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: AppText.medium(
                                                'Demande créé avec succès',
                                                color: Palette.greyWhiteColor,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          decoration: const BoxDecoration(
            color: Palette.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: sheetContent(),
        );
      },
    );
  }

  Container sheetContent() => Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                color: Palette.greyColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.5),
              child: Text(
                ' ',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  _selectedOption.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedType = _selectedOption[index];
                        });
                        Navigator.pop(context);
                      },
                      child: AppText.medium(
                        _selectedOption[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
