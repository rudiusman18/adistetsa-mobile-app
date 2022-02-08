import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';

class KatalogBukuPage extends StatefulWidget {
  @override
  _KatalogBukuPageState createState() => _KatalogBukuPageState();
}

class _KatalogBukuPageState extends State<KatalogBukuPage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();
  bool flag1 = false;
  bool flag2 = false;
  bool flag3 = false;
  bool flag4 = false;
  bool flag5 = false;

  Object? valueItem1;
  Object? valueItem2;
  Object? valueItem3;
  Object? valueItem4;
  Object? valueItem5;

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget katalogBukuHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Katalog Buku',
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
            Navigator.pushNamedAndRemoveUntil(
                context, '/main-page/back', (route) => false);
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

              isSearch = false;
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
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget dropdownList1({required String hint, required List items}) {
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
                  flag1 = false;
                  valueItem1 = null;
                });
              },
              child: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: flag1 == true ? p1Color : mono1Color,
                ),
                hint: Text(
                  hint,
                  style: mono1TextStyle.copyWith(
                    color: flag1 == true ? p1Color : mono1Color,
                    fontWeight: regular,
                    fontSize: 10,
                  ),
                ),
                dropdownColor: mono6Color,
                elevation: 2,
                value: valueItem1,
                items: items
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                              color: valueItem1 == value ? p1Color : mono1Color,
                            ),
                          ),
                          value: value,
                        ))
                    .toList(),
                onChanged: (value) async {
                  setState(() {
                    print(value);
                    valueItem1 = value;
                    flag1 = true;
                  });
                },
              ),
            ),
          ));
    }

// NOTE:DURUNG FIX
    Widget dropdownList2({required String hint, required List items}) {
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
                  flag2 = false;
                  valueItem2 = null;
                });
              },
              child: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: flag2 == true ? p1Color : mono1Color,
                ),
                hint: Text(
                  hint,
                  style: mono1TextStyle.copyWith(
                    color: flag2 == true ? p1Color : mono1Color,
                    fontWeight: regular,
                    fontSize: 10,
                  ),
                ),
                dropdownColor: mono6Color,
                elevation: 2,
                value: valueItem2,
                items: items
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                              color: valueItem2 == value ? p1Color : mono1Color,
                            ),
                          ),
                          value: value,
                        ))
                    .toList(),
                onChanged: (value) async {
                  setState(() {
                    print(value);
                    valueItem2 = value;
                    flag2 = true;
                  });
                },
              ),
            ),
          ));
    }

    Widget dropdownList3({required String hint, required List items}) {
      return Container(
          height: 24,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: flag3 == true ? p1Color : mono3Color,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: GestureDetector(
              onLongPress: () async {
                setState(() {
                  flag3 = false;
                  valueItem3 = null;
                });
              },
              child: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: flag3 == true ? p1Color : mono1Color,
                ),
                hint: Text(
                  hint,
                  style: mono1TextStyle.copyWith(
                    color: flag3 == true ? p1Color : mono1Color,
                    fontWeight: regular,
                    fontSize: 10,
                  ),
                ),
                dropdownColor: mono6Color,
                elevation: 2,
                value: valueItem3,
                items: items
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                              color: valueItem3 == value ? p1Color : mono1Color,
                            ),
                          ),
                          value: value,
                        ))
                    .toList(),
                onChanged: (value) async {
                  setState(() {
                    print(value);
                    valueItem3 = value;
                    flag3 = true;
                  });
                },
              ),
            ),
          ));
    }

// NOTE: DURUNG FIX
    Widget dropdownList4({required String hint, required List items}) {
      return Container(
          height: 24,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: flag4 == true ? p1Color : mono3Color,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: GestureDetector(
              onLongPress: () async {
                setState(() {
                  flag4 = false;
                  valueItem4 = null;
                });
              },
              child: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: flag4 == true ? p1Color : mono1Color,
                ),
                hint: Text(
                  hint,
                  style: mono1TextStyle.copyWith(
                    color: flag4 == true ? p1Color : mono1Color,
                    fontWeight: regular,
                    fontSize: 10,
                  ),
                ),
                dropdownColor: mono6Color,
                elevation: 2,
                value: valueItem4,
                items: items
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                              color: valueItem4 == value ? p1Color : mono1Color,
                            ),
                          ),
                          value: value,
                        ))
                    .toList(),
                onChanged: (value) async {
                  setState(() {
                    print(value);
                    valueItem4 = value;
                    flag4 = true;
                  });
                },
              ),
            ),
          ));
    }

// NOTE: DURUNG FIX
    Widget dropdownList5({required String hint, required List items}) {
      return Container(
          height: 24,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: flag5 == true ? p1Color : mono3Color,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: GestureDetector(
              onLongPress: () async {
                setState(() {
                  flag5 = false;
                  valueItem5 = null;
                });
              },
              child: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: flag5 == true ? p1Color : mono1Color,
                ),
                hint: Text(
                  hint,
                  style: mono1TextStyle.copyWith(
                    color: flag5 == true ? p1Color : mono1Color,
                    fontWeight: regular,
                    fontSize: 10,
                  ),
                ),
                dropdownColor: mono6Color,
                elevation: 2,
                value: valueItem5,
                items: items
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                              color: valueItem5 == value ? p1Color : mono1Color,
                            ),
                          ),
                          value: value,
                        ))
                    .toList(),
                onChanged: (value) async {
                  setState(() {
                    print(value);
                    valueItem5 = value;
                    flag5 = true;
                  });
                },
              ),
            ),
          ));
    }

    Widget filter() {
      return Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    // NOTE: ini adalah button reset yang hanya akan muncul jika salah satu dropdown dipilih
                    valueItem1 != null ||
                            valueItem2 != null ||
                            valueItem3 != null ||
                            valueItem4 != null ||
                            valueItem5 != null
                        ? GestureDetector(
                            onTap: () async {
                              setState(() {
                                valueItem1 = null;
                                valueItem2 = null;
                                valueItem3 = null;
                                valueItem4 = null;
                                valueItem5 = null;
                                flag1 = false;
                                flag2 = false;
                                flag3 = false;
                                flag4 = false;
                                flag5 = false;
                              });
                            },
                            child: Container(
                              height: 24,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: m5Color,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.restart_alt,
                                    size: 15,
                                    color: mono6Color,
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
                      hint: 'Jenis Media',
                      items: ['Pdf', 'Doc', 'Docx'],
                    ),
                    dropdownList2(
                      hint: 'Tipe Buku',
                      items: ['Cetak', 'Digital'],
                    ),
                    dropdownList3(
                      hint: 'Tahun Terbit',
                      items: ['2020', '2021', '2022'],
                    ),
                    dropdownList4(
                      hint: 'Bahasa',
                      items: ['Indonesia', 'Inggris', 'Arab'],
                    ),
                    dropdownList5(
                      hint: 'Author',
                      items: ['Rudi Usman', 'Adam Achmad', 'Aditia Syauqi'],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget listItem({required String nama, required String tipe}) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: mono3Color,
              width: 0.5,
            ),
          ),
        ),
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 12,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 12,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                searchController.clear();
                isSearch = false;
              });
              Navigator.pushNamed(
                  context, '/staff-perpus/katalog-buku/detail-page');
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$nama',
                        style: mono1TextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '$tipe',
                        style: mono2TextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: mono1Color,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/main-page/back', (route) => false);
        return true;
      },
      child: Scaffold(
          appBar: isSearch == true ? searchAppbar() : katalogBukuHeader(),
          backgroundColor: mono6Color,
          body: Column(
            children: [
              filter(),
              Expanded(
                child: ListView(
                  children: [
                    listItem(
                      nama: 'Bumi',
                      tipe: 'Novel',
                    ),
                    listItem(
                      nama: 'Kesatria, Putri, dan Bintang Jatuh',
                      tipe: 'Novel',
                    ),
                    listItem(
                      nama: 'Matematika XII Semester 2',
                      tipe: 'Buku Paket',
                    ),
                    listItem(
                      nama: 'Sejarah X Semester 1',
                      tipe: 'Buku Paket',
                    ),
                    listItem(
                      nama: 'Bahasa Indonesia XI Semester 2',
                      tipe: 'Buku Paket',
                    ),
                    listItem(
                      nama: 'Mengukur Sikap Sosial',
                      tipe: 'Buku Teks',
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
