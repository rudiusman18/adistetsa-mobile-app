import 'package:adistetsa/models/peminjambarang_model.dart';
import 'package:adistetsa/models/peminjamruangan_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class DetailPengajuanPeminjamanPage extends StatefulWidget {
  DetailPengajuanPeminjamanPage({Key? key}) : super(key: key);

  @override
  State<DetailPengajuanPeminjamanPage> createState() =>
      _DetailPengajuanPeminjamanPageState();
}

class _DetailPengajuanPeminjamanPageState
    extends State<DetailPengajuanPeminjamanPage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    PeminjamBarangModel peminjamBarangModel = provider.peminjamanBarang;
    PeminjamRuanganModel peminjamRuanganModel = provider.peminjamanRuangan;

    String detailRuangan = provider.detailRuang;
    var index = 0;

    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Detail Pengajuan Peminjaman',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detailRuangan == 'Ruang'
                  ? '${peminjamRuanganModel.pENGGUNA}'
                  : '${peminjamBarangModel.nAMAPEMINJAM}',
              style: mono1TextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            itemInfoPeminjam(
              teks: 'No HP',
              value: detailRuangan == 'Ruang'
                  ? '${peminjamRuanganModel.nOHP}'
                  : '${peminjamBarangModel.nOTELEPON}',
            ),
            itemInfoPeminjam(
              teks: 'Tanggal Pengajuan',
              value: detailRuangan == 'Ruang'
                  ? '${peminjamRuanganModel.tANGGALPENGAJUAN}'
                  : '${peminjamBarangModel.tANGGALPENGGUNAAN}',
            ),
            detailRuangan == 'Ruang'
                ? itemInfoPeminjam(
                    teks: 'Tanggal Pemakaian',
                    value: '${peminjamRuanganModel.tANGGALPEMAKAIAN}',
                  )
                : Container(),
            detailRuangan == 'Ruang'
                ? itemInfoPeminjam(
                    teks: 'Jam Pemakaian',
                    value: '${peminjamRuanganModel.jAMPENGGUNAAN}',
                  )
                : Container(),
            detailRuangan == 'Ruang'
                ? itemInfoPeminjam(
                    teks: 'Jam Berakhir',
                    value: '${peminjamRuanganModel.jAMBERAKHIR}',
                  )
                : Container(),
            itemInfoPeminjam(
              teks: 'Tanggal Pengembalian',
              value: detailRuangan == 'Ruang'
                  ? '${peminjamRuanganModel.tANGGALBERAKHIR}'
                  : '${peminjamBarangModel.tANGGALPENGEMBALIAN}',
            ),
            detailRuangan == 'Ruang'
                ? itemInfoPeminjam(
                    teks: 'File Pengajuan',
                    value: '${peminjamRuanganModel.tANDATANGAN!.split('/')[5]}')
                : Container(),
            itemInfoPeminjam(
                teks: 'Keterangan',
                value: detailRuangan == 'Ruang'
                    ? '${peminjamRuanganModel.kETERANGAN}'
                    : '${peminjamBarangModel.kETERANGAN}'),
            detailRuangan == 'Ruang'
                ? itemInfoPeminjam(
                    teks: 'Jenis Peminjaman',
                    value: '${peminjamRuanganModel.jENISPEMINJAMAN}')
                : Container(),
            itemInfoPeminjam(
              teks: 'Status Pengajuan',
              value: detailRuangan == 'Ruang'
                  ? '${peminjamRuanganModel.sTATUS}'
                  : '${peminjamBarangModel.sTATUSPENGAJUAN}',
            ),
          ],
        ),
      );
    }

    TableRow contentTable({
      required int no,
      required String nama,
      required String kode,
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
                nama,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ),
           detailRuangan == 'Barang'
                          ?Container(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    kode,
                    style: mono1TextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ) : Container(),
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
                'Pengajuan Peminjaman',
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
                bottom: 10,
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
                              'Barang',
                              style: mono6TextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      detailRuangan == 'Barang'
                          ? Container(
                              height: 30,
                              color: m4Color,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Kode Barang',
                                    style: mono6TextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
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
            children: detailRuangan == 'Barang'
                ? peminjamBarangModel.aLAT!.map((book) {
                    index++;
                    return contentTable(
                      no: index,
                      nama:
                          '${peminjamBarangModel.aLAT![index - 1].nAMA!.split('-')[0]}',
                      kode:
                          '${peminjamBarangModel.aLAT![index - 1].iD} - ${peminjamBarangModel.aLAT![index - 1].nAMA!.split('-')[1]}',
                    );
                  }).toList()
                : [
                    contentTable(
                      no: 1,
                      nama: '${peminjamRuanganModel.rUANGAN}',
                      kode: '0',
                    )
                  ]),
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
