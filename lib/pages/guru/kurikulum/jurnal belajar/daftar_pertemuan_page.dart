import 'package:adistetsa/theme.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DaftarPertemuanPage extends StatefulWidget {
  @override
  State<DaftarPertemuanPage> createState() => _DaftarPertemuanPageState();
}

class _DaftarPertemuanPageState extends State<DaftarPertemuanPage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();
  String urlSearch = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget daftarPertemuanHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Daftar Pertemuan',
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

    Widget nameCard({
      required String name,
      required String mataPelajaran,
      required String kelas,
      required String semester,
    }) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: 34,
          vertical: 22,
        ),
        padding: EdgeInsets.only(
          top: 8,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: m4Color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Text(
              name,
              style: mono6TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              mataPelajaran,
              style: mono6TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              kelas,
              style: mono6TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              semester,
              style: mono6TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 10,
              ),
            ),
          ],
        ),
      );
    }

    Widget expandList({
      required String header,
      required String content,
      required int? id,
    }) {
      return ExpandableNotifier(
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
                header,
                style: mono1TextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              collapsed: Container(),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 21),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deskripsi Materi : ',
                          style: mono1TextStyle.copyWith(
                            fontSize: 10,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        Expanded(
                          child: Text(
                            content,
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Dokumentasi',
                    style: mono1TextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Image.asset(
                    'assets/dokumentasi_icon.png',
                    width: 52,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: m5Color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context,
                              '/guru/kurikulum/list-jurnal-belajar/lihat-jadwal/presensi-page');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: mono6Color,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Presensi Siswa',
                              style: mono6TextStyle.copyWith(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
          ],
        ),
      ));
    }

    return Scaffold(
        appBar: isSearch ? searchAppbar() : daftarPertemuanHeader(),
        backgroundColor: mono6Color,
        body: Column(
          children: [
            nameCard(
              name: 'Syauqi Babi',
              mataPelajaran: 'Penyusup',
              kelas: 'XII IPA A - 2021/2022',
              semester: 'Semester 12',
            ),
            Expanded(
              child: ListView(
                children: [
                  for (var i = 0; i < 20; i++)
                    expandList(
                      header: 'Pertemuan ke ' + (i + 1).toString(),
                      content:
                          'Materi tentang bahasa indonesia menjelaskan pribahasa hiperbola dan membuat majas.',
                      id: 0,
                    ),
                ],
              ),
            ),
          ],
        ));
  }
}