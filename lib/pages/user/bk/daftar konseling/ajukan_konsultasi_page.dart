import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class AjukanKonsultasiPage extends StatefulWidget {
  @override
  _AjukanKonsultasiPageState createState() => _AjukanKonsultasiPageState();
}

class _AjukanKonsultasiPageState extends State<AjukanKonsultasiPage> {
  String jamAwal = '';
  Object? value1Item;
  String jamAkhir = '';

  bool isLoading = false;

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
        print(DateTime.now().toString().split(' ')[1].split(':')[0]);
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
    Providers provider = Provider.of(context);
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Pengajuan Konseling',
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
              'Tanggal Konsultasi',
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
                            print((jamAwal.toString().split(':')[0]));
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

    Widget inputJenisMasalah() {
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
                  'Jenis Masalah',
                  style: mono1TextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                dropdownList1(
                  hint: 'Jenis Masalah',
                  item: [
                    'Karier',
                    'Pribadi',
                    'Sosial',
                    'Belajar',
                  ],
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
          top: 60,
          left: 20,
          right: 20,
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
              if (selectedDate != null &&
                      jamAwal != '' &&
                      jamAkhir != '' &&
                      value1Item != null //&&
                  // int.parse(selectedDate
                  //         .toString()
                  //         .split(' ')[0]
                  //         .split('-')[2]) >=
                  //     int.parse(DateTime.now()
                  //         .toString()
                  //         .split(' ')[0]
                  //         .split('-')[2]) &&
                  // int.parse(jamAwal.toString().split(':')[0]) >=
                  //     int.parse(DateTime.now()
                  //         .toString()
                  //         .split(' ')[1]
                  //         .split(':')[0]) &&
                  // int.parse(jamAwal.toString().split(':')[1]) >=
                  //     int.parse(DateTime.now()
                  //         .toString()
                  //         .split(' ')[1]
                  //         .split(':')[1])
                  ) {
                try {
                  setState(() {
                    isLoading = true;
                  });
                  await Services().postPengajuanKonseling(
                    id: provider.idStaff,
                    tanggal: selectedDate!.toString().split(' ')[0],
                    jamAwal: jamAwal,
                    jamAkhir: jamAkhir,
                    jenisMasalah: value1Item.toString(),
                  );
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: dangerColor,
                      content: Text(
                        '$e',
                        textAlign: TextAlign.center,
                      )));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: dangerColor,
                    content: Text(
                      'Anda harus mengisi semua form yang tersedia atau anda melakukan input tanggal atau waktu yang salah',
                      textAlign: TextAlign.center,
                    )));
              }
            },
            child: isLoading == false
                ? Text(
                    'Ajukan Konsultasi',
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

    return Scaffold(
        backgroundColor: mono6Color,
        appBar: header(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView(
            children: [
              inputTanggal(),
              inputJam(),
              inputJenisMasalah(),
              buttonSubmit(),
            ],
          ),
        ));
  }
}
