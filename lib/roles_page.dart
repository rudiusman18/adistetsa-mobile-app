import 'package:adistetsa/providers/auth_provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/role_model.dart';

class RolesPage extends StatefulWidget {
  @override
  _RolesPageState createState() => _RolesPageState();
}

int currentIndex = -1;
bool isLoading = false;

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    roleHandler() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var role = preferences.getString('role');
      if (currentIndex == -1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: dangerColor,
          content: Text(
            "Pilih akun dulu",
            textAlign: TextAlign.center,
          ),
        ));
      } else {
        setState(() {
          isLoading = true;
        });
        print(role);
      }
      setState(() {
        isLoading = false;
      });
      Navigator.pushNamedAndRemoveUntil(
          context, '/main-page', (route) => false);
    }

    Widget option({required int index, required String text}) {
      return GestureDetector(
        onTap: () {
          setState(() {
            authProvider.roles = RolesModel(name: text);
            currentIndex = index;
            Future saveRoles() async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              return pref.setString('role', text);
            }

            saveRoles();
          });
        },
        child: Container(
          height: 44,
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 24,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: currentIndex == index ? m1Color : mono3Color,
                width: 2,
              )),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: currentIndex == index
                      ? m1TextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: bold,
                        )
                      : mono3TextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: bold,
                        ),
                ),
              ),
              currentIndex == index
                  ? Icon(
                      Icons.check_circle,
                      color: m1Color,
                    )
                  : Container(),
            ],
          ),
        ),
      );
    }

    Widget loadingButton() {
      return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: m1Color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
        child: Container(
          height: 14,
          width: 14,
          child: CircularProgressIndicator(
            color: mono6Color,
            strokeWidth: 4,
          ),
        ),
      );
    }

    Widget submitButton() {
      return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: m2Color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          roleHandler();
        },
        child: Text(
          'Pilih',
          style: mono6TextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/roles/bg_kiri_atas.png',
              width: 300,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/roles/bg_kiri.png',
                width: 120,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/roles/bg_kanan.png',
                width: 100,
              ),
            ),
            // NOTE: ini adalah konten
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 17,
                  bottom: 30,
                ),
                child: Column(
                  children: [
                    Text(
                      'Pilih Akun',
                      style: mono1TextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 43,
                    ),
                    Image.asset(
                      'assets/logo sekolah.png',
                      width: 107.14,
                      height: 125,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 26,
                        left: 27,
                        right: 27,
                      ),
                      padding: EdgeInsets.only(
                        top: 35,
                        bottom: 25,
                        left: 19,
                        right: 19,
                      ),
                      decoration: BoxDecoration(
                        color: mono6Color,
                        border: Border.all(
                          color: shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor,
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Silakan memilih akun Anda',
                            style: mono1TextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          FutureBuilder(
                            future: Service().getRoles(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                int index = 0;
                                List<RolesModel> data = snapshot.data;
                                return Column(
                                    children: data.map((item) {
                                  index += 1;
                                  return option(
                                      index: index, text: item.name.toString());
                                }).toList());
                              } else {
                                return Column(children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: CircularProgressIndicator(
                                      color: m1Color,
                                    ),
                                  ),
                                ]);
                              }
                            },
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              '*Anda hanya dapat menggunakan satu akun ',
                              style: mono3TextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: regular,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 37,
                          ),
                          Container(
                              width: 163,
                              height: 46,
                              child: isLoading == true
                                  ? loadingButton()
                                  : submitButton()),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 71,
                    ),
                    GestureDetector(
                      onTap: () async {
                        currentIndex = -1;
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.clear();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login-page', (route) => false);
                      },
                      child: Text(
                        'Keluar',
                        style: m3TextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Studium Et Sapientia',
                            style: mono2TextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Belajar dan Bijaksana',
                            style: mono3TextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
