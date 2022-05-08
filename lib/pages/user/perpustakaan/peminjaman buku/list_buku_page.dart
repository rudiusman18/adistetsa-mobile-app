import 'package:adistetsa/models/list_buku_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListBukuPage extends StatefulWidget {
  @override
  _ListBukuPageState createState() => _ListBukuPageState();
}

class _ListBukuPageState extends State<ListBukuPage> {
  bool isSearch = false;
  String urlSearch = '';
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);

    PreferredSizeWidget katalogBukuHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Katalog Buku Tersedia',
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
            await Services().getListBuku();
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
            await Services().getListBuku(search: urlSearch);
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
      required String nama,
      required String tipe,
      required ListBukuModel buku,
    }) {
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
              TextButton(
                onPressed: () {
                  provider.addBooks(buku: buku);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    backgroundColor: m5Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                child: Text(
                  'Pinjam',
                  style: mono6TextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        appBar: isSearch == true ? searchAppbar() : katalogBukuHeader(),
        backgroundColor: mono6Color,
        body: Container(
          padding: EdgeInsets.only(top: 20),
          child: isLoading == true
              ? Container()
              : FutureBuilder(
                  future: Services().getListBuku(search: urlSearch),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<ListBukuModel> data = snapshot.data;
                      return data.isEmpty
                          ? Center(
                              child: Text(
                                'data tidak ditemukan',
                                style: mono1TextStyle,
                              ),
                            )
                          : ListView(
                              children: data.map((item) {
                                return provider.bookExist(item)
                                    ? Container()
                                    : listItem(
                                        nama: item.jUDUL.toString(),
                                        tipe: item.rEGISTER.toString(),
                                        buku: item,
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
        ));
  }
}
