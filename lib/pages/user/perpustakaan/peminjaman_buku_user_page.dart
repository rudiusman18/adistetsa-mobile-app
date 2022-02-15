import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class PeminjamanBukuUserPage extends StatefulWidget {
  @override
  State<PeminjamanBukuUserPage> createState() => _PeminjamanBukuUserPageState();
}

class _PeminjamanBukuUserPageState extends State<PeminjamanBukuUserPage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();

  Object? value1Item;

  bool flag1 = false;

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Detail Peminjaman',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        iconTheme: IconThemeData(
          color: mono1Color,
        ),
      );
    }

    TableRow contentTable({
      required int no,
      required String mataPelajaran,
      required String registrasi,
    }) {
      return TableRow(
        children: [
          Container(
            child: Text(
              no.toString(),
              style: mono1TextStyle.copyWith(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2,
              ),
              child: Text(
                mataPelajaran,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    registrasi,
                    style: mono1TextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget tabelPeminjam() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Daftar Buku',
                style: mono1TextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 10,
                left: 26,
                right: 27,
                bottom: 20,
              ),
              child: Table(
                border: TableBorder.all(
                  color: mono6Color,
                ),
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(40),
                  1: FlexColumnWidth(140),
                  2: FixedColumnWidth(140),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: [
                  // Table Heading
                  TableRow(
                    children: [
                      Container(
                        height: 30,
                        color: m4Color,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No.',
                              style: mono6TextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        color: m4Color,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Mata Pelajaran',
                              style: mono6TextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        color: m4Color,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Registrasi',
                              style: mono6TextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  contentTable(
                    no: 1,
                    mataPelajaran: 'Bahasa Indonesia',
                    registrasi: '123456',
                  ),
                  contentTable(
                    no: 2,
                    mataPelajaran: 'Fisika',
                    registrasi: '12312',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget dropdownList1({required String hint, required List item}) {
      return Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: flag1 == true ? p1Color : mono3Color,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: DropdownButtonHideUnderline(
            child: GestureDetector(
              onLongPress: () {
                setState(() {
                  flag1 = false;
                  value1Item = null;
                });
              },
              child: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: flag1 == true ? p1Color : mono3Color,
                ),
                hint: Text(
                  hint,
                  style: mono3TextStyle.copyWith(
                    color: flag1 == true ? p1Color : mono3Color,
                    fontSize: 12,
                  ),
                ),
                dropdownColor: mono6Color,
                elevation: 2,
                value: value1Item,
                items: item.map(
                  (value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: mono3TextStyle.copyWith(
                          color: value1Item == value ? p1Color : mono1Color,
                          fontWeight: regular,
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    print(value);
                    flag1 = true;
                    value1Item = value;
                  });
                },
              ),
            ),
          ));
    }

    Widget listKategori() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 20,
          bottom: value1Item == 'Jangka panjang' ? 32 : 40,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kategori',
                  style: mono1TextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                dropdownList1(
                  hint: 'Kategori',
                  item: [
                    'Jangka Panjang',
                    'Jangka Pendek',
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget buttonAdd() {
      return Container(
        margin: EdgeInsets.only(
          left: 26,
          right: 28,
          bottom: 20,
        ),
        height: 36,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            side: BorderSide(
              color: m4Color,
              width: 2,
            ),
            backgroundColor: m4Color,
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline_outlined,
                size: 20,
                color: mono6Color,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                'Tambah Buku',
                style: mono6TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget buttonfileTTD() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 40,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'File TTD Pengajuan',
                  style: mono1TextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: m5Color,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: 20,
                        color: mono6Color,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Pilih File',
                        style: mono6TextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget buttonSubmit() {
      return Container(
        margin: EdgeInsets.only(
          left: 46,
          right: 45,
          bottom: 20,
        ),
        height: 46,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(
              color: m2Color,
              width: 2,
            ),
            backgroundColor: m2Color,
          ),
          onPressed: () {},
          child: Text(
            'Ajukan Peminjaman',
            style: mono6TextStyle.copyWith(
              fontWeight: bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    // ignore: unused_element
    Widget emptyTable() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Center(
          child: Text(
            'Belum ada data buku',
            style: mono1TextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              tabelPeminjam(),
              // emptyTable(), untuk tampilan tabel kosong
              buttonAdd(),
              listKategori(),
              value1Item == 'Jangka Panjang' ? buttonfileTTD() : Text(''),
              buttonSubmit(),
            ],
          ),
        ),
      ),
    );
  }
}
