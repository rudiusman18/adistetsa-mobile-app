import 'package:adistetsa/models/ruangan_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class DetailPeminjamanRuangPage extends StatefulWidget {
  @override
  State<DetailPeminjamanRuangPage> createState() =>
      _DetailPeminjamanRuangPageState();
}

bool isAnswer = false;
String valueAcc = '';
bool isLoading = false;

class _DetailPeminjamanRuangPageState extends State<DetailPeminjamanRuangPage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    RuanganModel ruanganModel = provider.ruangan;

    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Detail Peminjaman Ruang',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        leading: IconButton(
          onPressed: () async {
            setState(() {
              valueAcc = '';
              isAnswer = false;
            });
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono2Color,
        ),
        iconTheme: IconThemeData(
          color: mono1Color,
        ),
      );
    }

    confirmAccept() async {
      return showDialog(
        context: context,
        builder: (BuildContext modalAcceptContext) {
          return Dialog(
            backgroundColor: mono6Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              width: 305,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Text(
                          'Konfirmasi',
                          style: mono1TextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/cancel_button.png',
                            width: 14,
                            height: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Apakah anda yakin untuk menyetujui peminjaman?',
                    style: mono1TextStyle.copyWith(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isLoading == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 46,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: mono3Color,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Batal',
                                  style: mono6TextStyle.copyWith(
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 120,
                              height: 46,
                              child: TextButton(
                                onPressed: () async {
                                  Navigator.pop(modalAcceptContext);
                                  confirmAccept();
                                  setState(() {
                                    isLoading = true;
                                  });
                                  if (await Services()
                                      .terimaPengajuanRuanganSarpas(
                                          id: '${ruanganModel.iD}')) {
                                    setState(() {
                                      valueAcc = 'Diterima';
                                      isAnswer = true;
                                    });
                                  } else {
                                    setState(() {
                                      isAnswer = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            backgroundColor: dangerColor,
                                            content: Text(
                                              'Gagal Setuju Peminjaman Barang',
                                              textAlign: TextAlign.center,
                                            )));
                                  }
                                  setState(() {
                                    isLoading = false;
                                    print(isLoading);
                                  });
                                  Navigator.pop(context);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: successColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Setuju',
                                  style: mono6TextStyle.copyWith(
                                    fontWeight: semiBold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          alignment: Alignment.center,
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            color: m1Color,
                            strokeWidth: 2,
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      );
    }

    confirmDecline() async {
      return showDialog(
        context: context,
        builder: (BuildContext modalDeclineContext) {
          return Dialog(
            backgroundColor: mono6Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              width: 305,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Text(
                          'Konfirmasi',
                          style: mono1TextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/cancel_button.png',
                            width: 14,
                            height: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Apakah anda yakin untuk menolak peminjaman?',
                    style: mono1TextStyle.copyWith(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isLoading == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 46,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: mono3Color,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Batal',
                                  style: mono6TextStyle.copyWith(
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 120,
                              height: 46,
                              child: TextButton(
                                onPressed: () async {
                                  Navigator.pop(modalDeclineContext);
                                  confirmDecline();
                                  setState(() {
                                    isLoading = true;
                                  });
                                  if (await Services()
                                      .tolakPengajuanRuanganSarpas(
                                          id: '${ruanganModel.iD}')) {
                                    setState(() {
                                      valueAcc = 'Ditolak';
                                      isAnswer = true;
                                    });
                                  } else {
                                    setState(() {
                                      isAnswer = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            backgroundColor: dangerColor,
                                            content: Text(
                                              'Gagal Setuju Peminjaman Barang',
                                              textAlign: TextAlign.center,
                                            )));
                                  }
                                  setState(() {
                                    isLoading = false;
                                    print(isLoading);
                                  });
                                  Navigator.pop(context);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: dangerColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Tolak',
                                  style: mono6TextStyle.copyWith(
                                    fontWeight: semiBold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          alignment: Alignment.center,
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            color: m1Color,
                            strokeWidth: 2,
                          ),
                        ),
                ],
              ),
            ),
          );
        },
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
                          : value == 'Sudah Dikembalikan' ||
                                  value == 'Disetujui'
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
              '${ruanganModel.pENGGUNA}',
              style: mono1TextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            itemInfoPeminjam(
              teks: 'Kegiatan',
              value: '${ruanganModel.kEGIATAN}',
            ),
            itemInfoPeminjam(
              teks: 'Tanggal Pengajuan',
              value: '${ruanganModel.tANGGALPENGAJUAN}',
            ),
            itemInfoPeminjam(
              teks: 'Tanggal Penggunaan',
              value: '${ruanganModel.tANGGALPEMAKAIAN}',
            ),
            itemInfoPeminjam(
              teks: 'Jam Pemakaian',
              value: '${ruanganModel.jAMPENGGUNAAN}',
            ),
            itemInfoPeminjam(
              teks: 'Jam Berakhir',
              value: '${ruanganModel.jAMBERAKHIR}',
            ),
            itemInfoPeminjam(
              teks: 'No HP',
              value: '${ruanganModel.nOHP}',
            ),
            itemInfoPeminjam(
              teks: 'Keterangan',
              value: '${ruanganModel.kETERANGAN}',
            ),
            ruanganModel.tANDATANGAN != null
                ? itemInfoPeminjam(
                    teks: 'File TTD Pengajuan',
                    value: '${ruanganModel.tANDATANGAN!.split('/')[5]}',
                  )
                : Container(),
            itemInfoPeminjam(
              teks: 'Status Pengajuan',
              value: valueAcc == '' ? '${ruanganModel.sTATUS}' : valueAcc,
            ),
          ],
        ),
      );
    }

    TableRow contentTable({
      required int no,
      required String namaBarang,
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
                vertical: 2,
              ),
              child: Text(
                namaBarang,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Ruangan',
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
                              'Nama Ruangan',
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
            children: [
              contentTable(
                no: 1,
                namaBarang: '${ruanganModel.rUANGAN}',
              ),
            ]),
      );
    }

    Widget buttonKembali() {
      return Container(
        margin: EdgeInsets.only(
          left: 45,
          right: 46,
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
              color: mono3Color,
              width: 2,
            ),
            backgroundColor: mono3Color,
          ),
          onPressed: () {
            setState(() {
              valueAcc = '';
              isAnswer = false;
            });
            Navigator.pop(context);
          },
          child: Text(
            'Kembali',
            style: mono6TextStyle.copyWith(
              fontWeight: bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    Widget buttonSubmit() {
      return Container(
        margin: EdgeInsets.only(
          left: 45,
          right: 46,
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
              color: h1Color,
              width: 2,
            ),
            backgroundColor: h1Color,
          ),
          onPressed: () {
            confirmAccept();
          },
          child: Text(
            'Setuju',
            style: mono6TextStyle.copyWith(
              fontWeight: bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    Widget buttonTolak() {
      return Container(
          margin: EdgeInsets.only(
            left: 45,
            right: 46,
            bottom: 20,
          ),
          height: 46,
          width: double.infinity,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(
                  width: 2,
                  color: dangerColor,
                ),
              ),
              onPressed: () {
                confirmDecline();
              },
              child: Text(
                'Tolak',
                style: dangerTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 16,
                ),
              )));
    }

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          valueAcc = '';
          isAnswer = false;
        });
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: mono6Color,
        appBar: header(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                infoPeminjam(),
                tableHeader(),
                tabelPeminjam(),
                isAnswer == false ? buttonSubmit() : buttonKembali(),
                isAnswer == false ? buttonTolak() : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
