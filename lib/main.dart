import 'package:adistetsa/login_page.dart';
import 'package:adistetsa/pages/detail%20profile/update_password_page.dart';
import 'package:adistetsa/pages/main_page.dart';
import 'package:adistetsa/pages/staff/perpustakaan/katalog%20buku/katalog_buku_page.dart';
import 'package:adistetsa/pages/staff/perpustakaan/peminjaman%20buku/detail_peminjaman_buku_page.dart';
import 'package:adistetsa/pages/staff/perpustakaan/peminjaman%20buku/peminjaman_buku_page.dart';
import 'package:adistetsa/providers/auth_provider.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/roles_page.dart';
import 'package:adistetsa/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(AdiStetsa());
}

class AdiStetsa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future getToken() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      return pref.getString('token');
    }

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Providers(),
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
            case '/roles-page':
              return PageTransition(
                child: RolesPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/update-password-page':
              return PageTransition(
                child: UpdatePasswordPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staff-perpus/katalog-buku-page':
              return PageTransition(
                child: KatalogBukuPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staff-perpus/peminjaman-buku-page':
              return PageTransition(
                child: PeminjamanBukuPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staff-perpus/peminjaman-buku/detail-page':
              return PageTransition(
                child: DetailPeminjamanBukuPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/main-page/back':
              return PageTransition(
                child: MainPage(),
                type: PageTransitionType.leftToRight,
              );
            case '/main-page':
              return PageTransition(
                child: MainPage(),
                type: PageTransitionType.bottomToTop,
              );
          }
        },
        home: FutureBuilder(
          future: getToken(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                body: RolesPage(),
              );
            } else {
              return Scaffold(
                body: SplashScreen(),
              );
            }
          },
        ),
      ),
    );
  }
}
