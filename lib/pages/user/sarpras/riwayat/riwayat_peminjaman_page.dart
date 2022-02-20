import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class RiwayatPeminjamanPage extends StatefulWidget {
  RiwayatPeminjamanPage({Key? key}) : super(key: key);

  @override
  State<RiwayatPeminjamanPage> createState() => _RiwayatPeminjamanPageState();
}

class _RiwayatPeminjamanPageState extends State<RiwayatPeminjamanPage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget peminjamanBukuHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Riwayat Peminjaman',
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
        bottom: TabBar(
          indicatorColor: m1Color,
          labelColor: m1Color,
          unselectedLabelColor: mono3Color,
          labelStyle: mono3TextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 10,
          ),
          tabs: [
            Tab(
              text: 'Barang',
            ),
            Tab(
              text: 'Ruang',
            ),
          ],
        ),
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
        bottom: TabBar(
          indicatorColor: m1Color,
          labelColor: m1Color,
          unselectedLabelColor: mono3Color,
          labelStyle: mono3TextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 10,
          ),
          tabs: [
            Tab(
              text: 'Barang',
            ),
            Tab(
              text: 'Ruang',
            ),
          ],
        ),
      );
    }

    Widget listItem({
      required String id,
      required String tanggalPengajuan,
      required String jangkaPeminjaman,
      required String status,
    }) {
      return GestureDetector(
        onTap: () async {
          setState(() {
            searchController.clear();
            isSearch = false;
          });
          Navigator.pushNamed(
              context, '/user/sarpras/riwayat-peminjaman/detail-page');
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
                            '$tanggalPengajuan',
                            style: mono1TextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '$jangkaPeminjaman',
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
                          color: '$status' == 'Sedang Dipinjam'
                              ? warningColor
                              : '$status' == 'Diajukan'
                                  ? infoColor
                                  : '$status' == 'Sudah Dikembalikan'
                                      ? successColor
                                      : '$status' == 'Tenggat'
                                          ? m1Color
                                          : dangerColor,
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: mono6Color,
            appBar: isSearch == true ? searchAppbar() : peminjamanBukuHeader(),
            body: TabBarView(
              children: [
                ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    for (var i = 0; i < 10; i++)
                      listItem(
                        id: (i + 1).toString(),
                        tanggalPengajuan: 'tanggalPengajuan',
                        jangkaPeminjaman: 'jangkaPeminjaman',
                        status: 'Diajukan',
                      ),
                  ],
                ),
                ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    for (var i = 0; i < 5; i++)
                      listItem(
                        id: 'id',
                        tanggalPengajuan: 'tanggalPengajuan',
                        jangkaPeminjaman: 'jangkaPeminjaman',
                        status: 'Diajukan',
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
