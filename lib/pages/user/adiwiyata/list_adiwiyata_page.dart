import 'package:adistetsa/providers/provider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class ListAdiwiyataPage extends StatefulWidget {
  @override
  State<ListAdiwiyataPage> createState() => _ListAdiwiyataPageState();
}

class _ListAdiwiyataPageState extends State<ListAdiwiyataPage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    PreferredSizeWidget listAdiwiyataHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Adiwiyata',
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
            Navigator.pushNamedAndRemoveUntil(
                context, '/main-page/back', (route) => false);
          },
          icon: Icon(Icons.arrow_back),
          color: mono1Color,
        ),
      );
    }

    Widget contentItem(String text, String url) {
      return GestureDetector(
        onTap: () {
          provider.setfiturAdiwiyata = text;
          Navigator.pushNamed(context, '$url');
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 7,
          ),
          padding: EdgeInsets.only(
            bottom: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 7,
                ),
                child: Text(
                  text,
                  style: mono1TextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
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

    Widget expandableItemPengelolaanSampah() {
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
                  iconPadding: EdgeInsets.only(
                    bottom: 15,
                    right: 19,
                  ),
                ),
                header: Container(
                  padding: const EdgeInsets.only(
                    left: 7,
                    right: 7,
                    bottom: 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pengelolaan Sampah',
                        style: mono1TextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                collapsed: Container(),
                expanded: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 7,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.setfiturAdiwiyata = '3R';
                          Navigator.pushNamed(
                              context, '/user/adiwiyata/pengelolaan-sampah');
                        },
                        child: Text(
                          '3R',
                          style: mono1TextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.setfiturAdiwiyata = 'Pengolahan Sampah';
                          Navigator.pushNamed(
                              context, '/user/adiwiyata/pengelolaan-sampah');
                        },
                        child: Text(
                          'Pengolahan Sampah',
                          style: mono1TextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.setfiturAdiwiyata = 'Tabungan Sampah';
                          Navigator.pushNamed(
                              context, '/user/adiwiyata/pengelolaan-sampah');
                        },
                        child: Text(
                          'Tabungan Sampah',
                          style: mono1TextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
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

    Widget expandableItemPemeliharaanPohon() {
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
                  iconPadding: EdgeInsets.only(
                    bottom: 15,
                    right: 19,
                  ),
                ),
                header: Container(
                  padding: const EdgeInsets.only(
                    left: 7,
                    right: 7,
                    bottom: 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pemeliharaan Pohon',
                        style: mono1TextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                collapsed: Container(),
                expanded: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 7,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.setfiturAdiwiyata = 'Pembibitan Pohon';
                          Navigator.pushNamed(
                              context, '/user/adiwiyata/pemeliharaan-pohon');
                        },
                        child: Text(
                          'Pembibitan Pohon',
                          style: mono1TextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.setfiturAdiwiyata = 'Penanaman Pohon';
                          Navigator.pushNamed(
                              context, '/user/adiwiyata/pemeliharaan-pohon');
                        },
                        child: Text(
                          'Penanaman Pohon',
                          style: mono1TextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.setfiturAdiwiyata = 'Pemeliharaan Pohon';
                          Navigator.pushNamed(
                              context, '/user/adiwiyata/pemeliharaan-pohon');
                        },
                        child: Text(
                          'Pemeliharaan Pohon',
                          style: mono1TextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
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

    Widget expandableItemPRLH() {
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
                  iconPadding: EdgeInsets.only(
                    bottom: 15,
                    right: 19,
                  ),
                ),
                header: Container(
                  padding: const EdgeInsets.only(
                    left: 7,
                    right: 7,
                    bottom: 18,
                  ),
                  child: Text(
                    'PRLH ',
                    style: mono1TextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                collapsed: Container(),
                expanded: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 7,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.setfiturAdiwiyata = 'Karya Inovatif PRLH';
                          Navigator.pushNamed(
                              context, '/user/adiwiyata/karya-inovatif-prlh');
                        },
                        child: Text(
                          'Karya Inovatif',
                          style: mono1TextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.setfiturAdiwiyata = 'Penerapan PRLH';
                          Navigator.pushNamed(
                              context, '/user/adiwiyata/penerapan-prlh');
                        },
                        child: Text(
                          'Penerapan',
                          style: mono1TextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
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

    Widget expandableItemkader() {
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
                  iconPadding: EdgeInsets.only(
                    bottom: 15,
                    right: 19,
                  ),
                ),
                header: Container(
                  padding: const EdgeInsets.only(
                    left: 7,
                    right: 7,
                    bottom: 18,
                  ),
                  child: Text(
                    'Kader',
                    style: mono1TextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                collapsed: Container(),
                expanded: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 7,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/user/adiwiyata/kader');
                        },
                        child: Text(
                          'Data Kader',
                          style: mono1TextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.setfiturAdiwiyata = 'Kegiatan Kader';
                          Navigator.pushNamed(
                              context, '/user/adiwiyata/kegiatan-kader');
                        },
                        child: Text(
                          'Kegiatan Kader',
                          style: mono1TextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
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

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: listAdiwiyataHeader(),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          contentItem(
            'Sanitasi Drainase',
            '/user/adiwiyata/sanitasi-drainase',
          ),
          expandableItemPengelolaanSampah(),
          expandableItemPemeliharaanPohon(),
          contentItem(
            'Konservasi',
            '/user/adiwiyata/konservasi',
          ),
          expandableItemPRLH(),
          expandableItemkader(),
          contentItem(
            'Jejaring Kerja',
            '/user/adiwiyata/jejaring-kerja',
          ),
          contentItem(
            'Publikasi',
            '/user/adiwiyata/publikasi',
          ),
        ],
      )),
    );
  }
}
