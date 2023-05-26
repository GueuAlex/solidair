import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'config/palette.dart';
import 'screens/create_order/create_order.dart';
import 'screens/home/home_screen.dart';
import 'screens/profil/profil_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //State class
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        backgroundColor: const Color.fromRGBO(242, 248, 255, 1),
        buttonBackgroundColor: Palette.appPrimaryColor,

        //height: 100,
        key: _bottomNavigationKey,
        items: <Widget>[
          Container(
            width: 35,
            height: 35,
            padding: const EdgeInsets.all(3),
            //child: Icon(Icons.home, size: 35),
            child: SvgPicture.asset(
              'assets/icons/home.svg',
              color: _page == 0 ? Palette.whiteColor : Palette.primaryColor,
            ),
          ),
          Container(
            width: 35,
            height: 35,
            padding: const EdgeInsets.all(3),
            //child: Icon(Icons.home, size: 35),
            child: SvgPicture.asset(
              'assets/icons/plus.svg',
              color: _page == 1 ? Palette.whiteColor : Palette.primaryColor,
            ),
          ),
          Container(
            width: 35,
            height: 35,
            padding: const EdgeInsets.all(3),
            //child: Icon(Icons.home, size: 35),
            child: SvgPicture.asset(
              'assets/icons/user.svg',
              color: _page == 2 ? Palette.whiteColor : Palette.primaryColor,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.2),
        child: getSelectedWidget(index: _page),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const SafeArea(
          child: HomeScreen(),
        );
        break;
      case 1:
        widget = const CreateOrderScreen();
        break;
      default:
        widget = const ProfilScreen();
        break;
    }
    return widget;
  }
}
