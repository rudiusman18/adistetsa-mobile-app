import 'package:adistetsa/models/guru_model.dart';
import 'package:adistetsa/models/karyawan_model.dart';
import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/models/siswa_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    RolesModel rolesModel = provider.role;
    GuruModel guruModel = provider.guru;
    KaryawanModel karyawanModel = provider.karyawan;
    SiswaModel siswaModel = provider.siswa;

    var role = rolesModel.name;
    var _nama = role == 'Guru'
        ? '${guruModel.nAMALENGKAP}'
        : role == 'Staf Perpustakaan' ||
                role == 'Staf Sarpras' ||
                role == 'Staf BK'
            ? '${guruModel.nAMALENGKAP}'
            : role == 'Karyawan'
                ? '${karyawanModel.nAMALENGKAP}'
                : role == 'Siswa'
                    ? '${siswaModel.nAMA}'
                    : '';
    var _noInduk = role == 'Guru'
        ? 'NIP ${guruModel.nIP}'
        : role == 'Staf Perpustakaan' ||
                role == 'Staf Sarpras' ||
                role == 'Staf BK'
            ? 'NIP ${guruModel.nIP}'
            : role == 'Karyawan'
                ? 'NIP ${karyawanModel.nIP}'
                : role == 'Siswa'
                    ? 'NIS ${siswaModel.nIS}'
                    : '';
    var _email = role == 'Guru'
        ? '${guruModel.eMAIL}'
        : role == 'Staf Perpustakaan' ||
                role == 'Staf Sarpras' ||
                role == 'Staf BK'
            ? '${guruModel.eMAIL}'
            : role == 'Karyawan'
                ? '${karyawanModel.eMAIL}'
                : role == 'Siswa'
                    ? '${siswaModel.eMAIL}'
                    : '';
    var _noHp = role == 'Guru'
        ? '${guruModel.hP}'
        : role == 'Staf Perpustakaan' ||
                role == 'Staf Sarpras' ||
                role == 'Staf BK'
            ? '${guruModel.hP}'
            : role == 'Karyawan'
                ? '${karyawanModel.hP}'
                : role == 'Siswa'
                    ? '${siswaModel.hP}'
                    : '';
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

    confirmLogout() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: mono6Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              width: 305,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Text(
                          'Notifikasi',
                          style: mono1TextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/cancel_button.png',
                            width: 14,
                            height: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Apakah anda yakin?',
                    style: mono1TextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 46,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: mono3Color,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Batal',
                            style: mono6TextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 120,
                        height: 46,
                        child: TextButton(
                          onPressed: () async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            preferences.clear();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SplashScreen()),
                                (route) => false);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: dangerColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Keluar',
                            style: mono6TextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
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
                    _noInduk != ''
                        ? Text(
                            '$_noInduk',
                            style: mono2TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          )
                        : SizedBox(),
                    _nama != ''
                        ? Text(
                            '$_nama',
                            style: mono1TextStyle.copyWith(
                              fontSize: 14,
                            ),
                          )
                        : SizedBox(),
                    _email != ''
                        ? SizedBox(
                            height: 10,
                          )
                        : SizedBox(),
                    _email != ''
                        ? Text(
                            'Email',
                            style: mono2TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          )
                        : SizedBox(),
                    _email != ''
                        ? Text(
                            '$_email',
                            style: mono1TextStyle.copyWith(
                              fontSize: 14,
                            ),
                          )
                        : SizedBox(),
                    _noHp != ''
                        ? SizedBox(
                            height: 10,
                          )
                        : SizedBox(),
                    _noHp != ''
                        ? Text(
                            'Nomor HP',
                            style: mono2TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          )
                        : SizedBox(),
                    _noHp != ''
                        ? Text(
                            '$_noHp',
                            style: mono1TextStyle.copyWith(
                              fontSize: 14,
                            ),
                          )
                        : SizedBox(),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/roles-page', (route) => false);
                      },
                      child: content(
                        icon: Icons.switch_account_outlined,
                        name: 'Ganti Akun',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        confirmLogout();
                      },
                      child: content(
                        icon: Icons.logout_outlined,
                        name: 'Keluar',
                      ),
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
