import 'package:adistetsa/models/guru_model.dart';
import 'package:adistetsa/models/karyawan_model.dart';
import 'package:adistetsa/models/kompetensi_model.dart';
import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/models/siswa_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatelessWidget {
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
        : role == 'Staf Perpustakaan' || role == 'Staf Sarpras'
            ? '${guruModel.nAMALENGKAP}'
            : role == 'Karyawan'
                ? '${karyawanModel.nAMALENGKAP}'
                : role == 'Siswa'
                    ? '${siswaModel.nAMA}'
                    : role == 'Pelatih'
                        ? provider.jadwalEkskul.first.pELATIH
                        : role == 'Staf BK'
                            ? '${guruModel.nAMALENGKAP}'
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
                    : role == 'Pelatih'
                        ? rolesModel.name
                        : '';
    var _spesialisParameter = role == 'Guru'
        ? 'Kompetensi'
        : role == 'Staf Perpustakaan' ||
                role == 'Staf Sarpras' ||
                role == 'Staf BK'
            ? 'Bidang'
            : role == 'Karyawan'
                ? 'Jenis PTK'
                : role == 'Siswa'
                    ? 'Kelas'
                    : role == 'Pelatih'
                        ? 'Ekstrakurikuler'
                        : '';
    var _parameter = role == 'Staf Perpustakaan'
        ? 'Perpustakaan'
        : role == 'Staf Sarpras'
            ? 'Sarana Prasarana'
            : role == 'Karyawan'
                ? '${karyawanModel.jENISPTK}'
                : role == 'Siswa'
                    ? 'Kelas'
                    : role == 'Pelatih'
                        ? provider.jadwalEkskul
                            .map((e) => e.eKSKUL)
                            .toList()
                            .toString()
                            .replaceAll('[', '')
                            .replaceAll(']', '')
                        : role == 'Staf BK'
                            ? 'Bimbingan Konseling'
                            : '';
    return Container(
      decoration: BoxDecoration(
          color: m2Color,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              m5Color,
              m4Color,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 4,
            )
          ]),
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/home/persegi profile.png',
                  width: 146.57,
                ),
                Text(
                  role == 'Staf Perpustakaan' ||
                          role == 'Staf Sarpras' ||
                          role == 'Staf BK'
                      ? 'Staf'
                      : role == 'Pelatih'
                          ? ''
                          : '$role',
                  style: mono6TextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$_nama',
                        style: mono6TextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '$_noInduk',
                        style: mono6TextStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '$_spesialisParameter',
                        style: mono6TextStyle.copyWith(
                          fontWeight: regular,
                          fontSize: 10,
                        ),
                      ),
                      rolesModel.name == 'Guru'
                          ? FutureBuilder(
                              future: Services().getKompetensiGuru(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  List<KompetensiModel> data = snapshot.data;
                                  return data.isEmpty
                                      ? Text(
                                          'Tidak ada data',
                                          style: mono6TextStyle.copyWith(
                                            fontWeight: semiBold,
                                            color: mono5Color,
                                          ),
                                        )
                                      : Column(
                                          children: data.map((item) {
                                          return Text(
                                            item.bIDANGSTUDI.toString(),
                                            style: mono6TextStyle.copyWith(
                                              fontWeight: semiBold,
                                              color: mono5Color,
                                            ),
                                          );
                                        }).toList());
                                } else {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 180,
                                        child: LinearProgressIndicator(
                                          color: Colors.white,
                                          minHeight: 2,
                                          backgroundColor: m1Color,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              },
                            )
                          : Text(
                              '$_parameter',
                              style: mono6TextStyle.copyWith(
                                fontWeight: semiBold,
                                fontSize: 18,
                              ),
                            ),
                    ],
                  ),
                ),
                Opacity(
                  opacity: 0.15,
                  child: Image.asset(
                    'assets/logo sekolah.png',
                    width: 83.14,
                    height: 97,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
