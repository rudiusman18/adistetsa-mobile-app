import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class RiwayatBukuTamuPage extends StatefulWidget {
  const RiwayatBukuTamuPage({Key? key}) : super(key: key);

  @override
  State<RiwayatBukuTamuPage> createState() => _RiwayatBukuTamuPageState();
}

class _RiwayatBukuTamuPageState extends State<RiwayatBukuTamuPage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();

  bool flag1 = false;
  Object? value1Item;

  bool flag2 = false;
  Object? value2Item;

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget riwayatBukuTamuHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Riwayat Buku Tamu',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono1Color,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearch = true;
              });
            },
            icon: Icon(Icons.search),
            color: mono1Color,
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

    Widget dropdownList1({required String hint, required List data}) {
      return Container(
          height: 24,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          margin: EdgeInsets.symmetric(horizontal: 4),
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

    Widget dropdownList2({required String hint, required List data}) {
      return Container(
          height: 24,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          margin: EdgeInsets.symmetric(horizontal: 4),
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
                    value2Item = value;
                    flag2 = true;
                  });
                },
              ),
            ),
          ));
    }

    Widget filter() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                // NOTE: ini adalah button reset yang hanya akan muncul jika salah satu dropdown dipilih
                value1Item != null || value2Item != null
                    ? GestureDetector(
                        onTap: () async {
                          setState(() {
                            value1Item = null;
                            value2Item = null;

                            flag1 = false;
                            flag2 = false;
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
                  hint: 'Tanggal',
                  data: [
                    'Tanggal Terbaru',
                    'Tanggal Terlama',
                  ],
                ),
                dropdownList2(
                  hint: 'Nama',
                  data: [
                    'A-Z (Ascending)',
                    'Z-A (Descending)',
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget itemList({required String name, required String date}) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/staff/buku-tamu/riwayat/detail');
        },
        child: Container(
          color: mono6Color,
          width: double.infinity,
          margin: EdgeInsets.only(
            bottom: 14.5,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('$name', style: mono1TextStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    date,
                    style: mono1TextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                  ),
                ],
              ),
              Divider(
                color: mono2Color,
                height: 1,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: isSearch == false ? riwayatBukuTamuHeader() : searchAppbar(),
      body: Container(
        child: Column(
          children: [
            filter(),
            Expanded(
              child: ListView(
                children: [
                  itemList(
                    name: 'Cerry Rans',
                    date: '2000-04-18',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
