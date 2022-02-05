import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Profil',
          style: mono6TextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: p1Color,
        elevation: 0.5,
        shadowColor: mono3Color,
      );
    }

    Widget dataProfile() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 35,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 29,
                bottom: 35,
              ),
              child: Container(
                child: Image.asset(
                  'assets/logo sekolah.png',
                  width: 94.29,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 29,
                  bottom: 26,
                  left: 41.71,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NIP 199010102015051001',
                      style: mono2TextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      'Kevin Firmansyah',
                      style: mono1TextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Email',
                      style: mono2TextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      'Kevinkevinkevinkevinfirmansyah@gmail.com',
                      style: mono1TextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Nomor HP',
                      style: mono2TextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '+62818547342957',
                      style: mono1TextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content({required IconData icon, required String name}) {
      return Container(
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              child: Icon(
                icon,
                color: name == 'Keluar' ? dangerColor : mono1Color,
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              name,
              style: mono1TextStyle.copyWith(
                fontSize: 14,
                color: name == 'Keluar' ? dangerColor : mono1Color,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              dataProfile(),
              Divider(
                color: mono3Color,
                thickness: 0.5,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Akun',
                      style: mono1TextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    content(
                      icon: Icons.campaign_outlined,
                      name: 'Pengumuman',
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/update-password-page');
                      },
                      child: content(
                        icon: Icons.lock_outline,
                        name: 'Ubah Sandi',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Lainnya',
                      style: mono1TextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    content(
                      icon: Icons.live_help_outlined,
                      name: 'Bantuan',
                    ),
                    content(
                      icon: Icons.info_outline,
                      name: 'Tentang Aplikasi',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Login',
                      style: mono1TextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    content(
                      icon: Icons.switch_account_outlined,
                      name: 'Ganti Akun',
                    ),
                    content(
                      icon: Icons.logout_outlined,
                      name: 'Keluar',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
