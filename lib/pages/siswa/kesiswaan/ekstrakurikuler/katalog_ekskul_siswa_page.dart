import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class KatalogEkskulSiswaPage extends StatefulWidget {
  const KatalogEkskulSiswaPage({Key? key}) : super(key: key);

  @override
  _KatalogEkskulSiswaPageState createState() => _KatalogEkskulSiswaPageState();
}

class _KatalogEkskulSiswaPageState extends State<KatalogEkskulSiswaPage> {
  bool isSearch = false;
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget katalogekstrakurikulerHeader() {
      return AppBar(
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        centerTitle: true,
        title: Text(
          'Katalog Ekstrakurikuler',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        automaticallyImplyLeading: false,
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
            icon: Icon(Icons.search_outlined),
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
              isSearch = false;
            });
          },
          child: Icon(
            Icons.arrow_back,
            color: mono1Color,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                searchController.clear();
              });
            },
            icon: Icon(
              Icons.clear_outlined,
              color: mono3Color,
            ),
          ),
        ],
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
              isLoading = true;
            });

            setState(() {
              isLoading = false;
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget listItem({required String namaEkstrakurikuler}) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/siswa/katalog-ekskul/detal-page');
        },
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 22,
          ),
          padding: EdgeInsets.only(
            bottom: 18,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '$namaEkstrakurikuler',
                      style: mono1TextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Divider(
                height: 0.5,
                color: mono3Color,
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar:
          isSearch == false ? katalogekstrakurikulerHeader() : searchAppbar(),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 22,
          ),
          listItem(
            namaEkstrakurikuler: "Bola Basket",
          ),
          listItem(
            namaEkstrakurikuler: "Bola Voly",
          ),
          listItem(
            namaEkstrakurikuler: "Catur",
          ),
          listItem(
            namaEkstrakurikuler: "Bulu Tangkis",
          ),
          listItem(
            namaEkstrakurikuler: "Code",
          ),
          listItem(
            namaEkstrakurikuler: "Fotografi",
          ),
          listItem(
            namaEkstrakurikuler: "Fotografi",
          ),
          listItem(
            namaEkstrakurikuler: "Fotografi",
          ),
          listItem(
            namaEkstrakurikuler: "Fotografi",
          ),
          listItem(
            namaEkstrakurikuler: "Fotografi",
          ),
        ]),
      ),
    );
  }
}
