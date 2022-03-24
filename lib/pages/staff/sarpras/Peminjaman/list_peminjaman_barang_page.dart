import 'package:adistetsa/models/peminjambarang_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/theme.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPeminjamanBarangPage extends StatefulWidget {
  @override
  _ListPeminjamanBarangPageState createState() =>
      _ListPeminjamanBarangPageState();
}

class _ListPeminjamanBarangPageState extends State<ListPeminjamanBarangPage> {
  bool isSearch = false;
  String urlSearch = '';
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);

    PreferredSizeWidget katalogBarangHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Peminjaman Barang',
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
            await Services().getBarangAdmin();
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
            await Services().getBarangAdmin();
            setState(() {
              isLoading = false;
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget listItem({
      required String id,
      required String nama,
      required String tanggalPengajuan,
    }) {
      return GestureDetector(
        onTap: () async {
          setState(() {
            searchController.clear();
            isSearch = false;
            loading(context);
          });
          await provider.getDetailBarangAdmin(id: id);
          Navigator.pushReplacementNamed(
                  context, '/staf/sarpras/list-peminjaman-barang/detail-page')
              .then((_) async {
            setState(() {
              isLoading = true;
              print(isLoading);
            });
            await Services().getBarangAdmin();
            setState(() {
              isLoading = false;
              print(isLoading);
            });
          });
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
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: isSearch == true ? searchAppbar() : katalogBarangHeader(),
      backgroundColor: mono6Color,
      body: isLoading == false
          ? FutureBuilder(
              future: Services().getBarangAdmin(urlSearch: urlSearch),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<PeminjamBarangModel> data = snapshot.data;
                  return data.isEmpty
                      ? Center(
                          child: Text(
                            'Data tidak ditemukan',
                            style: mono1TextStyle,
                          ),
                        )
                      : ListView(
                          children: data.map((item) {
                            return Container(
                              padding: EdgeInsets.only(top: 20),
                              child: listItem(
                                id: '${item.iD}',
                                nama: '${item.nAMAPEMINJAM}',
                                tanggalPengajuan: '${item.tANGGALPENGAJUAN}',
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
            )
          : Container(),
    );
  }
}
