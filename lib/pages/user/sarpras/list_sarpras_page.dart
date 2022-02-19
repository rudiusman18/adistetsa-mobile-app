import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ListSarprasPage extends StatefulWidget {
  @override
  _ListSarprasPageState createState() => _ListSarprasPageState();
}

class _ListSarprasPageState extends State<ListSarprasPage> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget perpustakaanAppbar() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Sarana dan Prasarana',
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
          color: mono2Color,
        ),
      );
    }

    Widget contentItem(String text) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        padding: EdgeInsets.only(
          bottom: 17,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: mono1TextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              thickness: 0.5,
              color: mono3Color,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: perpustakaanAppbar(),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          ExpandableNotifier(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Text(
                      'Katalog',
                      style: mono1TextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/user/sarpras/katalog-barang-page');
                          },
                          child: Text(
                            'Barang',
                            style: mono1TextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/user/sarpras/katalog-ruang-page');
                          },
                          child: Text(
                            'Ruang',
                            style: mono1TextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: mono3Color,
                  ),
                ],
              ),
            ),
          ),
          ExpandableNotifier(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Text(
                      'Peminjaman',
                      style: mono1TextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context,
                                '/user/perpustakaan/riwayat-pengajuan-buku-page');
                          },
                          child: Text(
                            'Barang',
                            style: mono1TextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context,
                                '/user/perpustakaan/riwayat-peminjaman-buku-page');
                          },
                          child: Text(
                            'Ruang',
                            style: mono1TextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: mono3Color,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, '/user/perpustakaan/peminjaman-buku-page');
            },
            child: contentItem(
              'Pengajuan Peminjaman',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, '/user/perpustakaan/peminjaman-buku-page');
            },
            child: contentItem(
              'Riwayat Peminjaman',
            ),
          ),
        ],
      ),
    );
  }
}
