import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PeminjamanBukuUserPage extends StatefulWidget {
  @override
  State<PeminjamanBukuUserPage> createState() => _PeminjamanBukuUserPageState();
}

class _PeminjamanBukuUserPageState extends State<PeminjamanBukuUserPage> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();

  Object? value1Item;

  bool flag1 = false;
  bool isLoading = false;
  PlatformFile? file;
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    int index = 0;
    int posisi = -1;

    Providers provider = Provider.of<Providers>(context);
    RolesModel rolesModel = provider.role;

    _selectFolder() async {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        setState(() {
          file = result!.files.first;
        });
      } else {}
    }

    handlePinjam() async {
      setState(() {
        isLoading = true;
      });
      if (rolesModel.name == 'Guru') {
        if (await Services().setPengajuanBuku(
            buku: provider.idBuku,
            tanggalPengajuan:
                DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
            jangkaPeminjaman: value1Item.toString(),
            filepath: file == null ? null : file!.path)) {
          setState(() {
            provider.idBuku.clear();
            provider.listKatalog.clear();
            value1Item = null;
            file = null;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: successColor,
                content: Text(
                  'Berhasil melakukan peminjaman',
                  textAlign: TextAlign.center,
                )));
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: dangerColor,
              content: Text(
                'Gagal Melakukan Peminjaman',
                textAlign: TextAlign.center,
              )));
        }
      } else if (rolesModel.name == 'Siswa') {
        if (await Services().setPengajuanBuku(
            buku: provider.idBuku,
            tanggalPengajuan:
                DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
            jangkaPeminjaman: value1Item.toString(),
            filepath: file == null ? null : file!.path)) {
          setState(() {
            provider.idBuku.clear();
            provider.listKatalog.clear();
            value1Item = null;
            file = null;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: successColor,
                content: Text(
                  'Berhasil melakukan peminjaman',
                  textAlign: TextAlign.center,
                )));
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: dangerColor,
              content: Text(
                'Gagal Melakukan Peminjaman',
                textAlign: TextAlign.center,
              )));
        }
      }

      setState(() {
        isLoading = false;
      });
    }

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
      required int id,
      required int no,
      required String mataPelajaran,
      required String register,
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
              child: Text(
                register,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2,
              ),
              child: GestureDetector(
                onTap: () => provider.deleteBooks(id: id),
                child: Icon(Icons.delete_outline, color: mono3Color),
              ),
            ),
          ),
        ],
      );
    }

    Widget emptyTable() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
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

    Widget tableHeader() {
      return Column(
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
            ),
            child: Table(
              border: TableBorder.all(
                color: mono6Color,
              ),
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(40),
                1: FlexColumnWidth(140),
                2: FixedColumnWidth(96),
                3: FixedColumnWidth(53),
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
                            'Register',
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
                            'opsi',
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
          ),
        ],
      );
    }

    Widget tabelPeminjam() {
      return Container(
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
            2: FixedColumnWidth(96),
            3: FixedColumnWidth(53),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          children: provider.listKatalog.map((book) {
            index++;
            posisi++;
            return contentTable(
              id: posisi,
              no: index,
              mataPelajaran: book.jUDUL.toString(),
              register: book.rEGISTER.toString(),
            );
          }).toList(),
        ),
      );
    }

    Widget dropdownList1({required String hint, required List item}) {
      return Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: flag1 == true && value1Item != null ? p1Color : mono3Color,
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
                  color: flag1 == true && value1Item != null
                      ? p1Color
                      : mono3Color,
                ),
                hint: Text(
                  hint,
                  style: mono3TextStyle.copyWith(
                    color: flag1 == true && value1Item != null
                        ? p1Color
                        : mono3Color,
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
                    file = null;
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
          onPressed: () {
            Navigator.pushNamed(
                context, '/user/perpustakaan/peminjaman-buku/list-buku-page');
          },
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
                  onPressed: () {
                    _selectFolder();
                  },
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
                        (file == null) ? 'Pilih File' : file!.name.toString(),
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
          onPressed: () {
            file!.extension == 'pdf'
                ? handlePinjam()
                : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: dangerColor,
                    content: Text(
                      'Format File Tidak Didukung',
                      textAlign: TextAlign.center,
                    )));
          },
          child: isLoading == false
              ? Text(
                  'Ajukan Peminjaman',
                  style: mono6TextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16,
                  ),
                )
              : Container(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    color: mono6Color,
                    strokeWidth: 4,
                  ),
                ),
        ),
      );
    }

    // ignore: unused_element

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              tableHeader(),
              provider.listKatalog.isNotEmpty ? tabelPeminjam() : emptyTable(),
              buttonAdd(),
              listKategori(),
              value1Item == 'Jangka Panjang' ? buttonfileTTD() : Text(''),
              provider.listKatalog.isNotEmpty &&
                      value1Item != null &&
                      (value1Item == 'Jangka Panjang'
                          ? file != null
                          : file == null)
                  ? buttonSubmit()
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
