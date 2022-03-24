import 'package:adistetsa/models/riwayatbarang_model.dart';
import 'package:adistetsa/models/riwayatruangan_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class RiwayatPeminjamanPage extends StatefulWidget {
  RiwayatPeminjamanPage({Key? key}) : super(key: key);

  @override
  State<RiwayatPeminjamanPage> createState() => _RiwayatPeminjamanPageState();
}

class _RiwayatPeminjamanPageState extends State<RiwayatPeminjamanPage> {
  bool isSearch = false;
  bool isLoading = false;
  String urlSearch = '';
  TextEditingController searchController = TextEditingController();

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
              urlSearch = '';
              isSearch = false;
              isLoading = true;
            });
            await Services().getRiwayatBarang();
            await Services().getRiwayatRuangan();
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
              urlSearch = searchController.text;
              isLoading = true;
            });
            await Services().getRiwayatBarang();
            await Services().getRiwayatRuangan();
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
      required String nama,
      required String tanggalPengajuan,
      required String status,
      required String detail,
    }) {
      return GestureDetector(
        onTap: () async {
          setState(() {
            searchController.clear();
            isSearch = false;
            loading(context);
          });
          if (detail == 'Barang') {
            await provider.getDetailRiwayatBarang(id: id);
          } else {
            await provider.getDetailRiwayatRuangan(id: id);
          }
          provider.setDetailRuangan(detail: detail);
          Navigator.pushReplacementNamed(
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
                            '$nama',
                            style: mono1TextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '$tanggalPengajuan',
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
                                  : '$status' == 'Selesai Dipinjam'
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
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: isLoading == true
                      ? Container()
                      : FutureBuilder(
                          future: Services().getRiwayatBarang(urlSearch: urlSearch),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              List<RiwayatBarangModel> data = snapshot.data;
                              return data.isEmpty
                                  ? Center(
                                      child: Text(
                                        'Data tidak ditemukan',
                                        style: mono1TextStyle,
                                      ),
                                    )
                                  : ListView(
                                      children: data.map((item) {
                                        return listItem(
                                          id: '${item.iD}',
                                          nama: '${item.aLAT![0].nAMA}',
                                          tanggalPengajuan:
                                              '${item.tANGGALPENGGUNAAN}',
                                          status: '${item.sTATUS}',
                                          detail: 'Barang',
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
                  padding: EdgeInsets.only(top: 20),
                  child: isLoading == true
                      ? Container()
                      : FutureBuilder(
                          future: Services().getRiwayatRuangan(urlSearch: urlSearch),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              List<RiwayatRuanganModel> data = snapshot.data;
                              return data.isEmpty
                                  ? Center(
                                      child: Text(
                                        'Data tidak ditemukan',
                                        style: mono1TextStyle,
                                      ),
                                    )
                                  : ListView(
                                      children: data.map((item) {
                                        return listItem(
                                          id: '${item.iD}',
                                          nama: '${item.rUANGAN}',
                                          tanggalPengajuan:
                                              '${item.tANGGALPENGAJUAN}',
                                          status: '${item.sTATUS}',
                                          detail: 'Ruang',
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
    );
  }
}
