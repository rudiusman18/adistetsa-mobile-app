import 'package:adistetsa/models/katalogekskul_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class KatalogEkskulSiswaPage extends StatefulWidget {
  const KatalogEkskulSiswaPage({Key? key}) : super(key: key);

  @override
  _KatalogEkskulSiswaPageState createState() => _KatalogEkskulSiswaPageState();
}

class _KatalogEkskulSiswaPageState extends State<KatalogEkskulSiswaPage> {
  bool isSearch = false;
  bool isLoading = false;
  String urlSearch = '';
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
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
              urlSearch = '';
              isSearch = false;
              isLoading = true;
            });
            await Services().getKatalogEkskul();
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
              print(urlSearch);
              isLoading = true;
            });
            await Services().getKatalogEkskul();
            setState(() {
              isLoading = false;
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget listItem({required String id, required String namaEkstrakurikuler}) {
      return GestureDetector(
        onTap: () async {
          setState(() {
            loading(context);
          });
          await provider.getDetailKatalogEkskul(id: id);
          Navigator.pushReplacementNamed(
              context, '/siswa/katalog-ekskul/detal-page');
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
      body: Column(children: [
        SizedBox(
          height: 22,
        ),
        Expanded(
          child: isLoading == true
              ? Container()
              : FutureBuilder(
                  future: Services().getKatalogEkskul(urlSearch: urlSearch),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<KatalogEkskulModel> data = snapshot.data;
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
                                  namaEkstrakurikuler: "${item.nAMA}",
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
                ),
        )
      ]),
    );
  }
}
