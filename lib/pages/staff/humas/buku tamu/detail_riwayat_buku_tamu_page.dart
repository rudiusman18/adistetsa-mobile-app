import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class DetailRiwayatBukuTamuPage extends StatefulWidget {
  @override
  State<DetailRiwayatBukuTamuPage> createState() =>
      _DetailRiwayatBukuTamuPageState();
}

class _DetailRiwayatBukuTamuPageState extends State<DetailRiwayatBukuTamuPage> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget detailBukuTamuHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Detail Buku Tamu',
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
      appBar: detailBukuTamuHeader(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
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
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listItem(
            name: 'Instansi Asal',
            value: 'XII IPA 2',
          ),
          listItem(
            name: 'Alamat',
            value: '69696969696969',
          ),
          listItem(
            name: 'Nomor HP',
            value: '2022-02-13',
          ),
          listItem(
            name: 'Hari, Tanggal',
            value: 'Hohohihe',
          ),
          listItem(
            name: 'Jam',
            value: 'Obat hohohihe',
          ),
          listItem(
            name: 'Keperluan',
            value: 'Tidak Lanjut',
          ),
        ],
      ),
    );
  }
}
