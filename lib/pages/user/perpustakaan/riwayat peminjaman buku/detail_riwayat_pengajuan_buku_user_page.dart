import 'package:adistetsa/models/pengajuanpeminjaman_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class DetailRiwayatPengajuanBukuUserPage extends StatefulWidget {
  DetailRiwayatPengajuanBukuUserPage({Key? key}) : super(key: key);

  @override
  State<DetailRiwayatPengajuanBukuUserPage> createState() =>
      _DetailRiwayatPengajuanBukuUserPageState();
}

class _DetailRiwayatPengajuanBukuUserPageState
    extends State<DetailRiwayatPengajuanBukuUserPage> {
  String status = 'Sedang Dipinjam';
  @override
  Widget build(BuildContext context) {
    var index = 0;
    Providers provider = Provider.of<Providers>(context);
    PengajuanPeminjamanModel pengajuanPeminjamanModel =
        provider.pengajuanPeminjaman;

    print(pengajuanPeminjamanModel.bUKU);

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
            Expanded(
              child: Text(
                value,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                  color: value == 'Sedang Dipinjam'
                    ? warningColor
                    : value == 'Pengajuan' || value == 'Diajukan'
                        ? infoColor
                        : value == 'Sudah Dikembalikan'
                            ? successColor
                            : value == 'Tenggat'
                                ? m1Color
                                : value == 'Hilang'
                                    ? dangerColor
                                    : value == 'Ditolak'
                                        ? dangerColor
                                        : mono1Color,
                ),
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
              value: '${pengajuanPeminjamanModel.tANGGALPENGAJUAN}',
            ),
            itemInfoPeminjam(
              teks: 'Kategori',
              value: '${pengajuanPeminjamanModel.jANGKAPEMINJAMAN}',
            ),
            pengajuanPeminjamanModel.fILETTDPENGAJUAN != null
                ? itemInfoPeminjam(
                    teks: 'File Pengajuan',
                    value: '${pengajuanPeminjamanModel.fILETTDPENGAJUAN!.split('/')[5]}',
                  )
                : Container(),
            itemInfoPeminjam(
              teks: 'Status Pengajuan',
              value: '${pengajuanPeminjamanModel.sTATUSPENGAJUAN}',
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

    Widget tableHeader() {
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
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget tabelPeminjam() {
      return Container(
        padding: EdgeInsets.only(
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
          children: pengajuanPeminjamanModel.bUKU!.map((book) {
            index++;
            return contentTable(
              no: index,
              mataPelajaran: book.split('-')[1].toString(),
              registrasi: book.split('-')[0].toString(),
            );
          }).toList(),
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
              tableHeader(),
              tabelPeminjam(),
            ],
          ),
        ),
      ),
    );
  }
}
