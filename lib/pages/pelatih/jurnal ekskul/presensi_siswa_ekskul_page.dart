import 'package:adistetsa/theme.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:flutter/material.dart';

class PresensiSiswaEkskulPage extends StatefulWidget {
  @override
  State<PresensiSiswaEkskulPage> createState() =>
      _PresensiSiswaEkskulPageState();
}

class _PresensiSiswaEkskulPageState extends State<PresensiSiswaEkskulPage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();
  String urlSearch = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget presensiSiswaHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Presensi Siswa',
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
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget listSiswa({
      required String id,
      required String nama,
      required String nis,
      required String status,
    }) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nama,
                            style: mono1TextStyle,
                          ),
                          Text(
                            nis,
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    status,
                    style: mono1TextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        loading(context);
                      });

                      Navigator.pushReplacementNamed(context,
                              '/pelatih/jurnal-ekskul/lihat-jurnal/presensi-siswa-ekskul/detail-page')
                          .then((_) async {
                        setState(
                          () {
                            isLoading = true;
                          },
                        );
                      });
                    },
                    child: Icon(
                      Icons.edit,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              color: mono3Color,
              thickness: 0.5,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: isSearch ? searchAppbar() : presensiSiswaHeader(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: ListView(
          children: [
            for (var i = 0; i < 20; i++)
              listSiswa(
                nama: 'Syauqi',
                nis: '123455',
                status: 'Janda',
                id: '0',
              ),
          ],
        ),
      ),
    );
  }
}
