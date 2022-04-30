import 'package:adistetsa/models/profil_konselor_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class DaftarKkonselingPage extends StatefulWidget {
  @override
  State<DaftarKkonselingPage> createState() => _DaftarKkonselingPageState();
}

class _DaftarKkonselingPageState extends State<DaftarKkonselingPage> {
  bool isSearch = false;
  String urlSearch = '';
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Daftar haloBK',
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
            await Services().getKonselorBK();
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

            await Services().getKonselorBK();
            setState(() {
              isLoading = false;
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget listKonsulen({
      required String id,
      required String urlImage,
      required String name,
      required String role,
      required String status,
    }) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: () {
            if (status == 'Online') {
              provider.setId = id;
              Navigator.pushNamed(
                  context, '/user/bk/daftar-konseling/ajukan-konsultasi');
            }
          },
          child: Column(
            children: [
              Container(
                color: mono6Color,
                margin: EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        urlImage,
                        fit: BoxFit.fill,
                        width: 80,
                        height: 80,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Container(
                            width: 80,
                            height: 80,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: m1Color,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: mono1TextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            role,
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            status,
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                              color: status == 'Online'
                                  ? successColor
                                  : dangerColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5,
                color: mono3Color,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: mono6Color,
        appBar: isSearch ? searchAppbar() : header(),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: isLoading == true
              ? Container()
              : FutureBuilder(
                  future: Services().getKonselorBK(search: urlSearch),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<ProfilKonselorModel> data = snapshot.data;
                      return data.isEmpty
                          ? Center(
                              child: Text(
                                'Data tidak ditemukan',
                                style: mono1TextStyle,
                              ),
                            )
                          : ListView(
                              children: data.map((item) {
                                return listKonsulen(
                                  id: item.iD.toString(),
                                  urlImage: item.fOTO.toString(),
                                  name: item.nAMA.toString(),
                                  role: 'Konselor HaloBK',
                                  status: item.sTATUS.toString(),
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
