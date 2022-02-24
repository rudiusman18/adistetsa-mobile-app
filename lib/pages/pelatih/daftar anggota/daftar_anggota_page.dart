import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';

class DaftarAnggotaPage extends StatefulWidget {
  @override
  _DaftarAnggotaPageState createState() => _DaftarAnggotaPageState();
}

class _DaftarAnggotaPageState extends State<DaftarAnggotaPage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();
  String urlSearch = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Daftar Anggota',
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

    listItem({
      required String name,
      required String nis,
      required String status,
      required String kelas,
    }) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
              context, '/pelatih/daftar-anggota/detail-daftar-anggota-page');
        },
        child: Container(
          color: mono6Color,
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: mono1TextStyle,
                      ),
                      Text(
                        nis,
                        style: mono1TextStyle.copyWith(
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    status,
                    style: mono1TextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  Spacer(),
                  Text(
                    kelas,
                    style: mono1TextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: mono1Color,
                  ),
                ],
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
        ),
      );
    }

    return Scaffold(
        appBar: isSearch == true ? searchAppbar() : header(),
        backgroundColor: mono6Color,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: ListView(
            children: [
              for (var i = 0; i < 50; i++)
                listItem(
                  name: 'Syauqi Babi',
                  nis: '123123123',
                  status: 'Aktif',
                  kelas: 'XII-IPA A',
                ),
            ],
          ),
        ));
  }
}
