import 'package:adistetsa/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool showPassword = false;
FocusNode passwordFocusNode = new FocusNode();
FocusNode usernameFocusNode = new FocusNode();
bool isActivePassword = false;
bool isActiveUsername = false;
bool isLoading = false;

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    handleLogin() async {
      setState(() {
        isLoading = true;
      });
      if (await AuthService().login(
          username: usernameController.text,
          password: passwordController.text)) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/roles-page', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: dangerColor,
            content: Text(
              'Gagal Login',
              textAlign: TextAlign.center,
            )));
      }
      setState(() {
        isLoading = false;
      });
    }

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
            color: usernameFocusNode.hasFocus || isActiveUsername == true
                ? m2Color
                : mono3Color,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person_outline,
              color: usernameFocusNode.hasFocus || isActiveUsername == true
                  ? m2Color
                  : mono3Color,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: GestureDetector(
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      isActiveUsername = true;
                      isActivePassword = false;
                    });
                  },
                  focusNode: usernameFocusNode,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      isActiveUsername = false;
                    });
                  },
                  controller: usernameController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Username/NIS/NIP',
                    hintStyle:
                        usernameFocusNode.hasFocus || isActiveUsername == true
                            ? m2TextStyle.copyWith(
                                fontSize: 12,
                              )
                            : mono3TextStyle.copyWith(
                                fontSize: 12,
                              ),
                  ),
                  style: usernameFocusNode.hasFocus || isActiveUsername == true
                      ? m2TextStyle.copyWith(
                          fontSize: 12,
                        )
                      : mono3TextStyle.copyWith(
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
            color: passwordFocusNode.hasFocus || isActivePassword == true
                ? m2Color
                : mono3Color,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              color: passwordFocusNode.hasFocus ? m2Color : mono3Color,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: TextFormField(
                style: passwordFocusNode.hasFocus || isActivePassword == true
                    ? m2TextStyle.copyWith(
                        fontSize: 12,
                      )
                    : mono3TextStyle.copyWith(
                        fontSize: 12,
                      ),
                onEditingComplete: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  setState(() {
                    isActivePassword = false;
                  });
                },
                onTap: () {
                  setState(() {
                    isActivePassword = true;
                    isActiveUsername = false;
                  });
                },
                focusNode: passwordFocusNode,
                controller: passwordController,
                textAlignVertical: TextAlignVertical.center,
                obscureText: showPassword == false ? true : false,
                decoration: InputDecoration.collapsed(
                  hintText: 'Password',
                  hintStyle:
                      passwordFocusNode.hasFocus || isActivePassword == true
                          ? m2TextStyle.copyWith(
                              fontSize: 12,
                            )
                          : mono3TextStyle.copyWith(
                              fontSize: 12,
                            ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (showPassword == false) {
                    showPassword = true;
                    print(showPassword);
                  } else {
                    showPassword = false;
                    print(showPassword);
                  }
                });
              },
              child: Container(
                child: Icon(
                  showPassword == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: passwordFocusNode.hasFocus || isActivePassword == true
                      ? m2Color
                      : mono3Color,
                ),
              ),
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
          onPressed: () {
            handleLogin();
          },
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

    Widget loadingButton() {
      return Container(
        width: 177,
        height: 46,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: m1Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Container(
            alignment: Alignment.center,
            width: 14,
            height: 14,
            child: CircularProgressIndicator(
              color: mono6Color,
              strokeWidth: 2,
            ),
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        showPassword = false;
        isActivePassword = false;
        isActiveUsername = false;
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                        isLoading == false ? buttonSubmit() : loadingButton(),
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
                    showPassword = false;
                    isActivePassword = false;
                    isActiveUsername = false;
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
      ),
    );
  }
}
