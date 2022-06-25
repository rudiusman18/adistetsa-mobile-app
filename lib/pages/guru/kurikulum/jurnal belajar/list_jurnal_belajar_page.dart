import 'package:adistetsa/models/jadwalmengajarguru_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/theme.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListJurnalBelajarPage extends StatefulWidget {
  @override
  State<ListJurnalBelajarPage> createState() => _ListJurnalBelajarPageState();
}

class _ListJurnalBelajarPageState extends State<ListJurnalBelajarPage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();
  String urlSearch = '';
  bool isLoading = false;
  bool flag1 = false;
  Object? value1Item;
  bool flag2 = false;
  Object? value2Item;
  String url = '';
  String filterTahun = '';
  String filterHari = '';
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    PreferredSizeWidget jurnalBelajarHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Jurnal Belajar Mengajar',
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
            await Services().getJurnalBelajarMengajarGuru();
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
            await Services().getJurnalBelajarMengajarGuru();
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
                items: provider.listTahunAjaranFilter.map(
                  (value) {
                    return DropdownMenuItem(
                      value: value['ID'],
                      child: Text(
                        value['tahun_ajaran'],
                        style: mono2TextStyle.copyWith(
                          color:
                              value1Item == value['ID'] ? p1Color : mono2Color,
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
                    filterTahun = 'TAHUN_AJARAN=$value';

                    flag1 = true;
                  });
                  await Services().getJurnalBelajarMengajarGuru();
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
                    filterHari = 'HARI=$value';
                    flag2 = true;
                  });
                  await Services().getJurnalBelajarMengajarGuru();
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ),
          ));
    }

    setState(() {
      url = '$filterTahun&$filterHari';
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
                            filterHari = '';
                            filterTahun = '';
                            url = '';
                            flag1 = false;
                            flag2 = false;
                          });
                          await Services().getJurnalBelajarMengajarGuru();
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
                  hint: 'Tahun Ajaran',
                  data: [
                    '2020/2021',
                    '2021/2022',
                  ],
                ),
                dropdownList2(
                  hint: 'Hari',
                  data: [
                    'Senin',
                    'Selasa',
                    'Rabu',
                    'Kamis',
                    'Jum`at',
                    'Sabtu',
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget expandList({
      required String header,
      required String subtitle,
      required String content,
      required String subtitleContent,
      required String? id,
    }) {
      return ExpandableNotifier(
          child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
              ),
              header: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    header,
                    style: mono2TextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: mono1TextStyle,
                  ),
                ],
              ),
              collapsed: Container(),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content,
                    style: mono2TextStyle.copyWith(
                      fontSize: 10,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    subtitleContent,
                    style: mono2TextStyle.copyWith(
                      fontSize: 10,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: m5Color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            loading(context);
                          });
                          await provider.setIdJurnalBelajar(
                              getIdJurnalBelajar: '$id');
                          Navigator.pushReplacementNamed(context,
                              '/guru/kurikulum/list-jurnal-belajar/isi-jurnal-page');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: mono6Color,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Isi Jurnal',
                              style: mono6TextStyle.copyWith(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: m5Color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            loading(context);
                          });
                          await provider.setIdJurnalBelajar(
                              getIdJurnalBelajar: '$id');
                          await provider.getJurnalBelajarMengajarGuru();
                          Navigator.pushReplacementNamed(context,
                              '/guru/kurikulum/list-jurnal-belajar/lihat-jadwal-page');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.visibility,
                              color: mono6Color,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Lihat Jurnal',
                              style: mono6TextStyle.copyWith(
                                fontSize: 10,
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
            Divider(
              thickness: 0.5,
            ),
          ],
        ),
      ));
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: isSearch ? searchAppbar() : jurnalBelajarHeader(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          filter(),
          Expanded(
            child: isLoading == false
                ? FutureBuilder(
                    future: Services().getJurnalBelajarMengajarGuru(
                        search: urlSearch, filter: url),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<JadwalMengajarGuruModel> data = snapshot.data;
                        return data.isEmpty
                            ? Center(
                                child: Text(
                                  'Data tidak ditemukan',
                                  style: mono1TextStyle,
                                ),
                              )
                            : ListView(
                                children: data.map((item) {
                                  return expandList(
                                    header: '${item.kELAS!.split('-')[0]}' +
                                        ' - ' +
                                        '${item.kELAS!.split('-')[1]}',
                                    subtitle: '${item.mATAPELAJARAN}',
                                    content: '${item.wAKTUPELAJARAN}'
                                        .replaceAll('[', '')
                                        .replaceAll(']', ''),
                                    subtitleContent: '${item.sEMESTER}',
                                    id: '${item.iD}',
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
                : Container(),
          ),
        ],
      ),
    );
  }
}
