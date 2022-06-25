import 'package:adistetsa/models/loguks_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RiwayatLogUKSPage extends StatefulWidget {
  RiwayatLogUKSPage({Key? key}) : super(key: key);

  @override
  State<RiwayatLogUKSPage> createState() => _RiwayatLogUKSPageState();
}

class _RiwayatLogUKSPageState extends State<RiwayatLogUKSPage> {
  bool isSearch = false;
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  bool flag1 = false;
  Object? value1Item;

  bool flag2 = false;
  Object? value2Item;

  bool flag3 = false;
  Object? value3Item;

  String filterUrl = '';
  String filterTanggal = '';
  String filterNama = '';
  String filterJenisPTK = '';
  String urlSearch = '';

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);

    PreferredSizeWidget riwayatLogUKSHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Riwayat Log UKS',
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
              urlSearch = '';
              isSearch = false;
              isLoading = true;
            });
            await Services().getLogUKS();
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
              urlSearch = 'search=${searchController.text}';
              isLoading = true;
            });
            await Services().getLogUKS();
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
                      value: value.split('.')[1],
                      child: Text(
                        value.split('.')[0],
                        style: mono2TextStyle.copyWith(
                          color: value1Item == value.split('.')[1]
                              ? p1Color
                              : mono2Color,
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
                    filterTanggal = 'TANGGAL=$value1Item';
                    flag1 = true;
                    isLoading = true;
                  });
                  await Services().getLogUKS();
                  setState(() {
                    isLoading = false;
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
                      value: value.split('.')[1],
                      child: Text(
                        value.split('.')[0],
                        style: mono2TextStyle.copyWith(
                          color: value2Item == value.split('.')[1]
                              ? p1Color
                              : mono2Color,
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
                    filterNama = 'NAMA=$value2Item';
                    flag2 = true;
                    isLoading = true;
                  });
                  await Services().getLogUKS();
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ),
          ));
    }

    Widget dropdownList3({required String hint, required List data}) {
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
                  value3Item = null;
                });
              },
              child: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: flag3 == true ? p1Color : mono2Color,
                ),
                hint: Text(
                  hint,
                  style: mono2TextStyle.copyWith(
                    color: flag3 == true ? p1Color : mono2Color,
                    fontWeight: regular,
                    fontSize: 10,
                  ),
                ),
                dropdownColor: mono6Color,
                elevation: 2,
                value: value3Item,
                items: data.map(
                  (value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: mono2TextStyle.copyWith(
                          color: value3Item == value ? p1Color : mono2Color,
                          fontWeight: regular,
                          fontSize: 10,
                        ),
                      ),
                    );
                  },
                ).toList(),
                onChanged: (value) async {
                  setState(() {
                    value3Item = value;
                    filterJenisPTK = 'JENIS_PTK=$value3Item';
                    flag3 = true;
                    isLoading = true;
                  });
                  await Services().getLogUKS();
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ),
          ));
    }

    setState(() {
      filterUrl = '$filterTanggal&$filterNama&$filterJenisPTK';
    });

    Widget filter() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 25,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Row(
              children: [
                // NOTE: ini adalah button reset yang hanya akan muncul jika salah satu dropdown dipilih
                value1Item != null || value2Item != null || value3Item != null
                    ? GestureDetector(
                        onTap: () async {
                          setState(() {
                            value1Item = null;
                            value2Item = null;
                            value3Item = null;
                            filterUrl = '';
                            filterTanggal = '';
                            filterNama = '';
                            filterJenisPTK = '';
                            flag1 = false;
                            flag2 = false;
                            flag3 = false;
                            isLoading = true;
                          });
                          await Services().getLogUKS();
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
                  hint: 'Tanggal',
                  data: [
                    'Tanggal Terbaru.1',
                    'Tanggal Terlama.2',
                  ],
                ),
                dropdownList2(
                  hint: 'Nama',
                  data: [
                    'A-Z (Ascending).2',
                    'Z-A (Descending).1',
                  ],
                ),
                dropdownList3(
                  hint: 'Jenis PTK',
                  data: [
                    'Guru Tidak Tetap',
                    'Aparatur Sipil Negara',
                    'Pegawai Tidak Tetap',
                    'Guru',
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget itemList({
      required String id,
      required String name,
      required String status,
      required String tanggal,
    }) {
      return GestureDetector(
        onTap: () {
          provider.setRoleRiwayatLogUks = status;
          provider.setIdLogUKS = id;
          Navigator.pushNamed(
              context, '/staff/humas/loguks/riwayat-data/detail');
        },
        child: Container(
          color: mono6Color,
          width: double.infinity,
          margin: EdgeInsets.only(
            bottom: 18,
            left: 21,
            right: 21,
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
                            Text(
                              '$name',
                              style: mono1TextStyle,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '$status',
                              style: mono1TextStyle.copyWith(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '$tanggal',
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
      appBar: isSearch == false ? riwayatLogUKSHeader() : searchAppbar(),
      body: Container(
        child: Column(
          children: [
            filter(),
            Expanded(
              child: isLoading == true
                  ? Container()
                  : FutureBuilder(
                      future: Services()
                          .getLogUKS(urlSearch: urlSearch, filter: filterUrl),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<LogUKSModel> data = snapshot.data;
                          return data.isEmpty
                              ? Center(
                                  child: Text(
                                    'data tidak ditemukan',
                                    style: mono1TextStyle,
                                  ),
                                )
                              : ListView(
                                  children: data.map((item) {
                                    return itemList(
                                      id: '${item.iD}',
                                      name: '${item.nAMA}',
                                      status: '${item.jENISPTK}',
                                      tanggal: '${item.tANGGAL}',
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
            ),
          ],
        ),
      ),
    );
  }
}
