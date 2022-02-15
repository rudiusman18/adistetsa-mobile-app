import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class DetailRiwayatPeminjamanBukuUserPage extends StatefulWidget {
  DetailRiwayatPeminjamanBukuUserPage({Key? key}) : super(key: key);

  @override
  State<DetailRiwayatPeminjamanBukuUserPage> createState() =>
      _DetailRiwayatPeminjamanBukuUserPageState();
}

class _DetailRiwayatPeminjamanBukuUserPageState
    extends State<DetailRiwayatPeminjamanBukuUserPage> {
  String status = 'Sedang Dipinjam';
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Detail Peminjaman',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        iconTheme: IconThemeData(
          color: mono1Color,
        ),
      );
    }

    Widget itemInfoPeminjam({required String teks, required String value}) {
      return Container(
        padding: EdgeInsets.only(
          bottom: 10,
        ),
        margin: EdgeInsets.only(
          bottom: 6,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: mono3Color,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 150,
              child: Text(
                teks,
                style: mono1TextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 12,
                ),
              ),
            ),
            Text(
              value,
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                color: value == 'Sedang Dipinjam'
                    ? warningColor
                    : value == 'Diajukan'
                        ? infoColor
                        : value == 'Selesai'
                            ? successColor
                            : value == 'Tenggat'
                                ? m1Color
                                : mono1Color,
              ),
            ),
          ],
        ),
      );
    }

    Widget infoPeminjam() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 27,
        ),
        child: Column(
          children: [
            itemInfoPeminjam(
              teks: 'Tanggal Pengajuan',
              value: '2022-01-22',
            ),
            itemInfoPeminjam(
              teks: 'Tanggal Pengembalian',
              value: '2023-01-28',
            ),
            itemInfoPeminjam(
              teks: 'Kategori',
              value: 'Jangka Panjang',
            ),
            itemInfoPeminjam(
              teks: 'File Pengajuan',
              value: 'ttdku.pdf',
            ),
            itemInfoPeminjam(
              teks: 'Status Pengajuan',
              value: 'Diajukan',
            ),
          ],
        ),
      );
    }

    TableRow contentTable({
      required int no,
      required String mataPelajaran,
      required String registrasi,
    }) {
      return TableRow(
        children: [
          Container(
            child: Text(
              no.toString(),
              style: mono1TextStyle.copyWith(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2,
              ),
              child: Text(
                mataPelajaran,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    registrasi,
                    style: mono1TextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget tabelPeminjam() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Daftar Buku',
                style: mono1TextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 10,
                left: 26,
                right: 27,
                bottom: 20,
              ),
              child: Table(
                border: TableBorder.all(
                  color: mono6Color,
                ),
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(40),
                  1: FlexColumnWidth(140),
                  2: FixedColumnWidth(140),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: [
                  // Table Heading
                  TableRow(
                    children: [
                      Container(
                        height: 30,
                        color: m4Color,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No.',
                              style: mono6TextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        color: m4Color,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Mata Pelajaran',
                              style: mono6TextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        color: m4Color,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Registrasi',
                              style: mono6TextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  contentTable(
                    no: 1,
                    mataPelajaran:
                        'Bahasa Indonesia Bahasa Indonesia Bahasa Indonesia Bahasa Indonesia Bahasa Indonesia Bahasa Indonesia Bahasa Indonesia Bahasa Indonesia',
                    registrasi: '123456',
                  ),
                  contentTable(
                    no: 2,
                    mataPelajaran: 'Fisika',
                    registrasi: '12312',
                  ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              infoPeminjam(),
              tabelPeminjam(),
            ],
          ),
        ),
      ),
    );
  }
}
