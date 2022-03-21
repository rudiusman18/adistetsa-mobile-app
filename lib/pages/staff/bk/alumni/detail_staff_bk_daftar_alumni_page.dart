import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class DetailStaffBkDaftarAlumniPage extends StatefulWidget {
  @override
  _DetailStaffBkDaftarAlumniPageState createState() =>
      _DetailStaffBkDaftarAlumniPageState();
}

class _DetailStaffBkDaftarAlumniPageState
    extends State<DetailStaffBkDaftarAlumniPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mono6Color,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: mono1Color,
          ),
        ),
        title: Text(
          'Data Alumni',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
      );
    }

    Widget listItem({required String keterangan, required String value}) {
      return Container(
        margin: EdgeInsets.only(
          left: 25,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              keterangan,
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: mono2TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSubmit() {
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
            onPressed: () {
              Navigator.pushNamed(context, '/staff/bk/alumni/detail/edit');
            },
            child: Text(
              'Edit',
              style: mono6TextStyle.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            )),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: header(),
      body: ListView(
        children: [
          listItem(
            keterangan: 'Nama Siswa',
            value: 'Adam Babi',
          ),
          listItem(
            keterangan: 'Kelas',
            value: 'XII-IPA A',
          ),
          listItem(
            keterangan: 'NISN',
            value: '123456789',
          ),
          listItem(
            keterangan: 'NIS',
            value: '987654321',
          ),
          listItem(
            keterangan: 'Lulus Tahun Ajaran',
            value: '2020/2021',
          ),
          listItem(
            keterangan: 'Nama PTN, PTS/PTL',
            value: 'Universitas Gajah Mada',
          ),
          listItem(
            keterangan: 'Program Studi',
            value: 'Aktuaria',
          ),
          listItem(
            keterangan: 'Media Sosial',
            value: '@andis23_',
          ),
          listItem(
            keterangan: 'Email',
            value: '@anndiss23@gmail.com',
          ),
          listItem(
            keterangan: 'Alamat Rumah',
            value: 'Jl. Ijen jember',
          ),
          listItem(
            keterangan: 'Tempat Berkerja',
            value: '-',
          ),
          buttonSubmit(),
        ],
      ),
    );
  }
}
