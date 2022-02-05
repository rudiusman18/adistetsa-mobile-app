import 'package:adistetsa/pages/calendar_page.dart';
import 'package:adistetsa/pages/home_page.dart';
import 'package:adistetsa/pages/notification_page.dart';
import 'package:adistetsa/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

int currentIndex = 0;

class _MainPageState extends State<MainPage> {
  Widget customBottomNavbar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(
              0,
              -1,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 1,
        currentIndex: currentIndex,
        onTap: (value) {
          print(value);
          setState(() {
            currentIndex = value;
          });
        },
        unselectedLabelStyle: mono3TextStyle.copyWith(
          fontWeight: semiBold,
          fontSize: 10,
        ),
        selectedLabelStyle: m2TextStyle.copyWith(
          fontWeight: semiBold,
          fontSize: 10,
        ),
        backgroundColor: mono6Color,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: m2Color,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                bottom: 5.41,
              ),
              child: Image.asset(
                'assets/home/home_icon.png',
                width: 20,
                height: 18.6,
                color: currentIndex == 0 ? m2Color : mono3Color,
              ),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                bottom: 5.41,
              ),
              child: Image.asset(
                'assets/home/calendar_icon.png',
                width: 20,
                height: 18.6,
                color: currentIndex == 1 ? m2Color : mono3Color,
              ),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                bottom: 5.41,
              ),
              child: Image.asset(
                'assets/home/notification_icon.png',
                width: 20,
                height: 18.6,
                color: currentIndex == 2 ? m2Color : mono3Color,
              ),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                bottom: 5.41,
              ),
              child: Image.asset(
                'assets/home/user_icon.png',
                width: 20,
                height: 18.6,
                color: currentIndex == 3 ? m2Color : mono3Color,
              ),
            ),
            label: 'Beranda',
          ),
        ],
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return CalendarPage();
      case 2:
        return NotificationPage();
      case 3:
        return ProfilePage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mono6Color,
      bottomNavigationBar: customBottomNavbar(),
      body: body(),
    );
  }
}
