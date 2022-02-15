import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class RiwayatPeminjamanBukuPage extends StatefulWidget {
  RiwayatPeminjamanBukuPage({Key? key}) : super(key: key);

  @override
  State<RiwayatPeminjamanBukuPage> createState() =>
      _RiwayatPeminjamanBukuPageState();
}

class _RiwayatPeminjamanBukuPageState extends State<RiwayatPeminjamanBukuPage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();

  Object? value1Item;
  Object? value2Item;

  bool flag1 = false;
  bool flag2 = false;

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
              text: 'Jangka Panjang',
            ),
            Tab(
              text: 'Jangka Pendek',
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
              text: 'Jangka Panjang',
            ),
            Tab(
              text: 'Jangka Pendek',
            ),
          ],
        ),
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
              context, '/staff-perpus/riwayat-peminjaman-buku/detail-page');
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
          child: WillPopScope(
            onWillPop: () async {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main-page/back', (route) => false);
              return true;
            },
            child: Scaffold(
              backgroundColor: mono6Color,
              appBar:
                  isSearch == true ? searchAppbar() : peminjamanBukuHeader(),
              body: TabBarView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            listItem(
                                nama: 'Agung',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Bagus',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Chandra',
                                nis: '6969696969',
                                status: 'Tenggat'),
                            listItem(
                                nama: 'Diska',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Emma',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Fuad',
                                nis: '6969696969',
                                status: 'Selesai'),
                            listItem(
                                nama: 'Ibol',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Ibal',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Badbol',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Goodbol',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            listItem(
                                nama: 'Agung',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Bagus',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Chandra',
                                nis: '6969696969',
                                status: 'Tenggat'),
                            listItem(
                                nama: 'Diska',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Emma',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Fuad',
                                nis: '6969696969',
                                status: 'Selesai'),
                            listItem(
                                nama: 'Ibol',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Ibal',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Badbol',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                            listItem(
                                nama: 'Goodbol',
                                nis: '6969696969',
                                status: 'Sedang Dipinjam'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
