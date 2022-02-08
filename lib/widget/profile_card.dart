import 'package:adistetsa/models/guru_model.dart';
import 'package:adistetsa/models/kompetensi_model.dart';
import 'package:adistetsa/models/role_model.dart';
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

    var role = rolesModel.name;
    var _nama = role == 'Guru' ? '${guruModel.nAMALENGKAP}' : '';
    var _noInduk = role == 'Guru' ? 'NIP ${guruModel.nIP}' : '';
    var _spesialisParameter = role == 'Guru' ? 'Kompetensi' : '';
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
                  '$role',
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
                Column(
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
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                List<KompetensiModel> data = snapshot.data;
                                return Column(
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
                            'Kurikulum',
                            style: mono6TextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 18,
                            ),
                          ),
                  ],
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