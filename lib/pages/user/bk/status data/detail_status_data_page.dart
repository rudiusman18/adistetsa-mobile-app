import 'package:adistetsa/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class DetailStatusDataPage extends StatefulWidget {
  @override
  _DetailStatusDataPageState createState() => _DetailStatusDataPageState();
}

class _DetailStatusDataPageState extends State<DetailStatusDataPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Detail haloBK',
          style: mono1TextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono2Color,
        ),
      );
    }

    Widget profile({required String name, required String role}) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 20),
        width: double.infinity,
        color: m2Color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: mono6TextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Text(
              role,
              style: mono6TextStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }

    Widget item({required String name, required String value}) {
      return Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            width: 110,
            child: Text(
              name,
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                value,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                  color: value == 'Diajukan'
                      ? infoColor
                      : value == 'Ditolak'
                          ? dangerColor
                          : value == 'Diterima'
                              ? successColor
                              : value == 'Selesai'
                                  ? p1Color
                                  : value == 'Telah Mengisi Feedback'
                                      ? warningColor
                                      : mono1Color,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSubmit({required String name}) {
      return Container(
        margin: EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        height: 46,
        width: double.infinity,
        child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: BorderSide(
                color: m2Color,
                width: 2,
              ),
              backgroundColor: m2Color,
            ),
            onPressed: () {},
            child: isLoading == false
                ? Text(
                    name,
                    style: mono6TextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  )
                : Container(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: mono6Color,
                    ),
                  )),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: header(),
      body: Column(
        children: [
          profile(
            name: 'Adam Anjing',
            role: 'Pengacara (Pengangguran Banyak Acara)',
          ),
          Expanded(
            child: ListView(
              children: [
                item(
                  name: 'Nama Siswa',
                  value: 'Annabelle',
                ),
                item(
                  name: 'Kelas',
                  value: 'XII IPA A',
                ),
                item(
                  name: 'NISN',
                  value: '18029282739298',
                ),
                item(
                  name: 'NIS',
                  value: '17728192847362',
                ),
                item(
                  name: 'Tanggal',
                  value: '2022-02-13',
                ),
                item(
                  name: 'Jam',
                  value: '09:00 - 12:00 WIB',
                ),
                item(
                  name: 'Jenis Masalah',
                  value: 'Belajar',
                ),
                item(
                  name: 'Status Pengajuan',
                  value: '${provider.status}',
                ),
                provider.status == 'Diajukan'
                    ? buttonSubmit(name: 'Batalkan')
                    : provider.status == 'Diterima'
                        ? buttonSubmit(name: 'Konsultasi HaloBk')
                        : provider.status == 'Selesai'
                            ? buttonSubmit(name: 'Berikan Feedback')
                            : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
