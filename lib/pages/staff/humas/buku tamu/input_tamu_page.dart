import 'package:adistetsa/providers/provider.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class InputTamuPage extends StatefulWidget {
  InputTamuPage({Key? key}) : super(key: key);

  @override
  State<InputTamuPage> createState() => _InputTamuPageState();
}

class _InputTamuPageState extends State<InputTamuPage> {
  TextEditingController nameInput = TextEditingController(text: '');
  FocusNode nameFocusNode = new FocusNode();
  bool isActiveInputName = false;

  TextEditingController instansiInput = TextEditingController(text: '');
  FocusNode instansiFocusNode = new FocusNode();
  bool isActiveInputInstansi = false;

  TextEditingController alamatInput = TextEditingController(text: '');
  FocusNode alamatFocusNode = new FocusNode();
  bool isActiveInputAlamat = false;

  TextEditingController nohpInput = TextEditingController(text: '');
  FocusNode nohpFocusNode = new FocusNode();
  bool isActiveInputnohp = false;

  TextEditingController keperluanInput = TextEditingController(text: '');
  FocusNode keperluanFocusNode = new FocusNode();
  bool isActiveInputKeperluan = false;

  Object? value1Item;
  bool flag1 = false;

  Object? value2Item;
  bool flag2 = false;

  bool isLoading = false;

  DateTime? selectedDate;
  bool isActivedate = false;
  bool isActivejam = false;
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
  String jam = '';
  TimeOfDay _timeAwal = TimeOfDay.now();
  void onTimeChangedAwal(TimeOfDay newTime) {
    setState(() {
      _timeAwal = newTime;
      jam =
          _timeAwal.toString().replaceAll('TimeOfDay(', '').replaceAll(')', '');
    });
  }

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);

    PreferredSizeWidget inputTamuHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Tambah Data',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono1Color,
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
                  color: nameFocusNode.hasFocus || isActiveInputName == true
                      ? p1Color
                      : mono3Color,
                ),
              ),
              child: GestureDetector(
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      isActiveInputName = true;
                      isActiveInputInstansi = false;
                      isActiveInputAlamat = false;
                      isActiveInputnohp = false;
                      isActiveInputKeperluan = false;
                      isActivedate = false;
                      isActivejam = false;
                    });
                  },
                  focusNode: nameFocusNode,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      isActiveInputName = false;
                    });
                  },
                  controller: nameInput,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Nama',
                    hintStyle: p1TextStyle.copyWith(
                      fontSize: 12,
                      color: nameFocusNode.hasFocus || isActiveInputName == true
                          ? p1Color
                          : mono3Color,
                    ),
                  ),
                  style: p1TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputInstansi() {
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
              'Instansi Asal',
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
                  color: instansiFocusNode.hasFocus ||
                          isActiveInputInstansi == true
                      ? p1Color
                      : mono3Color,
                ),
              ),
              child: GestureDetector(
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      isActiveInputName = false;
                      isActiveInputInstansi = true;
                      isActiveInputAlamat = false;
                      isActiveInputnohp = false;
                      isActiveInputKeperluan = false;
                      isActivedate = false;
                      isActivejam = false;
                    });
                  },
                  focusNode: instansiFocusNode,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      isActiveInputInstansi = false;
                    });
                  },
                  controller: instansiInput,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Instansi Asal',
                    hintStyle: p1TextStyle.copyWith(
                      fontSize: 12,
                      color: instansiFocusNode.hasFocus ||
                              isActiveInputInstansi == true
                          ? p1Color
                          : mono3Color,
                    ),
                  ),
                  style: p1TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputAlamat() {
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
              'Alamat',
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
                  color: alamatFocusNode.hasFocus || isActiveInputAlamat == true
                      ? p1Color
                      : mono3Color,
                ),
              ),
              child: GestureDetector(
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      isActiveInputName = false;
                      isActiveInputInstansi = false;
                      isActiveInputAlamat = true;
                      isActiveInputnohp = false;
                      isActiveInputKeperluan = false;
                      isActivedate = false;
                      isActivejam = false;
                    });
                  },
                  focusNode: alamatFocusNode,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      isActiveInputAlamat = false;
                    });
                  },
                  controller: alamatInput,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Alamat',
                    hintStyle: p1TextStyle.copyWith(
                      fontSize: 12,
                      color: alamatFocusNode.hasFocus ||
                              isActiveInputAlamat == true
                          ? p1Color
                          : mono3Color,
                    ),
                  ),
                  style: p1TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputNoHP() {
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
              'Nomor HP',
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
                  color: nohpFocusNode.hasFocus || isActiveInputnohp == true
                      ? p1Color
                      : mono3Color,
                ),
              ),
              child: GestureDetector(
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      isActiveInputName = false;
                      isActiveInputInstansi = false;
                      isActiveInputAlamat = false;
                      isActiveInputnohp = true;
                      isActiveInputKeperluan = false;
                      isActivedate = false;
                      isActivejam = false;
                    });
                  },
                  focusNode: nohpFocusNode,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      isActiveInputnohp = false;
                    });
                  },
                  controller: nohpInput,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Nomor HP',
                    hintStyle: p1TextStyle.copyWith(
                      fontSize: 12,
                      color: nohpFocusNode.hasFocus || isActiveInputnohp == true
                          ? p1Color
                          : mono3Color,
                    ),
                  ),
                  style: p1TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputKeperluan() {
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
              'Keperluan',
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
                  color: keperluanFocusNode.hasFocus ||
                          isActiveInputKeperluan == true
                      ? p1Color
                      : mono3Color,
                ),
              ),
              child: GestureDetector(
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      isActiveInputName = false;
                      isActiveInputInstansi = false;
                      isActiveInputAlamat = false;
                      isActiveInputnohp = false;
                      isActiveInputKeperluan = true;
                      isActivedate = false;
                      isActivejam = false;
                    });
                  },
                  focusNode: keperluanFocusNode,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      isActiveInputKeperluan = false;
                    });
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  minLines: 1,
                  controller: keperluanInput,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Alamat',
                    hintStyle: p1TextStyle.copyWith(
                      fontSize: 12,
                      color: keperluanFocusNode.hasFocus ||
                              isActiveInputKeperluan == true
                          ? p1Color
                          : mono3Color,
                    ),
                  ),
                  style: p1TextStyle.copyWith(
                    fontSize: 12,
                  ),
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
              'Tanggal',
              style: mono1TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                _selectDate(context);
                isActivedate = true;
                FocusScopeNode currentFocus = FocusScope.of(context);
                currentFocus.unfocus();
                isActiveInputName = false;
                isActiveInputInstansi = false;
                isActiveInputAlamat = false;
                isActiveInputnohp = false;
                isActiveInputKeperluan = false;
                isActivedate = true;
                isActivejam = false;
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(
                  color: selectedDate != null && isActivedate
                      ? p1Color
                      : mono3Color,
                ),
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
                        color: selectedDate != null ? p1Color : mono3Color,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today_rounded,
                    color: selectedDate != null && isActivedate
                        ? p1Color
                        : mono3Color,
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
                      isActivedate = true;
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      currentFocus.unfocus();
                      isActiveInputName = false;
                      isActiveInputInstansi = false;
                      isActiveInputAlamat = false;
                      isActiveInputnohp = false;
                      isActiveInputKeperluan = false;
                      isActivedate = false;
                      isActivejam = true;
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
                      side: BorderSide(
                        color: !isActivejam ? mono3Color : p1Color,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        jam == '' ? 'Jam' : jam,
                        style: p1TextStyle.copyWith(
                          fontSize: 12,
                          color:
                              jam == '' && !isActivejam ? mono3Color : p1Color,
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

    Widget buttonSubmit() {
      return Container(
        height: 46,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 40,
          left: 21,
          right: 18,
          bottom: 40,
        ),
        child: TextButton(
          onPressed: () async {
            print(selectedDate);
            if (nameInput.text == '' ||
                instansiInput.text == '' ||
                alamatInput.text == '' ||
                nohpInput.text == '' ||
                keperluanInput.text == '' ||
                selectedDate == null ||
                jam == '') {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: dangerColor,
                  content: Text(
                    'Anda belum mengisi semua form yang ada',
                    textAlign: TextAlign.center,
                  )));
            } else {
              setState(() {
                isLoading = true;
              });
              if (await provider.tambahBukuInduk(
                  nama: nameInput.text,
                  instansiAsal: instansiInput.text,
                  alamat: alamatInput.text,
                  noHP: nohpInput.text,
                  tanggal: selectedDate.toString().split(' ')[0],
                  jam: jam,
                  keperluan: keperluanInput.text)) {
                nameInput.text = '';
                instansiInput.text = '';
                alamatInput.text = '';
                nohpInput.text = '';
                selectedDate = null;
                jam = '';
                keperluanInput.text = '';
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: successColor,
                    content: Text(
                      'Sukses menambahkan buku tamu',
                      textAlign: TextAlign.center,
                    )));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: dangerColor,
                    content: Text(
                      '${provider.errorMessage}'
                          .replaceAll('Exception: [', '')
                          .replaceAll(']', ''),
                      textAlign: TextAlign.center,
                    )));
              }
              setState(() {
                isLoading = false;
              });
            }
          },
          style: TextButton.styleFrom(
            primary: m2Color,
            backgroundColor: m2Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: m2Color,
              ),
            ),
          ),
          child: isLoading == false
              ? Text(
                  'Simpan',
                  style: mono6TextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                )
              : Container(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    color: mono6Color,
                  ),
                ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: inputTamuHeader(),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            inputNama(),
            inputInstansi(),
            inputAlamat(),
            inputNoHP(),
            inputTanggal(),
            inputJam(),
            inputKeperluan(),
            buttonSubmit(),
          ],
        ),
      ),
    );
  }
}
