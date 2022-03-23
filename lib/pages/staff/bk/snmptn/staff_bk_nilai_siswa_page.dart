import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class StaffBkNilaiSiswaPage extends StatefulWidget {
  @override
  _StaffBkNilaiSiswaPageState createState() => _StaffBkNilaiSiswaPageState();
}

class _StaffBkNilaiSiswaPageState extends State<StaffBkNilaiSiswaPage> {
  bool flag1 = false;
  Object? value1Item;
  String filterJurusan = '';
  String filterKelas = '';

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        title: Text(
          'List Nilai Siswa',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
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
        automaticallyImplyLeading: false,
        centerTitle: true,
      );
    }

    Widget dropdownList1({required String hint, required List data}) {
      return Container(
          height: 24,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          margin: EdgeInsets.symmetric(horizontal: 6),
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
                    print(value);
                    value1Item = value;
                    filterJurusan = 'JURUSAN=$value';
                    flag1 = true;
                  });
                },
              ),
            ),
          ));
    }

    Widget mapelPeminatan({required String name}) {
      return Container(
        child: Text('data'),
      );
    }

    Widget filter() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Row(
              children: [
                // NOTE: ini adalah button reset yang hanya akan muncul jika salah satu dropdown dipilih
                value1Item != null
                    ? GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                            value1Item = null;

                            filterJurusan = '';
                            filterKelas = '';
                            flag1 = false;
                          });

                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Container(
                          height: 24,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: m5Color,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.restart_alt,
                                color: mono6Color,
                                size: 15,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'reset',
                                style: mono6TextStyle.copyWith(
                                  fontWeight: semiBold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                dropdownList1(
                  hint: 'Jurusan',
                  data: [
                    'IPA',
                    'IPS',
                    'Bahasa',
                  ],
                ),
                mapelPeminatan(name: 'asw'),
              ],
            ),
          ),
        ),
      );
    }

    Widget listItem(
        {required String name, required String kelas, required String url}) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: mono1TextStyle,
                    ),
                    Text(
                      kelas,
                      style: mono1TextStyle.copyWith(fontSize: 10),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: url == '' ? mono3Color : m5Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.file_download_outlined,
                        color: mono6Color,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Unduh',
                        style: mono6TextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Divider(
            thickness: 0.5,
            color: mono3Color,
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: header(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          filter(),
          Center(
            child: Text('Ini adalah halaman nilai siswa masih belum fix'),
          ),
        ],
      ),
    );
  }
}
