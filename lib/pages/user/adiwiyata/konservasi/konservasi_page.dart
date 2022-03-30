import 'package:adistetsa/models/konservasi_air_model.dart';
import 'package:adistetsa/models/konservasi_energi_model.dart';
import 'package:adistetsa/services/service.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class KonservasiPage extends StatefulWidget {
  @override
  State<KonservasiPage> createState() => _KonservasiPageState();
}

class _KonservasiPageState extends State<KonservasiPage> {
  bool isSearch = false;
  String urlSearch = '';
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceWebView: true,
          enableJavaScript: true,
        );
      } else {
        Navigator.pushNamed(context, '/error-page');
      }
    }

    PreferredSizeWidget konservasiHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Konservasi',
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
          color: mono1Color,
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
        bottom: TabBar(
          indicatorColor: m1Color,
          labelColor: m1Color,
          unselectedLabelColor: mono3Color,
          labelStyle: mono3TextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 10,
          ),
          tabs: [
            Tab(
              text: 'Konservasi Energi',
            ),
            Tab(
              text: 'Konservasi Air',
            ),
          ],
        ),
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
            await Services().getKonservasiAir();
            await Services().getKonservasiEnergi();
            setState(() {
              isLoading = false;
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
        bottom: TabBar(
          indicatorColor: m1Color,
          labelColor: m1Color,
          unselectedLabelColor: mono3Color,
          labelStyle: mono3TextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 10,
          ),
          tabs: [
            Tab(
              text: 'Konservasi Energi',
            ),
            Tab(
              text: 'Konservasi Air',
            ),
          ],
        ),
      );
    }

    Widget expandableItem({
      required String name,
      required String date,
      required String keterangan,
      required String urlDownload,
    }) {
      return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 7,
            right: 7,
            bottom: 18,
          ),
          child: Column(
            children: [
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Container(
                  padding: const EdgeInsets.only(
                    left: 13,
                    right: 13,
                  ),
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
                        style: mono1TextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                collapsed: Container(),
                expanded: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 13,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Keterangan',
                        style: mono1TextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        '$keterangan',
                        style: mono1TextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextButton(
                        onPressed: () {
                          launchUrl(urlDownload);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: m5Color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              color: m5Color,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.file_download_outlined,
                              color: mono6Color,
                              size: 11,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Download',
                              style: mono6TextStyle.copyWith(
                                fontWeight: semiBold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: mono6Color,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: mono6Color,
          appBar: isSearch == true ? searchAppbar() : konservasiHeader(),
          body: TabBarView(
            children: [
              isLoading
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: FutureBuilder(
                        future: Services().getKonservasiEnergi(
                            search: urlSearch, fitur: 'Konservasi Energi'),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            List<KonservasiEnergiModel> data = snapshot.data;
                            return data.isEmpty
                                ? Center(
                                    child: Text(
                                      'Data tidak ditemukan',
                                      style: mono1TextStyle,
                                    ),
                                  )
                                : ListView(
                                    children: data.map((item) {
                                      return expandableItem(
                                        name: '${item.nAMAKEGIATAN}',
                                        date: '${item.tANGGAL}',
                                        keterangan: '${item.kETERANGAN}',
                                        urlDownload: '${item.fILE}',
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
                    ),
              isLoading
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: FutureBuilder(
                        future: Services().getKonservasiAir(
                            search: urlSearch, fitur: 'Konservasi Air'),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            List<KonservasiAirModel> data = snapshot.data;
                            return data.isEmpty
                                ? Center(
                                    child: Text(
                                      'Data tidak ditemukan',
                                      style: mono1TextStyle,
                                    ),
                                  )
                                : ListView(
                                    children: data.map((item) {
                                      return expandableItem(
                                        name: '${item.nAMAKEGIATAN}',
                                        date: '${item.tANGGAL}',
                                        keterangan: '${item.kETERANGAN}',
                                        urlDownload: '${item.fILE}',
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
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
