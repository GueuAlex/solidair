import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:solidair/config/app_text.dart';
import 'package:solidair/config/palette.dart';
import 'package:solidair/widgets/custom_button.dart';
import 'package:solidair/widgets/infos_column.dart';

import '../../constants.dart';

class SigninScreen extends StatefulWidget {
  static String routeName = 'singinScreen';
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  ////////////////////////////
  DateTime _selectedDate = DateTime.now();

  ///
  ///////////////////////////
  @override
  Widget build(BuildContext context) {
    final firstname = TextFormField(
      keyboardType: TextInputType.text,
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
          "Your first name",
          color: Palette.appPrimaryColor,
        ),
      ),
    );
    ////////////
    ///
    ///
    final placeOfBirth = TextFormField(
      keyboardType: TextInputType.text,
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
          "Your first name",
          color: Palette.appPrimaryColor,
        ),
      ),
    );
    ////////////
    ///
    ///
    final lastname = TextFormField(
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
        label: AppText.medium("Your last name", color: Palette.appPrimaryColor),
      ),
    );
    ////////////////
    ///
    ///
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Platform.isIOS
                    ? CupertinoIcons.chevron_back
                    : CupertinoIcons.arrow_left,
              ),
            ),
            PageView(
              children: [
                //////////////
                ///
                /////////
                Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10.0,
                    bottom: 10.0,
                    top: 15.0,
                  ),
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  width: double.infinity,
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.large('Let\'s add a picture of you'),
                      Container(
                        width: 70,
                        height: 8,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Palette.primaryColor,
                              Color.fromARGB(255, 39, 99, 129),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 300,
                                  height: 300,
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/profilavatar.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 50,
                                  right: 70,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Palette.appPrimaryColor,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        CupertinoIcons.camera,
                                        color: Palette.secondWhite,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: CustomButton(
                          color: Palette.primaryColor,
                          width: double.infinity,
                          height: 40,
                          radius: 5,
                          text: 'NEXT',
                          onPress: () {},
                        ),
                      ),
                      const SizedBox(height: 25)
                    ],
                  ),
                ),
                ////////////////
                ///
                ///
                ///:
                Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10.0,
                    bottom: 10.0,
                    top: 15.0,
                  ),
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  width: double.infinity,
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.large('First & last name'),
                      Container(
                        width: 70,
                        height: 8,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Palette.primaryColor,
                              Color.fromARGB(255, 39, 99, 129),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InfosColumn(
                                label: 'first name',
                                widget: Expanded(child: firstname),
                                width: double.infinity,
                                color: Palette.primaryColor,
                                opacity: 0.2,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InfosColumn(
                                label: 'last name',
                                widget: Expanded(child: lastname),
                                width: double.infinity,
                                color: Palette.primaryColor,
                                opacity: 0.2,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InfosColumn(
                                label: 'Civility',
                                widget: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText.medium(
                                      'Choose a gender',
                                      color: Palette.appPrimaryColor,
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down,
                                      color: Palette.appPrimaryColor,
                                    )
                                  ],
                                ),
                                width: double.infinity,
                                color: Palette.primaryColor,
                                opacity: 0.2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                color: Palette.secondaryColor,
                                width: double.infinity,
                                height: 40,
                                radius: 5,
                                text: 'BACK',
                                onPress: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomButton(
                                color: Palette.primaryColor,
                                width: double.infinity,
                                height: 40,
                                radius: 5,
                                text: 'NEXT',
                                onPress: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25)
                    ],
                  ),
                ),
                /////////////////////////////
                ///////////////
                ///
                ///////////////////////////////
                Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10.0,
                    bottom: 10.0,
                    top: 15.0,
                  ),
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  width: double.infinity,
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.large('Let\'s select your birthday'),
                      Container(
                        width: 70,
                        height: 8,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Palette.primaryColor,
                              Color.fromARGB(255, 39, 99, 129),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 100.0,
                                alignment: Alignment.center,
                                child: Text(
                                  DateFormat('dd-MM-yyyy')
                                      .format(_selectedDate),
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 48),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedDate = DateTime.now();
                                    });
                                  },
                                  child: const Text(
                                    "TODAY",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 250,
                                child: ScrollDatePicker(
                                  selectedDate: _selectedDate,
                                  locale: const Locale('fr'),
                                  onDateTimeChanged: (DateTime value) {
                                    setState(() {
                                      _selectedDate = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                color: Palette.secondaryColor,
                                width: double.infinity,
                                height: 40,
                                radius: 5,
                                text: 'BACK',
                                onPress: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomButton(
                                color: Palette.primaryColor,
                                width: double.infinity,
                                height: 40,
                                radius: 5,
                                text: 'NEXT',
                                onPress: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25)
                    ],
                  ),
                ),

                ////////////////////////////
                ///////////////////////////////
                ///
                Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10.0,
                    bottom: 10.0,
                    top: 15.0,
                  ),
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  width: double.infinity,
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.large('Let\'s add place of birth'),
                      Container(
                        width: 70,
                        height: 8,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Palette.primaryColor,
                              Color.fromARGB(255, 39, 99, 129),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                color: Palette.secondaryColor,
                                width: double.infinity,
                                height: 40,
                                radius: 5,
                                text: 'BACK',
                                onPress: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomButton(
                                color: Palette.primaryColor,
                                width: double.infinity,
                                height: 40,
                                radius: 5,
                                text: 'NEXT',
                                onPress: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
