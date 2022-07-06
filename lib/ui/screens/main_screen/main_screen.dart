import 'package:birthday/ui/screens/all_users/home.dart';
import 'package:birthday/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../calendar/calendar.dart';
import '../profile/profile.dart';
import '../wishes/wishes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Home(),
          Calendar(),
          Wishes(),
          Profile()
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: AppColor.black7,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            "assets/svg/Users.svg",
            color: _selectedIndex == 0 ? Colors.blue : Colors.white,
          )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            "assets/svg/Calendar.svg",
            color: _selectedIndex == 1 ? Colors.blue : Colors.white,
          )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            "assets/svg/Gift.svg",
            color: _selectedIndex == 2 ? Colors.blue : Colors.white,
          )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            "assets/svg/Settings.svg",
            color: _selectedIndex == 3 ? Colors.blue : Colors.white,
          )),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
