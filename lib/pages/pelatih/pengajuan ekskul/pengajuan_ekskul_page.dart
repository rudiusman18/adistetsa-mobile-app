import 'package:adistetsa/models/pengajuanekskul_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/theme.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PengajuanEkskulPage extends StatefulWidget {
  @override
  _PengajuanEkskulPageState createState() => _PengajuanEkskulPageState();
}

class _PengajuanEkskulPageState extends State<PengajuanEkskulPage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();
  String urlSearch = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Pengajuan Siswa',
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

    listItem(
        {required String id,
        required String name,
        required String nis,
        required String kelas}) {
      return GestureDetector(
        onTap: () async {
          setState(() {
            loading(context);
          });
          await provider.getDetailPengajuanEkskul(id: id);
          Navigator.pushReplacementNamed(context,
                  '/pelatih/pengajuan-ekskul/detail-pengajuan-ekskul-page')
              .then((_) async {
            setState(() {
              isLoading = true;
            });
            await Services().getPengajuanEkskul();
            setState(() {
              isLoading = false;
            });
          });
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
          child: isLoading == false
              ? FutureBuilder(
                  future: Services().getPengajuanEkskul(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<PengajuanEkskulModel> data = snapshot.data;
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
                                  name: '${item.nAMA}',
                                  nis: '${item.nIS}'.split(' - ')[0],
                                  kelas: '${item.kELAS}',
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
        ));
  }
}
