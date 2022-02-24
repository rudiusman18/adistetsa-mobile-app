import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';

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
                    isLoading = true;
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
          onPressed: () {},
          child: Text(
            'Simpan',
            style: mono6TextStyle.copyWith(
              fontWeight: bold,
              fontSize: 16,
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
              name: 'Syauqi Babi',
              nis: '123123123',
              kelas: 'XII-IPA A',
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
                      'Bola Basket',
                      style: mono1TextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  listItem(
                    name: 'Tahun',
                    value: Text(
                      '2022/2023',
                      style: mono1TextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  listItem(
                    name: 'Tanggal',
                    value: Text(
                      '2022 - 02 - 22',
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
                        'Non Aktif',
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
