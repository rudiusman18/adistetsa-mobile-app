import 'package:adistetsa/login_page.dart';
import 'package:adistetsa/pages/detail%20profile/update_password_page.dart';
import 'package:adistetsa/pages/main_page.dart';
import 'package:adistetsa/roles_page.dart';
import 'package:adistetsa/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

void main(List<String> args) {
  runApp(AdiStetsa());
}

class AdiStetsa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login-page':
            return PageTransition(
              child: LoginPage(),
              type: PageTransitionType.rightToLeft,
            );
          case '/roles-page':
            return PageTransition(
              child: RolesPage(),
              type: PageTransitionType.rightToLeft,
            );
          case '/main-page':
            return PageTransition(
              child: MainPage(),
              type: PageTransitionType.bottomToTop,
            );
          case '/update-password-page':
            return PageTransition(
              child: UpdatePasswordPage(),
              type: PageTransitionType.rightToLeft,
            );
        }
      },
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
