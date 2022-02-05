import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class UpdatePasswordPage extends StatefulWidget {
  UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

FocusNode sandiLamaFocusNode = new FocusNode();
FocusNode sandiBaruFocusNode = new FocusNode();
FocusNode konfirmasiSandiBaruFocusNode = new FocusNode();
int isActive = -1;

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Ubah Sandi',
          style: mono6TextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        backgroundColor: p1Color,
        elevation: 0.5,
        shadowColor: mono3Color,
      );
    }

    Widget sandiLamaInput() {
      return Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          border: Border.all(
            color: sandiLamaFocusNode.hasFocus || isActive == 4
                ? m1Color
                : mono3Color,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.lock_outline,
              size: 16,
              color: sandiLamaFocusNode.hasFocus || isActive == 2
                  ? m1Color
                  : mono3Color,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: TextFormField(
                focusNode: sandiLamaFocusNode,
                onTap: () {
                  setState(() {
                    isActive = 0;
                  });
                },
                onEditingComplete: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  setState(() {
                    isActive = -1;
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Kata Sandi Lama',
                  hintStyle: mono3TextStyle.copyWith(
                    fontSize: 12,
                    color: sandiLamaFocusNode.hasFocus || isActive == 4
                        ? m1Color
                        : mono3Color,
                  ),
                ),
                style: mono3TextStyle.copyWith(
                  color: sandiLamaFocusNode.hasFocus || isActive == 4
                      ? m1Color
                      : mono3Color,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget sandiBaruInput() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        width: double.infinity,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          border: Border.all(
            color: sandiBaruFocusNode.hasFocus || isActive == 1
                ? m1Color
                : mono3Color,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.lock_outline,
              size: 16,
              color: sandiBaruFocusNode.hasFocus || isActive == 2
                  ? m1Color
                  : mono3Color,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: TextFormField(
                focusNode: sandiBaruFocusNode,
                onTap: () {
                  setState(() {
                    isActive = 0;
                  });
                },
                onEditingComplete: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  setState(() {
                    isActive = -1;
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Kata sandi baru',
                  hintStyle: mono3TextStyle.copyWith(
                    fontSize: 12,
                    color: sandiBaruFocusNode.hasFocus || isActive == 1
                        ? m1Color
                        : mono3Color,
                  ),
                ),
                style: mono3TextStyle.copyWith(
                  color: sandiBaruFocusNode.hasFocus || isActive == 1
                      ? m1Color
                      : mono3Color,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget konfirmasiSandiBaruInput() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        width: double.infinity,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          border: Border.all(
            color: konfirmasiSandiBaruFocusNode.hasFocus || isActive == 2
                ? m1Color
                : mono3Color,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.lock_outline,
              size: 16,
              color: konfirmasiSandiBaruFocusNode.hasFocus || isActive == 2
                  ? m1Color
                  : mono3Color,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: TextFormField(
                focusNode: konfirmasiSandiBaruFocusNode,
                onTap: () {
                  setState(() {
                    isActive = 0;
                  });
                },
                onEditingComplete: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  setState(() {
                    isActive = -1;
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Konfirmasi kata sandi baru',
                  hintStyle: mono3TextStyle.copyWith(
                    fontSize: 12,
                    color:
                        konfirmasiSandiBaruFocusNode.hasFocus || isActive == 2
                            ? m1Color
                            : mono3Color,
                  ),
                ),
                style: mono3TextStyle.copyWith(
                  color: konfirmasiSandiBaruFocusNode.hasFocus || isActive == 2
                      ? m1Color
                      : mono3Color,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget submitButton() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        width: double.infinity,
        height: 46,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: m2Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            setState(() {
              isActive = -1;
            });
            // Navigator.pushNamedAndRemoveUntil(
            //     context, '/roles', (route) => false);
          },
          child: Text(
            'Ubah',
            style: mono6TextStyle.copyWith(
              fontWeight: bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    Widget content() {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/home/profile/image_ubah_sandi.png',
                    width: 154,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Ubah Kata Sandi',
                    style: mono2TextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Masukkan kata sandi baru dibawah',
                    style: mono2TextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 46,
                right: 45,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kata Sandi Lama',
                    style: mono2TextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  sandiLamaInput(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Kata Sandi Baru',
                    style: mono2TextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  sandiBaruInput(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Konfirmasi Kata Sandi Baru',
                    style: mono2TextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  konfirmasiSandiBaruInput(),
                  SizedBox(
                    height: 40,
                  ),
                  submitButton(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: header(),
      body: content(),
    );
  }
}
