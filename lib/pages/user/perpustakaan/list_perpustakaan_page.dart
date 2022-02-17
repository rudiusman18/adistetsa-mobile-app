import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ListPerpustakaanPage extends StatefulWidget {
  @override
  _ListPerpustakaanPageState createState() => _ListPerpustakaanPageState();
}

class _ListPerpustakaanPageState extends State<ListPerpustakaanPage> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget perpustakaanAppbar() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Perpustakaan',
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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/staff-perpus/katalog-buku-page');
            },
            child: contentItem(
              'Katalog Buku',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, '/user/perpustakaan/peminjaman-buku-page');
            },
            child: contentItem(
              'Peminjaman',
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
                    'Riwayat',
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
                          'Pengajuan',
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
                          'Peminjaman',
                          style: mono1TextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: mono3Color,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
