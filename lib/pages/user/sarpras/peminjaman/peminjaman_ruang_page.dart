import 'package:adistetsa/models/guru_model.dart';
import 'package:adistetsa/models/karyawan_model.dart';
import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/models/siswa_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/theme.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeminjamanRuangPage extends StatefulWidget {
  @override
  _PeminjamanRuangPageState createState() => _PeminjamanRuangPageState();
}

Object? value1Item;
PlatformFile? file;
FilePickerResult? result;
bool isLoading = false;

class _PeminjamanRuangPageState extends State<PeminjamanRuangPage> {
  TextEditingController nameInput = TextEditingController(text: '');
  TextEditingController phoneInput = TextEditingController(text: '');
  TextEditingController activityInput = TextEditingController(text: '');
  TextEditingController keteranganInput = TextEditingController(text: '');
  String jamAwal = '';
  String jamAkhir = '';

// Note: get date
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

  // Note: get date
  DateTime? selectedDatePengembalian;
  _selectDatePengembalian(BuildContext context) async {
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
    if (picked != null && picked != selectedDatePengembalian)
      setState(() {
        selectedDatePengembalian = picked;
        print(selectedDatePengembalian);
      });
  }

// Note: get time
  TimeOfDay _timeAwal = TimeOfDay.now();
  void onTimeChangedAwal(TimeOfDay newTime) {
    setState(() {
      _timeAwal = newTime;
      jamAwal =
          _timeAwal.toString().replaceAll('TimeOfDay(', '').replaceAll(')', '');
    });
  }

  TimeOfDay _timeAkhir = TimeOfDay.now();
  void onTimeChangedAkhir(TimeOfDay newTime) {
    setState(() {
      _timeAkhir = newTime;
      jamAkhir = _timeAkhir
          .toString()
          .replaceAll('TimeOfDay(', '')
          .replaceAll(')', '');
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
    RolesModel rolesModel = provider.role;
    GuruModel guruModel = provider.guru;
    KaryawanModel karyawanModel = provider.karyawan;
    SiswaModel siswaModel = provider.siswa;

    var role = rolesModel.name;
    var _nama = role == 'Guru'
        ? '${guruModel.nAMALENGKAP}'
        : role == 'Staf Perpustakaan' || role == 'Staf Sarpras'
            ? '${guruModel.nAMALENGKAP}'
            : role == 'Karyawan'
                ? '${karyawanModel.nAMALENGKAP}'
                : role == 'Siswa'
                    ? '${siswaModel.nAMA}'
                    : '';
    var _noHp = role == 'Guru'
        ? '${guruModel.hP}'
        : role == 'Staf Perpustakaan' || role == 'Staf Sarpras'
            ? '${guruModel.hP}'
            : role == 'Karyawan'
                ? '${karyawanModel.hP}'
                : role == 'Siswa'
                    ? '${siswaModel.hP}'
                    : '';
    setState(() {
      nameInput.text = _nama;
      phoneInput.text = _noHp;
    });

    handlePeminjamanRuang() async {
      if (nameInput.text == '' ||
          phoneInput.text == '' ||
          activityInput.text == '' ||
          selectedDate == null ||
          jamAwal == '' ||
          jamAkhir == '' ||
          keteranganInput.text == '' ||
          file == null ||
          value1Item == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: dangerColor,
            content: Text(
              'Anda belum melengkapi form yang tersedia',
              textAlign: TextAlign.center,
            )));
      } else if(jamAwal == jamAkhir){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: dangerColor,
            content: Text(
              'Jam awal dan jam berakhir pinjaman tidak bisa sama',
              textAlign: TextAlign.center,
            )));
      } 
      else {
        setState(() {
          isLoading = true;
        });
        if (await Services().pengajuanPeminjamanRuang(
            nama: nameInput.text,
            noTelp: phoneInput.text,
            ruang: provider.ruangChart!.iD.toString(),
            kegiatan: activityInput.text,
            tanggalPenggunaan: selectedDate.toString().split(' ')[0],
            tanggalPengembalian:
                selectedDatePengembalian.toString().split(' ')[0],
            jamPenggunaan: jamAwal,
            jamBerakhir: jamAkhir,
            kategori: value1Item.toString(),
            keterangan: keteranganInput.text,
            filepath: file != null ? file!.path : null)) {
          setState(() {
            nameInput.text = '';
            phoneInput.text = '';
            provider.ruangChart = null;
            provider.idRuang = '';
            activityInput.text = '';
            selectedDate = null;
            selectedDatePengembalian = null;
            jamAwal = '';
            jamAkhir = '';
            value1Item = null;
            keteranganInput.text = '';
            file = null;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: successColor,
              content: Text(
                'Anda berhasil meminjam ruangan',
                textAlign: TextAlign.center,
              )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: dangerColor,
              content: Text(
                'Anda gagal meminjam ruangan',
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
          'Peminjaman Ruang',
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
              nameInput.text = '';
              phoneInput.text = '';
              activityInput.text = '';
              selectedDate = null;
              selectedDatePengembalian = null;
              jamAwal = '';
              jamAkhir = '';
              value1Item = null;
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
      required String namaRuang,
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
                namaRuang,
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
              child: GestureDetector(
                onTap: () {
                  provider.deleteRuang(id: int.parse(id));
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
            'Belum ada data ruang',
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
              'Ruang',
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
                            'Nama Ruang',
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
            children: [
              contentTable(
                id: '${provider.ruangChart!.iD}',
                no: 1,
                namaRuang: '${provider.ruangChart!.nAMA}',
              )
            ]),
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
            Navigator.pushNamed(context, '/user/sarpras/katalog-ruang-page');
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
                'Tambah Ruang',
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
                enabled: false,
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
                enabled: false,
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

    Widget inputPengembalian() {
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
              'Tanggal Pengembalian',
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
                _selectDatePengembalian(context);
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
                      selectedDatePengembalian == null
                          ? 'Tanggal'
                          : selectedDatePengembalian!.toString().split(' ')[0],
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

    Widget inputJam() {
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
              'Jam',
              style: mono1TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        showPicker(
                          accentColor: p2Color,
                          unselectedColor: mono3Color,
                          cancelStyle: p1TextStyle,
                          okStyle: p1TextStyle,
                          context: context,
                          value: _timeAwal,
                          onChange: onTimeChangedAwal,
                          minuteInterval: MinuteInterval.FIVE,
                          // Optional onChange to receive value as DateTime
                          onChangeDateTime: (DateTime dateTime) {
                            print(dateTime);
                          },
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(color: p1Color),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        jamAwal == '' ? 'Jam Awal' : jamAwal,
                        style: p1TextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '-',
                    style: mono1TextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        showPicker(
                          accentColor: p2Color,
                          unselectedColor: mono3Color,
                          cancelStyle: p1TextStyle,
                          okStyle: p1TextStyle,
                          context: context,
                          value: _timeAkhir,
                          onChange: onTimeChangedAkhir,
                          minuteInterval: MinuteInterval.FIVE,
                          // Optional onChange to receive value as DateTime
                          onChangeDateTime: (DateTime dateTime) {
                            print(dateTime);
                          },
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(color: p1Color),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        jamAkhir == '' ? 'Jam Akhir' : jamAkhir,
                        style: p1TextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
              color: p1Color,
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
                  value1Item = null;
                });
              },
              child: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: p1Color,
                ),
                hint: Text(
                  hint,
                  style: mono3TextStyle.copyWith(
                    color: p1Color,
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
        margin: EdgeInsets.only(bottom: 20),
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
                    'Jangka Pendek',
                    'Jangka Panjang',
                  ],
                ),
              ],
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
            onPressed: () {
              handlePeminjamanRuang();
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
          nameInput.text = '';
          phoneInput.text = '';
          activityInput.text = '';
          selectedDate = null;
          selectedDatePengembalian = null;
          jamAwal = '';
          jamAkhir = '';
          value1Item = null;
          keteranganInput.text = '';
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
              provider.ruangChart != null ? tabelPeminjam() : emptyTable(),
              buttonAdd(),
              inputNama(),
              inputNoHp(),
              listKategori(),
              inputKegiatan(),
              inputTanggal(),
              value1Item == 'Jangka Panjang'
                  ? inputPengembalian()
                  : Container(),
              inputJam(),
              inputKeterangan(),
              buttonfileTTD(),
              buttonSubmit(),
            ],
          )),
    );
  }
}
