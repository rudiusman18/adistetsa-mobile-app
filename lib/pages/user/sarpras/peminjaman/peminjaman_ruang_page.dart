import 'package:adistetsa/theme.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';

class PeminjamanRuangPage extends StatefulWidget {
  @override
  _PeminjamanRuangPageState createState() => _PeminjamanRuangPageState();
}

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

  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono2Color,
        ),
      );
    }

    TableRow contentTable({
      required int id,
      required int no,
      required String namaRuang,
      required String kodeRuang,
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
              child: Text(
                kodeRuang,
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
                onTap: () {},
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
                            'Kode Ruang',
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
            for (var i = 0; i < 10; i++)
              contentTable(
                id: 0,
                no: i + 1,
                namaRuang: 'Kamar Mandi',
                kodeRuang: '12345',
              ),
          ],
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
                keyboardType: TextInputType.phone,
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
            )),
      );
    }

    return Scaffold(
        backgroundColor: mono6Color,
        appBar: header(),
        body: ListView(
          children: [
            tableHeader(),
            tabelPeminjam(),
            // emptyTable(),
            buttonAdd(),
            inputNama(),
            inputNoHp(),
            inputKegiatan(),
            inputTanggal(),
            inputJam(),
            inputKeterangan(),
            buttonfileTTD(),
            buttonSubmit(),
          ],
        ));
  }
}
