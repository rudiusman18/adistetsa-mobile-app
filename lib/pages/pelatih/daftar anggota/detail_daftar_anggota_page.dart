import 'package:adistetsa/models/daftaranggotaekskul_model.dart';
import 'package:adistetsa/models/jadwalekskul_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailDaftarAnggotaPage extends StatefulWidget {
  @override
  _DetailDaftarAnggotaPageState createState() =>
      _DetailDaftarAnggotaPageState();
}

class _DetailDaftarAnggotaPageState extends State<DetailDaftarAnggotaPage> {
  bool flag1 = false;
  Object? value1Item;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    DaftarAnggotaEkskulModel daftarAnggotaEkskulModel = provider.daftarAnggota;
    List<JadwalEkskulModel> jadwalEkskulModel = provider.jadwalEkskul;

    PreferredSizeWidget header() {
      return AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: mono6Color,
        elevation: 0,
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
          'Detail Anggota',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget nameCard({
      required name,
      required nis,
      required kelas,
    }) {
      return Container(
        padding: EdgeInsets.only(top: 12, bottom: 14, left: 15, right: 15),
        color: m2Color,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: mono6TextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: nis,
                  style: mono6TextStyle.copyWith(
                    fontSize: 10,
                  ),
                  children: [
                    TextSpan(
                      text: ' - ',
                      style: mono6TextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                    TextSpan(
                      text: kelas,
                      style: mono6TextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      );
    }

    Widget listItem({required String name, required Widget value}) {
      return Container(
        margin: EdgeInsets.only(
          bottom: 25,
          left: 33,
          right: 33,
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              child: Text(
                name,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: semiBold,
                ),
              ),
            ),
            value,
          ],
        ),
      );
    }

    Widget dropdownList1({required String hint, required List data}) {
      return Container(
          height: 24,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: flag1 == true ? p1Color : mono3Color,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: GestureDetector(
              onLongPress: () async {
                setState(() {
                  isLoading = true;
                  flag1 = false;
                  value1Item = null;
                });
              },
              child: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: flag1 == true ? p1Color : mono2Color,
                ),
                hint: Text(
                  hint,
                  style: mono2TextStyle.copyWith(
                    color: flag1 == true ? p1Color : mono2Color,
                    fontWeight: regular,
                    fontSize: 10,
                  ),
                ),
                dropdownColor: mono6Color,
                elevation: 2,
                value: value1Item,
                items: data.map(
                  (value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: mono2TextStyle.copyWith(
                          color: value1Item == value ? p1Color : mono2Color,
                          fontWeight: regular,
                          fontSize: 10,
                        ),
                      ),
                    );
                  },
                ).toList(),
                onChanged: (value) async {
                  setState(() {
                    value1Item = value;

                    flag1 = true;
                  });
                },
              ),
            ),
          ));
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
              color: m2Color,
              width: 2,
            ),
            backgroundColor: m2Color,
          ),
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            if (await Services().terimaDaftarAnggota(
                id: daftarAnggotaEkskulModel.iD.toString(),
                status: value1Item.toString())) {
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: dangerColor,
                  content: Text(
                    'Gagal Simpan Detail Anggota',
                    textAlign: TextAlign.center,
                  )));
            }
            setState(() {
              isLoading = false;
            });
          },
          child: isLoading == false
              ? Text(
                  'Simpan',
                  style: mono6TextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16,
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
        appBar: header(),
        body: Column(
          children: [
            nameCard(
              name: '${daftarAnggotaEkskulModel.nAMA}',
              nis: '${daftarAnggotaEkskulModel.nIS}',
              kelas: '${daftarAnggotaEkskulModel.kELASSISWA}',
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  listItem(
                    name: 'Ekstrakurikuler',
                    value: Text(
                      '${jadwalEkskulModel.first.eKSKUL}',
                      style: mono1TextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  listItem(
                    name: 'Tahun',
                    value: Text(
                      '${jadwalEkskulModel.first.tAHUNAJARAN}',
                      style: mono1TextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  listItem(
                    name: 'Status',
                    value: dropdownList1(
                      hint: 'Status',
                      data: [
                        'Aktif',
                        'Nonaktif',
                      ],
                    ),
                  ),
                  buttonSubmit(),
                ],
              ),
            ),
          ],
        ));
  }
}
