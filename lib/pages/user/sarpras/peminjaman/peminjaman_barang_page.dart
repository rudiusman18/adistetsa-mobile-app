import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeminjamanBarangPage extends StatefulWidget {
  @override
  _PeminjamanBarangPageState createState() => _PeminjamanBarangPageState();
}

PlatformFile? file;
FilePickerResult? result;
bool isLoading = false;

class _PeminjamanBarangPageState extends State<PeminjamanBarangPage> {
  TextEditingController nameInput = TextEditingController(text: '');
  TextEditingController phoneInput = TextEditingController(text: '');
  TextEditingController activityInput = TextEditingController(text: '');
  TextEditingController keteranganInput = TextEditingController(text: '');

  DateTime? selectedDate;
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData().copyWith(
            colorScheme: ColorScheme.light(
              primary: p2Color,
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        print(selectedDate);
      });
  }

  _selectFolder() async {
    result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        file = result!.files.first;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);

    var index = 0;

    handlePeminjamanBarang() async {
      if (nameInput.text == '' ||
          phoneInput.text == '' ||
          activityInput.text == '' ||
          selectedDate == null ||
          keteranganInput.text == '' ||
          file == null ||
          provider.barangChart.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: dangerColor,
            content: Text(
              'Anda belum melengkapi form yang tersedia',
              textAlign: TextAlign.center,
            )));
      } else {
        setState(() {
          isLoading = true;
        });

        if (await Services().pengajuanPeminjamanBarang(
            nama: nameInput.text,
            noTelp: phoneInput.text,
            barang: provider.idBarang,
            kegiatan: activityInput.text,
            tanggal: selectedDate.toString().split(' ')[0],
            keterangan: keteranganInput.text,
            filepath: file != null ? file!.path : null)) {
          setState(() {
            nameInput.text = '';
            phoneInput.text = '';
            activityInput.text = '';
            selectedDate = null;
            keteranganInput.text = '';
            file = null;
            provider.barangChart = [];
            provider.idBarang = [];
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: successColor,
              content: Text(
                'Anda berhasil meminjam barang',
                textAlign: TextAlign.center,
              )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: dangerColor,
              content: Text(
                'Anda gagal meminjam barang',
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
          'Peminjaman Barang',
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
            setState(() {
              isLoading = false;
              nameInput.text = '';
              phoneInput.text = '';
              activityInput.text = '';
              selectedDate = null;
              keteranganInput.text = '';
              file = null;
            });
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono2Color,
        ),
      );
    }

    TableRow contentTable({
      required String id,
      required int no,
      required String namaBarang,
      required String kodeBarang,
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
                namaBarang,
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
                kodeBarang,
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
                onTap: () {
                  provider.deleteBarang(id: int.parse(id));
                },
                child: Icon(Icons.delete_outline, color: mono3Color),
              ),
            ),
          ),
        ],
      );
    }

    // ignore: unused_element
    Widget emptyTable() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          bottom: 20,
        ),
        child: Center(
          child: Text(
            'Belum ada data barang',
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
              'Barang',
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
                            'Nama Barang',
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
                            'Kode Barang',
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
          children: provider.barangChart.map((item) {
            index++;
            return contentTable(
              id: '${item.iD}',
              no: index,
              namaBarang: '${item.nAMA}',
              kodeBarang: '${item.iD}',
            );
          }).toList(),
        ),
      );
    }

    Widget buttonAdd() {
      return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
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
            Navigator.pushNamed(context, '/user/sarpras/katalog-barang-page');
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
                'Tambah Barang',
                style: mono6TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget inputNama() {
      return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama',
              style: mono1TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(
                12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: p1Color,
                ),
              ),
              child: TextFormField(
                controller: nameInput,
                decoration: InputDecoration.collapsed(
                  hintText: 'Nama',
                  hintStyle: p1TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                style: p1TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputNoHp() {
      return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'No Hp',
              style: mono1TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(
                12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: p1Color,
                ),
              ),
              child: TextFormField(
                controller: phoneInput,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration.collapsed(
                  hintText: 'No Hp',
                  hintStyle: p1TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                style: p1TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputKegiatan() {
      return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kegiatan',
              style: mono1TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(
                12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: p1Color,
                ),
              ),
              child: TextFormField(
                controller: activityInput,
                decoration: InputDecoration.collapsed(
                  hintText: 'Kegiatan',
                  hintStyle: p1TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                style: p1TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputTanggal() {
      return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal Penggunaan',
              style: mono1TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                _selectDate(context);
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(color: p1Color),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? 'Tanggal'
                          : selectedDate!.toString().split(' ')[0],
                      style: p1TextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today_rounded,
                    color: p1Color,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget inputKeterangan() {
      return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Keterangan',
              style: mono1TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(
                12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: p1Color,
                ),
              ),
              child: TextFormField(
                controller: keteranganInput,
                decoration: InputDecoration.collapsed(
                  hintText: 'Keterangan',
                  hintStyle: p1TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                style: p1TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ],
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
                  Flexible(
                    child: Text(
                      (file == null) ? 'Pilih File' : file!.name.toString(),
                      style: mono6TextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
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
            onPressed: () async {
              handlePeminjamanBarang();
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
                      strokeWidth: 2,
                      color: mono6Color,
                    ),
                  )),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          isLoading = false;
          file = null;
        });
        return true;
      },
      child: Scaffold(
          backgroundColor: mono6Color,
          appBar: header(),
          body: ListView(
            children: [
              tableHeader(),
              provider.barangChart.isNotEmpty ? tabelPeminjam() : emptyTable(),
              buttonAdd(),
              inputNama(),
              inputNoHp(),
              inputKegiatan(),
              inputTanggal(),
              inputKeterangan(),
              buttonfileTTD(),
              buttonSubmit(),
            ],
          )),
    );
  }
}
