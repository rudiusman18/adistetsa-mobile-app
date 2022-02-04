import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget usernameInput() {
      return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(
          top: 29,
        ),
        width: 284,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: mono3Color,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person_outline,
              color: mono3Color,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration.collapsed(
                  hintText: 'Username/NIS/NIP',
                  hintStyle: mono3TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(
          top: 23,
        ),
        width: 284,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: mono3Color,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              color: mono3Color,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration.collapsed(
                  hintText: 'Password',
                  hintStyle: mono3TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.visibility_off,
              color: mono3Color,
            ),
          ],
        ),
      );
    }

    Widget buttonSubmit() {
      return Container(
        width: 177,
        height: 46,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: m2Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Masuk',
            style: mono6TextStyle.copyWith(
              fontWeight: bold,
              fontSize: 16,
            ),
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
              'assets/login/bg_kiri.png',
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/login/bg_kanan_atas.png',
                width: 300,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 200,
              ),
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/login/bg_tengah_kanan.png',
                width: 80,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/login/bg_kanan_bawah.png',
                width: 200,
              ),
            ),
            // NOTE: CONTENT DISINI
            ListView(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 50,
                    bottom: 56,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo sekolah.png',
                        width: 107.14,
                        height: 125,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        'Masuk Sekarang',
                        style: mono1TextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: regular,
                        ),
                      ),
                      usernameInput(),
                      passwordInput(),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 284,
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Lupa kata sandi?',
                          style: m2TextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 111,
                      ),
                      buttonSubmit(),
                      SizedBox(
                        height: 50,
                      ),
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
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(
                top: 16,
                right: 20,
                left: 20,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: m1Color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
