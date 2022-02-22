import 'package:adistetsa/models/presensisiswa_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPresensiPage extends StatefulWidget {
  @override
  _EditPresensiPageState createState() => _EditPresensiPageState();
}

class _EditPresensiPageState extends State<EditPresensiPage> {
  int selectedIndex = -1;
  String keterangan = '';
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    PresensiSiswaModel presensiSiswaModel = provider.detailPresensiSiswa;

    handleSimpanPresensi() async {
      if (await provider.presensiSiswa(
          id: presensiSiswaModel.iD.toString(),
          keterangan: keterangan,
          nis: presensiSiswaModel.nIS.toString())) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: successColor,
            content: Text(
              '${provider.errorMessage}',
              textAlign: TextAlign.center,
            )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: dangerColor,
            content: Text(
              '${provider.errorMessage}',
              textAlign: TextAlign.center,
            )));
      }
    }

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: mono6Color,
        automaticallyImplyLeading: false,
        centerTitle: true,
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
          'Edit Presensi',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget nameCard({required String name, required String nis}) {
      return Container(
        color: m4Color,
        padding: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: mono5TextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Text(
              nis,
              style: mono5TextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ],
        ),
      );
    }

    Widget option({required int index, required String name}) {
      return GestureDetector(
        onTap: () {
          setState(() {
            keterangan = name;
            print(keterangan);
            selectedIndex = index;
          });
        },
        child: Row(
          children: [
            Container(
              width: 135,
              padding: EdgeInsets.all(12),
              decoration: selectedIndex == index
                  ? BoxDecoration(
                      color: m5Color.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(5),
                    )
                  : BoxDecoration(),
              margin: EdgeInsets.only(
                top: 30,
              ),
              child: Row(
                children: [
                  Image.asset(
                    selectedIndex == index
                        ? 'assets/selected pilih keterangan.png'
                        : 'assets/unselected pilih keterangan.png',
                    width: 14,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    name,
                    style: mono1TextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget submitButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 216,
            height: 46,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: m2Color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              onPressed: () {
                handleSimpanPresensi();
              },
              child: Text(
                'Simpan',
                style: mono6TextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
        backgroundColor: mono6Color,
        appBar: header(),
        body: Column(
          children: [
            nameCard(
              name: '${presensiSiswaModel.nAMA}',
              nis: '${presensiSiswaModel.nIS}',
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 18,
                  left: 16,
                  right: 16,
                ),
                child: ListView(
                  children: [
                    Text(
                      'Pilih Keterangan',
                      style: mono1TextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                    ),
                    for (var i = 0; i < 4; i++)
                      option(
                        index: i,
                        name: i == 0
                            ? 'Hadir'
                            : i == 1
                                ? 'Izin'
                                : i == 2
                                    ? 'Sakit'
                                    : i == 3
                                        ? 'Tanpa Keterangan'
                                        : '',
                      ),
                    SizedBox(
                      height: 100,
                    ),
                    selectedIndex != -1 ? submitButton() : SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
