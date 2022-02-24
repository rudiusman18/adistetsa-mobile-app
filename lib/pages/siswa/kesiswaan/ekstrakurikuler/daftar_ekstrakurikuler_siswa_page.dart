import 'package:adistetsa/models/katalogekskul_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class DaftarEkstrakurikulerSiswaPage extends StatefulWidget {
  const DaftarEkstrakurikulerSiswaPage({Key? key}) : super(key: key);

  @override
  _DaftarEkstrakurikulerSiswaPageState createState() =>
      _DaftarEkstrakurikulerSiswaPageState();
}

class _DaftarEkstrakurikulerSiswaPageState
    extends State<DaftarEkstrakurikulerSiswaPage> {
  // Note: get date
  String tanggalPendaftaran = DateTime.now().toString().split(' ')[0];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    KatalogEkskulModel katalogEkskulModel = provider.katalogEkskul;
    PreferredSizeWidget daftarekstrakurikulerHeader() {
      return AppBar(
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        centerTitle: true,
        title: Text(
          'Daftar Ekstrakurikuler',
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

    Widget inputTanggal() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal',
              style: mono2TextStyle.copyWith(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              height: 44,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: mono2Color,
                      width: 1,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tanggalPendaftaran,
                      style: mono2TextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      color: mono2Color,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSubmit() {
      return Container(
        height: 46,
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 21,
          right: 18,
        ),
        child: TextButton(
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            if (await provider.daftarEkstrakurikuler(
                id: katalogEkskulModel.iD.toString(),
                tanggalPengajuan: tanggalPendaftaran)) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: successColor,
                  content: Text(
                    'Berhasil mengajukan ekstrakurikuler',
                    textAlign: TextAlign.center,
                  )));
              Navigator.pop(context);
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: dangerColor,
                  content: Text(
                    '${provider.errorMessage}'
                        .replaceAll('Exception: ["', '')
                        .replaceAll('"]', ''),
                    textAlign: TextAlign.center,
                  )));
            }
            setState(() {
              isLoading = false;
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: m2Color,
            primary: m2Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: isLoading == false
              ? Text(
                  'Ajukan Ekstrakurikuler',
                  style: mono6TextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                )
              : Container(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    color: mono6Color,
                    strokeWidth: 2,
                  ),
                ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: daftarekstrakurikulerHeader(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            inputTanggal(),
            buttonSubmit(),
          ],
        ),
      ),
    );
  }
}
