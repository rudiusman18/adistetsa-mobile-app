import 'package:adistetsa/login_page.dart';
<<<<<<< HEAD
import 'package:adistetsa/providers/auth_provider.dart';
=======
import 'package:adistetsa/pages/detail%20profile/update_password_page.dart';
import 'package:adistetsa/pages/main_page.dart';
import 'package:adistetsa/roles_page.dart';
>>>>>>> cce061c4ba1160fcca27de602bcc294cdcc5863f
import 'package:adistetsa/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
<<<<<<< HEAD
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthpProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login-page':
              return PageTransition(
                child: LoginPage(),
                type: PageTransitionType.rightToLeft,
              );
          }
        },
        home: Scaffold(
          body: SplashScreen(),
        ),
=======
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
>>>>>>> cce061c4ba1160fcca27de602bcc294cdcc5863f
      ),
    );
  }
}
