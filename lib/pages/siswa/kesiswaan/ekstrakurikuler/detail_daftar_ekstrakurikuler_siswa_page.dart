import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class DetailDaftarEkstrakurikulerSiswaPage extends StatefulWidget {
  const DetailDaftarEkstrakurikulerSiswaPage({Key? key}) : super(key: key);

  @override
  _DetailDaftarEkstrakurikulerSiswaPageState createState() =>
      _DetailDaftarEkstrakurikulerSiswaPageState();
}

class _DetailDaftarEkstrakurikulerSiswaPageState
    extends State<DetailDaftarEkstrakurikulerSiswaPage> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget detaildaftarekstrakurikulerHeader() {
      return AppBar(
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        centerTitle: true,
        title: Text(
          'Detail Daftar Ekstrakurikuler',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono1Color,
        ),
      );
    }

    Widget itemBody({
      required String hint,
      required String data,
    }) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$hint',
              style: mono2TextStyle.copyWith(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: mono4Color,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: mono3Color,
                    width: 2,
                  )),
              child: Text(
                '$data',
                style: mono2TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSubmit() {
      return Container(
        margin: EdgeInsets.only(
          left: 21,
          right: 18,
          top: 24,
          bottom: 40,
        ),
        width: double.infinity,
        height: 46,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: m2Color,
              primary: m2Color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          child: Text(
            'Batalkan',
            style: mono6TextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: detaildaftarekstrakurikulerHeader(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              itemBody(
                hint: 'Kelas Siswa',
                data: 'Garry Buchanan  - X IPA - 2020/2021 A',
              ),
              itemBody(
                hint: 'Eskul',
                data: 'Bola Basket',
              ),
              itemBody(
                hint: 'Tahun',
                data: '2020/2021',
              ),
              itemBody(
                hint: 'Tanggal',
                data: '2022-02-22',
              ),
              buttonSubmit(),
            ],
          ),
        ),
      ),
    );
  }
}
