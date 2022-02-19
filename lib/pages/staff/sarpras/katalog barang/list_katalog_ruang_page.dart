import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';

class ListKatalogRuangPage extends StatefulWidget {
  @override
  _ListKatalogRuangPageState createState() => _ListKatalogRuangPageState();
}

class _ListKatalogRuangPageState extends State<ListKatalogRuangPage> {
  bool isSearch = false;
  String urlSearch = '';
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget katalogBarangHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Katalog Ruang',
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
            await Services().getKatalogBuku(search: urlSearch);
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
      required String namaAlat,
      required String namaRuang,
      required String status,
    }) {
      return GestureDetector(
        onTap: () async {
          setState(() {
            searchController.clear();
            isSearch = false;
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
                      '$namaAlat',
                      style: mono1TextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '$namaRuang',
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
                    color: status == 'Digunakan'
                        ? warningColor
                        : status == 'Tersedia'
                            ? successColor
                            : successColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: isSearch == true ? searchAppbar() : katalogBarangHeader(),
        backgroundColor: mono6Color,
        body: ListView(
          children: [
            for (var i = 0; i < 20; i++)
              Container(
                padding: EdgeInsets.only(top: 20),
                child: listItem(
                  id: i.toString(),
                  namaAlat: 'Kamar Mandi',
                  namaRuang: 'tidak ada ruang',
                  status: 'JOMBLO NGENES',
                ),
              ),
          ],
        ));
  }
}
