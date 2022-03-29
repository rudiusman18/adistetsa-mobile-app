import 'package:adistetsa/models/angketbk_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StaffBkAngketPage extends StatefulWidget {
  @override
  _StaffBkAngketPageState createState() => _StaffBkAngketPageState();
}

class _StaffBkAngketPageState extends State<StaffBkAngketPage> {
  bool isSearch = false;

  String urlSearch = '';

  bool isLoading = false;

  TextEditingController searchController = TextEditingController();
  bool flag1 = false;
  Object? value1Item;
  bool flag2 = false;
  Object? value2Item;
  String filterJurusan = '';
  String filterKelas = '';
  String url = '';

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);

    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceWebView: true,
          enableJavaScript: true,
        );
      } else {
        Navigator.pushNamed(context, '/error-page');
      }
    }

    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Angket ${provider.angketPilihanStaffBk}',
          style: mono1TextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono2Color,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearch = true;
              });
            },
            icon: Icon(Icons.search),
            color: mono2Color,
          ),
        ],
      );
    }

    PreferredSizeWidget searchAppbar() {
      return AppBar(
        backgroundColor: mono6Color,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () async {
            setState(() {
              searchController.clear();
              urlSearch = '';
              isSearch = false;
              isLoading = true;
            });
            if (provider.angketPilihanStaffBk == 'Lintas Minat') {
              await Services().getAngketLintasMinat();
            } else if (provider.angketPilihanStaffBk == 'Data Siswa') {
              await Services().getAngketDataSiswa();
            } else if (provider.angketPilihanStaffBk == 'Peminatan') {
              await Services().getAngketPeminatan();
            }
            setState(() {
              isLoading = false;
            });
          },
          child: Icon(
            Icons.arrow_back,
            color: mono1Color,
          ),
        ),
        title: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            isDense: true,
            border: InputBorder.none,
          ),
          onChanged: (newValue) async {
            setState(() {
              if (searchController.selection.start >
                  searchController.text.length) {
                searchController.selection = new TextSelection.fromPosition(
                    new TextPosition(offset: searchController.text.length));
                searchController.text = newValue.toString();
              }
              print(searchController.text);
              urlSearch = 'search=${searchController.text}';
              isLoading = true;
            });
            if (provider.angketPilihanStaffBk == 'Lintas Minat') {
              await Services().getAngketLintasMinat();
            } else if (provider.angketPilihanStaffBk == 'Data Siswa') {
              await Services().getAngketDataSiswa();
            } else if (provider.angketPilihanStaffBk == 'Peminatan') {
              await Services().getAngketPeminatan();
            }

            setState(() {
              isLoading = false;
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
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

    Widget dropdownList2({required String hint, required List data}) {
      return Container(
          height: 24,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: flag2 == true ? p1Color : mono3Color,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: GestureDetector(
              onLongPress: () async {
                setState(() {
                  isLoading = true;
                  flag2 = false;
                  value2Item = null;
                });
              },
              child: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: flag2 == true ? p1Color : mono2Color,
                ),
                hint: Text(
                  hint,
                  style: mono2TextStyle.copyWith(
                    color: flag2 == true ? p1Color : mono2Color,
                    fontWeight: regular,
                    fontSize: 10,
                  ),
                ),
                dropdownColor: mono6Color,
                elevation: 2,
                value: value2Item,
                items: data.map(
                  (value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: mono2TextStyle.copyWith(
                          color: value2Item == value ? p1Color : mono2Color,
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
                    value2Item = value;
                    filterKelas = '&KELAS=$value';
                    flag2 = true;
                  });

                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ),
          ));
    }

    setState(() {
      url = '$filterJurusan$filterKelas';
    });

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
                value1Item != null || value2Item != null
                    ? GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                            value1Item = null;
                            value2Item = null;
                            url = '';
                            filterJurusan = '';
                            filterKelas = '';
                            flag1 = false;
                            flag2 = false;
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
                dropdownList2(
                  hint: 'Kelas',
                  data: [
                    'A',
                    'B',
                    'C',
                  ],
                ),
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
                  onPressed: () {
                    launchUrl(url);
                  },
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
      appBar: isSearch ? searchAppbar() : header(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          filter(),
          Expanded(
            child: isLoading == true
                ? Container()
                : provider.angketPilihanStaffBk == 'Lintas Minat'
                    ? FutureBuilder(
                        future: Services()
                            .getAngketLintasMinat(urlSearch: urlSearch),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            List<AngketBKModel> data = snapshot.data;
                            return data.isEmpty
                                ? Center(
                                    child: Text(
                                      'data tidak ditemukan',
                                      style: mono1TextStyle,
                                    ),
                                  )
                                : ListView(
                                    children: data.map((item) {
                                      return listItem(
                                        name: '${item.nAMA}',
                                        kelas: '${item.kELAS}',
                                        url: '${item.fILE}',
                                      );
                                    }).toList(),
                                  );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                                color: m1Color,
                              ),
                            );
                          }
                        },
                      )
                    : provider.angketPilihanStaffBk == 'Data Siswa'
                        ? FutureBuilder(
                            future: Services()
                                .getAngketDataSiswa(urlSearch: urlSearch),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                List<AngketBKModel> data = snapshot.data;
                                return data.isEmpty
                                    ? Center(
                                        child: Text(
                                          'data tidak ditemukan',
                                          style: mono1TextStyle,
                                        ),
                                      )
                                    : ListView(
                                        children: data.map((item) {
                                          return listItem(
                                            name: '${item.nAMA}',
                                            kelas: '${item.kELAS}',
                                            url: '${item.fILE}',
                                          );
                                        }).toList(),
                                      );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 4,
                                    color: m1Color,
                                  ),
                                );
                              }
                            },
                          )
                        : FutureBuilder(
                            future: Services()
                                .getAngketPeminatan(urlSearch: urlSearch),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                List<AngketBKModel> data = snapshot.data;
                                return data.isEmpty
                                    ? Center(
                                        child: Text(
                                          'data tidak ditemukan',
                                          style: mono1TextStyle,
                                        ),
                                      )
                                    : ListView(
                                        children: data.map((item) {
                                          return listItem(
                                            name: '${item.nAMA}',
                                            kelas: '${item.kELAS}',
                                            url: '${item.fILE}',
                                          );
                                        }).toList(),
                                      );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 4,
                                    color: m1Color,
                                  ),
                                );
                              }
                            },
                          ),
          )
        ],
      ),
    );
  }
}
