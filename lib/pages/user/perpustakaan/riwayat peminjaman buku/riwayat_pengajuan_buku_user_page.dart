import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class RiwayatPengajuanBukuUserPage extends StatefulWidget {
  RiwayatPengajuanBukuUserPage({Key? key}) : super(key: key);

  @override
  State<RiwayatPengajuanBukuUserPage> createState() =>
      _RiwayatPengajuanBukuUserPageState();
}

class _RiwayatPengajuanBukuUserPageState
    extends State<RiwayatPengajuanBukuUserPage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();

  Object? value1Item;
  Object? value2Item;

  bool flag1 = false;
  bool flag2 = false;
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget pengajuanBukuHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Daftar Pengajuan',
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

    Widget listItem(
        {required String nama, required String nis, required String status}) {
      return GestureDetector(
        onTap: () {
          setState(() {
            searchController.clear();
            isSearch = false;
          });
          Navigator.pushNamed(
              context, '/user/perpustakaan/riwayat-pengajuan-buku/detail-page');
        },
        child: Container(
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$nama',
                            style: mono1TextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '$nis',
                            style: mono2TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '$status',
                        style: mono2TextStyle.copyWith(
                          fontSize: 10,
                          color: infoColor,
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

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: isSearch == false ? pengajuanBukuHeader() : searchAppbar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                listItem(
                  nama: '2022-01-28',
                  nis: 'Jangka Pendek',
                  status: 'Diajukan',
                ),
                listItem(
                  nama: '2022-01-28',
                  nis: 'Jangka Pendek',
                  status: 'Diajukan',
                ),
                listItem(
                  nama: '2022-01-28',
                  nis: 'Jangka Pendek',
                  status: 'Diajukan',
                ),
                listItem(
                  nama: '2022-01-28',
                  nis: 'Jangka Pendek',
                  status: 'Diajukan',
                ),
                listItem(
                  nama: '2022-01-28',
                  nis: 'Jangka Pendek',
                  status: 'Diajukan',
                ),
                listItem(
                  nama: '2022-01-28',
                  nis: 'Jangka Pendek',
                  status: 'Diajukan',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
