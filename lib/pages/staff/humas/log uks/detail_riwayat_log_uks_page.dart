import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailRiwayatLogUKSPage extends StatefulWidget {
  @override
  State<DetailRiwayatLogUKSPage> createState() =>
      _DetailRiwayatLogUKSPageState();
}

class _DetailRiwayatLogUKSPageState extends State<DetailRiwayatLogUKSPage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    PreferredSizeWidget detailLogUKSHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Detail Log UKS',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono1Color,
        ),
      );
    }

    Widget listItem({required String name, required String value}) {
      return Container(
        margin: EdgeInsets.only(
          bottom: 25,
          left: 30,
          right: 30,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                name,
                style: mono1TextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: detailLogUKSHeader(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 15,
            ),
            width: double.infinity,
            color: m2Color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cerry Rans',
                  style: mono5TextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '${provider.roleRiwayatLogUks}',
                  style: mono5TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                provider.roleRiwayatLogUks == 'Siswa'
                    ? listItem(
                        name: 'Kelas',
                        value: 'XII IPA 2',
                      )
                    : Container(),
                provider.roleRiwayatLogUks == 'Siswa'
                    ? listItem(
                        name: 'NISN',
                        value: '69696969696969',
                      )
                    : Container(),
                listItem(
                  name: 'Tanggal',
                  value: '2022-02-13',
                ),
                listItem(
                  name: 'Jenis Pemeriksaan',
                  value: 'Hohohihe',
                ),
                listItem(
                  name: 'Obat diberikan',
                  value: 'Obat hohohihe',
                ),
                listItem(
                  name: 'Tindak Lanjut',
                  value: 'Tidak Lanjut',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
