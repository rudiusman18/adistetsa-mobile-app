import 'package:adistetsa/models/riwayatpeminjaman_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

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
  bool isLoading = false;
  String urlSearch = '';

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);

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
              urlSearch = '';
              isSearch = false;
              isLoading = true;
            });
            await Services().getRiwayatPeminjamanSiswaAdmin();
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
            await Services().getRiwayatPeminjamanSiswaAdmin();
            setState(() {
              isLoading = false;
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
        {required String id,
        required String nama,
        required String nomerInduk,
        required String status,
        required String dataGuru,
        required String nis}) {
      return GestureDetector(
        onTap: () async {
          setState(() {
            searchController.clear();
            isSearch = false;
            loading(context);
          });

          await provider.getDetailRiwayatPeminjamanAdmin(
              dataGuru: dataGuru, nis: nis, id: id);

          Navigator.pushReplacementNamed(
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
                            '$nomerInduk',
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
                          color: status == 'Sedang Dipinjam'
                              ? warningColor
                              : status == 'Pengajuan' || status == 'Diajukan'
                                  ? infoColor
                                  : status == 'Sudah Dikembalikan'
                                      ? successColor
                                      : status == 'Tenggat'
                                          ? m1Color
                                          : status == 'Hilang'
                                              ? dangerColor
                                              : status == 'Ditolak'
                                                  ? dangerColor
                                                  : mono1Color,
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
                  Container(
                    padding: EdgeInsets.only(top: 17),
                    child: isLoading == true
                        ? Container()
                        : FutureBuilder(
                            future: Services().getRiwayatPeminjamanSiswaAdmin(
                                search: urlSearch),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                List<RiwayatPeminjamanModel> data =
                                    snapshot.data;
                                return data.isEmpty
                                    ? Center(
                                        child: Text(
                                          'Data tidak ditemukan',
                                          style: mono1TextStyle,
                                        ),
                                      )
                                    : ListView(
                                        children: data.map((item) {
                                          return item.jANGKAPEMINJAMAN ==
                                                  'Jangka Panjang'
                                              ? listItem(
                                                  id: item.iD.toString(),
                                                  status: item.sTATUSPEMINJAMAN
                                                      .toString(),
                                                  nama: '${item.nAMA}',
                                                  nomerInduk: item.nIS != null
                                                      ? '${item.nIS}'
                                                      : '${item.dATAGURU}',
                                                  dataGuru: '${item.dATAGURU}',
                                                  nis: '${item.nIS}')
                                              : SizedBox(
                                                  child: Center(
                                                    child: Text(
                                                      'Data tidak ditemukan',
                                                      style: mono1TextStyle,
                                                    ),
                                                  ),
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
                  Container(
                    padding: EdgeInsets.only(top: 17),
                    child: isLoading == true
                        ? Container()
                        : FutureBuilder(
                            future: Services().getRiwayatPeminjamanSiswaAdmin(
                                search: urlSearch),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                List<RiwayatPeminjamanModel> data =
                                    snapshot.data;
                                return data.isEmpty
                                    ? Center(
                                        child: Text(
                                          'Data tidak ditemukan',
                                          style: mono1TextStyle,
                                        ),
                                      )
                                    : ListView(
                                        children: data.map((item) {
                                          return item.jANGKAPEMINJAMAN ==
                                                  'Jangka Pendek'
                                              ? listItem(
                                                  id: item.iD.toString(),
                                                  status: item.sTATUSPEMINJAMAN
                                                      .toString(),
                                                  nama: '${item.nAMA}',
                                                  nomerInduk: item.nIS != null
                                                      ? '${item.nIS}'
                                                      : '${item.dATAGURU}',
                                                  dataGuru: '${item.dATAGURU}',
                                                  nis: '${item.nIS}')
                                              : SizedBox(
                                                  child: Center(
                                                    child: Text(
                                                      'Data tidak ditemukan',
                                                      style: mono1TextStyle,
                                                    ),
                                                  ),
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
          ),
        ),
      ),
    );
  }
}
