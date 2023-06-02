import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../config/app_text.dart';
import '../../config/palette.dart';
import '../../constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/infos_column.dart';
import '../Login/login_screen.dart';

class SigninScreen extends StatefulWidget {
  static String routeName = 'singinScreen';
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  ////////////////////// text editing controllers /////////////////////////////
  ///
  ///
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _idcardController = TextEditingController();
  final TextEditingController _birthplaceController = TextEditingController();

  //////////////////// dispose controllers ////////////////////////////
  ///
  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _idcardController.dispose();
    _birthplaceController.dispose();
    super.dispose();
  }

  ///////////////////////////////////////test visibility /////////////////////
  ///
  bool isVisible1 = true;
  bool isVisible2 = true;
  bool isVisible3 = true;
  bool isVisible4 = true;
  bool isVisible5 = true;
  bool isVisible6 = true;
  bool isVisible7 = true;
  bool isVisible8 = true;

  ///
  ////////////////////////////////////////////////////////////////////////////
  ///
  ////////////////////////////////////////
  String _seletectGender = '';

  final List<String> _genderOptions = ['Homme', 'Femme', 'Autre'];
  ////////////////////////////////////////

  ///
  ///
  /////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////
  final PageController _pageController = PageController();

  ///
  //////////////////////////////////////////////////
  ////////////////////////////
  DateTime _selectedDate = DateTime.now();

  ///
  ////////////////////////photo selectionn configs//////////
  ///
  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      //img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  ///
  ///
  //////////////////////////////////////////////:::::
  @override
  Widget build(BuildContext context) {
    //////////////////////////////////////////////
    ///
    ///
    final firstname = TextFormField(
      controller: _firstnameController,
      onChanged: (value) {
        setState(() {
          isVisible1 = false;
        });
      },
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
          isVisible1 ? "Votre nom de famille " : '',
          color: Palette.appPrimaryColor,
        ),
      ),
    );
    ////////////
    ///
    ///
    final placeOfBirth = TextFormField(
      controller: _birthplaceController,
      onChanged: (value) {
        setState(() {
          isVisible2 = false;
        });
      },
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
          isVisible2 ? "Lieu de naissance" : '',
          color: Palette.appPrimaryColor,
        ),
      ),
    );
    ////////////
    ///
    ///
    final lastname = TextFormField(
      onChanged: (value) {
        setState(() {
          isVisible3 = false;
        });
      },
      controller: _lastnameController,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        color: Palette.appPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: AppText.medium(
          isVisible3 ? "Vos prénoms" : '',
          color: Palette.appPrimaryColor,
        ),
      ),
    );
    ////////////
    ///
    ///
    final idCardField = TextFormField(
      onChanged: (value) {
        setState(() {
          isVisible4 = false;
        });
      },
      controller: _idcardController,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        color: Palette.appPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: AppText.medium(
          isVisible4 ? 'Votre numéro de CNI' : '',
          color: Palette.appPrimaryColor,
        ),
      ),
    );
    ////////////
    ///
    ///
    final adressField = TextFormField(
      onChanged: (value) {
        setState(() {
          isVisible5 = false;
        });
      },
      controller: _addressController,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        color: Palette.appPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: AppText.medium(
          isVisible5 ? 'Votre Adresse' : '',
          color: Palette.appPrimaryColor,
        ),
      ),
    );

    ////////////
    ///
    ///
    final phoneFiedl = TextFormField(
      onChanged: (value) {
        setState(() {
          isVisible6 = false;
        });
      },
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        color: Palette.appPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: AppText.medium(
          isVisible6 ? 'numéro de portable' : '',
          color: Palette.appPrimaryColor,
        ),
      ),
    );
    ////////////
    ///
    ///
    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          isVisible7 = false;
        });
      },
      controller: _emailController,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        color: Palette.appPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: AppText.medium(
          isVisible7 ? 'Votre Email' : '',
          color: Palette.appPrimaryColor,
        ),
      ),
    );
    ////////////////
    ///
    ///
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
          icon: Icon(
            Platform.isIOS ? CupertinoIcons.back : CupertinoIcons.arrow_left,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView(
              //allowImplicitScrolling: true,
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {});
              },
              children: [
                ///////////////////////
                ///////////
                ////////////////////////
                Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10.0,
                    bottom: 10.0,
                    top: 15.0,
                  ),
                  //margin: EdgeInsets.only(top: size.height * 0.05),
                  width: double.infinity,
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.large(
                        'Ajoutons une photo de vous',
                        fontSize: 18,
                      ),
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
                                _image == null
                                    ? Container(
                                        width: 300,
                                        height: 300,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/profil_ava.png'),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Palette.whiteColor,
                                        backgroundImage: FileImage(_image!),
                                        radius: 150.0,
                                      ),
                                Positioned(
                                  bottom: 50,
                                  right: 10,
                                  child: InkWell(
                                    onTap: () =>
                                        _showSelectPhotoOptions(context),
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
                          text: 'suivant'.toUpperCase(),
                          onPress: () {
                            _pageController.nextPage(
                              duration: const Duration(microseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 25)
                    ],
                  ),
                ),
                //////////////////////////////
                //////////
                ////////////////////////////
                Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10.0,
                    bottom: 10.0,
                    top: 15.0,
                  ),
                  //margin: EdgeInsets.only(top: size.height * 0.05),
                  width: double.infinity,
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.large(
                        'Prénom et nom de famille',
                        fontSize: 18,
                      ),
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
                                label: 'Nom',
                                widget: Expanded(child: firstname),
                                width: double.infinity,
                                color: Palette.primaryColor,
                                opacity: 0.2,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InfosColumn(
                                label: 'Prénoms',
                                widget: Expanded(child: lastname),
                                width: double.infinity,
                                color: Palette.primaryColor,
                                opacity: 0.2,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () => _showBottomSheet(context),
                                child: InfosColumn(
                                  label: 'Civilité',
                                  widget: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText.medium(
                                        _seletectGender.isEmpty
                                            ? 'Sélectionnez un genr'
                                            : _seletectGender,
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
                                text: 'RETOUR',
                                onPress: () {
                                  _pageController.previousPage(
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
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
                                text: 'SUIVANT',
                                onPress: () {
                                  _pageController.nextPage(
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
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
                ///////////
                ///////////////////////////////
                Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10.0,
                    bottom: 10.0,
                    top: 15.0,
                  ),
                  //margin: EdgeInsets.only(top: size.height * 0.05),
                  width: double.infinity,
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.large(
                        'Choisissons votre anniversaire',
                        fontSize: 18,
                      ),
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
                              /*  Container(
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
                              ), */
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
                                text: 'RETOUR',
                                onPress: () {
                                  _pageController.previousPage(
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
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
                                text: 'SUIVANT',
                                onPress: () {
                                  _pageController.nextPage(
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
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
                ////////
                /////////////////////////////
                Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10.0,
                    bottom: 10.0,
                    top: 15.0,
                  ),
                  // margin: EdgeInsets.only(top: size.height * 0.05),
                  width: double.infinity,
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.large(
                        'Ajoutons votre lieu de naissance',
                        fontSize: 18,
                      ),
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
                          child: Container(
                            child: Center(
                              child: InfosColumn(
                                label: 'Lieu',
                                color: Palette.appPrimaryColor,
                                opacity: 0.2,
                                widget: Expanded(
                                  child: placeOfBirth,
                                ),
                              ),
                            ),
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
                                text: 'RETOUR',
                                onPress: () {
                                  _pageController.previousPage(
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
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
                                text: 'SUIVANT',
                                onPress: () {
                                  _pageController.nextPage(
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
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
                ///////////
                ///////////////////////////////
                Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10.0,
                    bottom: 10.0,
                    top: 15.0,
                  ),
                  //margin: EdgeInsets.only(top: size.height * 0.05),
                  width: double.infinity,
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.large(
                        'Identification',
                        fontSize: 18,
                      ),
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
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InfosColumn(
                                label: 'N° CNI',
                                color: Palette.appPrimaryColor,
                                opacity: 0.2,
                                widget: Expanded(
                                  child: idCardField,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              InfosColumn(
                                label: 'Adresse',
                                color: Palette.appPrimaryColor,
                                opacity: 0.2,
                                widget: Expanded(
                                  child: adressField,
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
                                text: 'RETOUR',
                                onPress: () {
                                  _pageController.previousPage(
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
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
                                text: 'SUIVANT',
                                onPress: () {
                                  _pageController.nextPage(
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25)
                    ],
                  ),
                ),
                /////////////////////////////////
                ////////////
                ////////////////////////////////
                Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10.0,
                    bottom: 10.0,
                    top: 15.0,
                  ),
                  //margin: EdgeInsets.only(top: size.height * 0.05),
                  width: double.infinity,
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.large(
                        'Email & numéro de poratble',
                        fontSize: 18,
                      ),
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
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InfosColumn(
                                label: 'numéro',
                                color: Palette.appPrimaryColor,
                                opacity: 0.2,
                                widget: Expanded(
                                  child: phoneFiedl,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              InfosColumn(
                                label: 'Email',
                                color: Palette.appPrimaryColor,
                                opacity: 0.2,
                                widget: Expanded(
                                  child: emailField,
                                ),
                              ),
                            ],
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
                          text: 'S\'INSCRIRE',
                          onPress: () {},
                        ),
                      ),
                      const SizedBox(height: 25)
                    ],
                  ),
                ),
                //////////////////////////
                ///fin
              ],
            ),
          ],
        ),
      ),
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
                    _genderOptions.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 15,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _seletectGender = _genderOptions[index];
                              });
                              Navigator.pop(context);
                            },
                            child: AppText.medium(
                              _genderOptions[index],
                            ),
                          ),
                        )),
              ),
            )
          ],
        ),
      );
}

class SelectPhotoOptionsScreen extends StatelessWidget {
  final Function(ImageSource source) onTap;
  const SelectPhotoOptionsScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.shade300,
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            SelectPhoto(
              onTap: () => onTap(ImageSource.gallery),
              icon: Icons.image,
              textLabel: 'Importer de la Gallery',
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'OU',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectPhoto(
              onTap: () => onTap(ImageSource.camera),
              icon: Icons.camera_alt_outlined,
              textLabel: 'Utiliser la Camera',
            ),
          ])
        ],
      ),
    );
  }
}

class SelectPhoto extends StatelessWidget {
  final String textLabel;
  final IconData icon;

  final void Function()? onTap;

  const SelectPhoto({
    Key? key,
    required this.textLabel,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: Colors.grey.shade200,
        shape: const StadiumBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              textLabel,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
