import 'package:adistetsa/models/katalogekskul_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class LihatEkstrakurikulerSiswaPage extends StatefulWidget {
  const LihatEkstrakurikulerSiswaPage({Key? key}) : super(key: key);

  @override
  _LihatEkstrakurikulerSiswaPageState createState() =>
      _LihatEkstrakurikulerSiswaPageState();
}

class _LihatEkstrakurikulerSiswaPageState
    extends State<LihatEkstrakurikulerSiswaPage> {
  bool isSearch = false;
  bool isLoading = false;
  String urlSearch = '';
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    PreferredSizeWidget lihatekstrakurikulerHeader() {
      return AppBar(
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        centerTitle: true,
        title: Text(
          'Lihat Ekstrakurikuler',
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
            await Services().getEkskulSaya();
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
            await Services().getEkskulSaya();
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
      required String name,
      required String date,
      required String id,
    }) {
      return GestureDetector(
        onTap: () async {
          setState(() {
            loading(context);
          });
          await provider.getDetailKatalogEkskul(id: id);
          Navigator.pushReplacementNamed(
              context, '/siswa/lihat-ekskul/detail-page');
        },
        child: Container(
          color: mono6Color,
          margin: EdgeInsets.only(
            bottom: 12,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$name',
                          style: mono1TextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '$date',
                          style: mono2TextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Divider(
                color: mono3Color,
                height: 0.5,
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: isSearch == false ? lihatekstrakurikulerHeader() : searchAppbar(),
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 22,
          ),
          Expanded(
            child: isLoading == true
                ? Container()
                : FutureBuilder(
                    future: Services().getEkskulSaya(),
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
                                    name: "${item.nAMA}",
                                    date: '${item.jADWAL}'
                                        .replaceAll('[', '')
                                        .replaceAll(']', ''),
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
      ),
    );
  }
}
