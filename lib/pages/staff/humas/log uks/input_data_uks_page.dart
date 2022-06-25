import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class InputDataUKSPage extends StatefulWidget {
  InputDataUKSPage({Key? key}) : super(key: key);

  @override
  State<InputDataUKSPage> createState() => _InputDataUKSPageState();
}

class _InputDataUKSPageState extends State<InputDataUKSPage> {
  TextEditingController nameInput = TextEditingController(text: '');
  TextEditingController nisnInput = TextEditingController(text: '');
  TextEditingController jenisPemeriksaanInput = TextEditingController(text: '');
  TextEditingController obatDiberikanInput = TextEditingController(text: '');
  TextEditingController tindakLanjutInput = TextEditingController(text: '');

  FocusNode nameFocusNode = new FocusNode();
  bool isActiveInputName = false;

  FocusNode nisnFocusNode = new FocusNode();
  bool isActiveInputnisn = false;

  FocusNode jenisPemeriksaanFocusNode = new FocusNode();
  bool isActiveJenisPemeriksaan = false;

  FocusNode obatDiberikanFocusNode = new FocusNode();
  bool isActiveobatDiberikan = false;

  FocusNode tindakLanjutFocusNode = new FocusNode();
  bool isActivetindakLanjut = false;

  Object? value1Item;
  bool flag1 = false;

  Object? value2Item;
  bool flag2 = false;

  Object? value3Item;
  bool flag3 = false;

  bool isLoading = false;

  DateTime? selectedDate;
  bool isActivedate = false;
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

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    PreferredSizeWidget inputdataUKSHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Tambah Data ${provider.namaPTK}',
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
                      isActiveInputnisn = false;
                      isActiveJenisPemeriksaan = false;
                      isActiveobatDiberikan = false;
                      isActivetindakLanjut = false;
                      isActivedate = false;
                      flag1 = false;
                      flag2 = false;
                      flag3 = false;
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

    Widget inputNISN() {
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
              'NISN',
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
                  color: nisnFocusNode.hasFocus || isActiveInputnisn == true
                      ? p1Color
                      : mono3Color,
                ),
              ),
              child: GestureDetector(
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      isActiveInputName = false;
                      isActiveInputnisn = true;
                      isActiveJenisPemeriksaan = false;
                      isActiveobatDiberikan = false;
                      isActivetindakLanjut = false;
                      flag1 = false;
                      flag2 = false;
                      flag3 = false;
                    });
                  },
                  focusNode: nisnFocusNode,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      isActiveInputnisn = false;
                    });
                  },
                  controller: nisnInput,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration.collapsed(
                    hintText: 'NISN',
                    hintStyle: p1TextStyle.copyWith(
                      fontSize: 12,
                      color: nisnFocusNode.hasFocus || isActiveInputnisn == true
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

    Widget inputJenisPemeriksaan() {
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
              'Jenis Pemeriksaan',
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
                  color: jenisPemeriksaanFocusNode.hasFocus ||
                          isActiveJenisPemeriksaan == true
                      ? p1Color
                      : mono3Color,
                ),
              ),
              child: GestureDetector(
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      isActiveInputName = false;
                      isActiveInputnisn = false;
                      isActiveJenisPemeriksaan = true;
                      isActiveobatDiberikan = false;
                      isActivetindakLanjut = false;
                      flag1 = false;
                      isActivedate = false;
                      flag2 = false;
                      flag3 = false;
                    });
                  },
                  focusNode: jenisPemeriksaanFocusNode,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      isActiveJenisPemeriksaan = false;
                    });
                  },
                  // Multiline input
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  minLines: 1,
                  controller: jenisPemeriksaanInput,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Jenis Pemeriksaan',
                    hintStyle: p1TextStyle.copyWith(
                      fontSize: 12,
                      color: jenisPemeriksaanFocusNode.hasFocus ||
                              isActiveJenisPemeriksaan == true
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

    Widget inputObatDiberikan() {
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
              'Obat Diberikan',
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
                  color: obatDiberikanFocusNode.hasFocus ||
                          isActiveobatDiberikan == true
                      ? p1Color
                      : mono3Color,
                ),
              ),
              child: GestureDetector(
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      isActiveInputName = false;
                      isActiveInputnisn = false;
                      isActiveJenisPemeriksaan = false;
                      isActiveobatDiberikan = true;
                      isActivetindakLanjut = false;
                      flag1 = false;
                      isActivedate = false;
                      flag2 = false;
                      flag3 = false;
                    });
                  },
                  // Multiline input
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  minLines: 1,
                  focusNode: obatDiberikanFocusNode,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      isActiveobatDiberikan = false;
                    });
                  },
                  controller: obatDiberikanInput,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Obat Diberikan',
                    hintStyle: p1TextStyle.copyWith(
                      fontSize: 12,
                      color: obatDiberikanFocusNode.hasFocus ||
                              isActiveobatDiberikan == true
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

    Widget inputTindakLanjut() {
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
              'Tindak Lanjut',
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
                  color: tindakLanjutFocusNode.hasFocus ||
                          isActivetindakLanjut == true
                      ? p1Color
                      : mono3Color,
                ),
              ),
              child: GestureDetector(
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      isActiveInputName = false;
                      isActiveInputnisn = false;
                      isActiveJenisPemeriksaan = false;
                      isActiveobatDiberikan = false;
                      isActivetindakLanjut = true;
                      flag1 = false;
                      isActivedate = false;
                      flag2 = false;
                      flag3 = false;
                    });
                  },
                  focusNode: tindakLanjutFocusNode,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      isActivetindakLanjut = false;
                    });
                  },
                  // Multiline input
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 1,
                  controller: tindakLanjutInput,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Tindak Lanjut',
                    hintStyle: p1TextStyle.copyWith(
                      fontSize: 12,
                      color: tindakLanjutFocusNode.hasFocus ||
                              isActivetindakLanjut == true
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
                FocusScopeNode currentFocus = FocusScope.of(context);
                currentFocus.unfocus();
                flag1 = false;
                flag2 = false;
                flag3 = false;
                isActivedate = true;
                _selectDate(context);
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

    Widget inputDropdownSiswa({required String hint, required List item}) {
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
              '$hint',
              style: mono1TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: flag1 == true && value1Item != null
                        ? p1Color
                        : mono3Color,
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
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        currentFocus.unfocus();
                        isActivedate = false;
                        isActiveInputName = false;
                        isActiveInputnisn = false;
                        isActiveJenisPemeriksaan = false;
                        isActiveobatDiberikan = false;
                        isActivetindakLanjut = false;
                      },
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
                                color:
                                    value1Item == value ? p1Color : mono1Color,
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
                )),
          ],
        ),
      );
    }

    Widget inputDropdownASNPTTGTT({required String hint, required List item}) {
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
              '$hint',
              style: mono1TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: flag2 == true && value2Item != null
                        ? p1Color
                        : mono3Color,
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
                        flag2 = false;
                        value2Item = null;
                      });
                    },
                    child: DropdownButton(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        currentFocus.unfocus();
                        isActiveInputName = false;
                        isActiveInputnisn = false;
                        isActiveJenisPemeriksaan = false;
                        isActiveobatDiberikan = false;
                        isActivetindakLanjut = false;
                        isActivedate = false;
                        flag1 = false;
                        flag2 = false;
                        flag3 = false;
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: flag2 == true && value2Item != null
                            ? p1Color
                            : mono3Color,
                      ),
                      hint: Text(
                        hint,
                        style: mono3TextStyle.copyWith(
                          color: flag2 == true && value2Item != null
                              ? p1Color
                              : mono3Color,
                          fontSize: 12,
                        ),
                      ),
                      dropdownColor: mono6Color,
                      elevation: 2,
                      value: value2Item,
                      items: item.map(
                        (value) {
                          return DropdownMenuItem(
                            value: value.split('.')[1],
                            child: Text(
                              value.split('.')[0],
                              style: mono3TextStyle.copyWith(
                                color: value2Item == value.split('.')[0]
                                    ? p1Color
                                    : mono1Color,
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
                          flag2 = true;
                          value2Item = value;
                        });
                      },
                    ),
                  ),
                )),
          ],
        ),
      );
    }

    Widget inputDropdownGuruKaryawan(
        {required String hint, required List item}) {
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
              '$hint',
              style: mono1TextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: flag3 == true && value3Item != null
                        ? p1Color
                        : mono3Color,
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
                        flag3 = false;
                        value3Item = null;
                      });
                    },
                    child: DropdownButton(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        currentFocus.unfocus();
                        isActiveInputName = false;
                        isActiveInputnisn = false;
                        isActiveJenisPemeriksaan = false;
                        isActiveobatDiberikan = false;
                        isActivetindakLanjut = false;
                        isActivedate = false;
                        flag1 = false;
                        flag2 = false;
                        flag3 = false;
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: flag3 == true && value3Item != null
                            ? p1Color
                            : mono3Color,
                      ),
                      hint: Text(
                        hint,
                        style: mono3TextStyle.copyWith(
                          color: flag3 == true && value3Item != null
                              ? p1Color
                              : mono3Color,
                          fontSize: 12,
                        ),
                      ),
                      dropdownColor: mono6Color,
                      elevation: 2,
                      value: value3Item,
                      items: item.map(
                        (value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: mono3TextStyle.copyWith(
                                color:
                                    value3Item == value ? p1Color : mono1Color,
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
                          flag3 = true;
                          value3Item = value;
                        });
                      },
                    ),
                  ),
                )),
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
            if (provider.namaPTK == 'Siswa') {
              if (nameInput.text == '' ||
                  value1Item == null ||
                  nisnInput.text == '' ||
                  selectedDate == null ||
                  jenisPemeriksaanInput.text == '' ||
                  obatDiberikanInput.text == '' ||
                  tindakLanjutInput.text == '') {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: dangerColor,
                    content: Text(
                      'Anda belum mengisi semua form yang ada',
                      textAlign: TextAlign.center,
                    )));
              } else {
                try {
                  setState(() {
                    isLoading = true;
                  });
                  await Services().tambahLogUKS(
                      nama: nameInput.text,
                      kelas: value1Item.toString(),
                      nisn: nisnInput.text,
                      tanggal: selectedDate.toString().split(' ')[0],
                      jenisPemeriksaan: jenisPemeriksaanInput.text,
                      obatDiberikan: obatDiberikanInput.text,
                      tindakLanjut: tindakLanjutInput.text,
                      jenisPTK: provider.namaPTK);
                  nameInput.text = '';
                  value1Item = null;
                  nisnInput.text = '';
                  selectedDate = null;
                  jenisPemeriksaanInput.text = '';
                  obatDiberikanInput.text = '';
                  tindakLanjutInput.text = '';
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: successColor,
                      content: Text(
                        'Anda berhasil menambahkan log UKS',
                        textAlign: TextAlign.center,
                      )));
                  setState(() {
                    isLoading = false;
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: dangerColor,
                      content: Text(
                        e.toString(),
                        textAlign: TextAlign.center,
                      )));
                }
              }
            } else {
              if (value2Item == null ||
                  nameInput.text == '' ||
                  selectedDate == null ||
                  jenisPemeriksaanInput.text == '' ||
                  obatDiberikanInput.text == '' ||
                  tindakLanjutInput.text == '') {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: dangerColor,
                    content: Text(
                      'Anda belum mengisi semua form yang ada',
                      textAlign: TextAlign.center,
                    )));
              } else {
                try {
                  setState(() {
                    isLoading = true;
                  });
                  await Services().tambahLogUKS(
                    jenisPTK: value2Item.toString(),
                    nama: nameInput.text,
                    tanggal: selectedDate.toString().split(' ')[0],
                    jenisPemeriksaan: jenisPemeriksaanInput.text,
                    obatDiberikan: obatDiberikanInput.text,
                    tindakLanjut: tindakLanjutInput.text,
                  );
                  value2Item = null;
                  nameInput.text = '';
                  selectedDate = null;
                  jenisPemeriksaanInput.text = '';
                  obatDiberikanInput.text = '';
                  tindakLanjutInput.text = '';
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: successColor,
                      content: Text(
                        'Anda berhasil menambahkan log UKS',
                        textAlign: TextAlign.center,
                      )));
                  setState(() {
                    isLoading = false;
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: dangerColor,
                      content: Text(
                        e.toString(),
                        textAlign: TextAlign.center,
                      )));
                }
              }
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
          child: isLoading == true
              ? Container(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    color: mono6Color,
                  ),
                )
              : Text(
                  'Tambah',
                  style: mono6TextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
        ),
      );
    }

    Widget itemSiswa() {
      return Column(
        children: [
          SizedBox(
            height: 20,
          ),
          inputNama(),
          inputDropdownSiswa(
            hint: 'Kelas',
            item: [
              'X',
              'XI',
              'XII',
            ],
          ),
          inputNISN(),
          inputTanggal(),
          inputJenisPemeriksaan(),
          inputObatDiberikan(),
          inputTindakLanjut(),
        ],
      );
    }

    Widget itemASN() {
      return Column(
        children: [
          SizedBox(
            height: 20,
          ),
          inputDropdownASNPTTGTT(
            hint: 'Jenis PTK',
            item: [
              'ASN (Aparatur Sipil Negara).Aparatur Sipil Negara',
              'GTT (Guru Tidak Tetap).Guru Tidak Tetap',
              'PTT (Pegawai Tidak Tetap).Pegawai Tidak Tetap',
              'Guru.Guru',
            ],
          ),
          inputNama(),
          inputTanggal(),
          inputJenisPemeriksaan(),
          inputObatDiberikan(),
          inputTindakLanjut(),
        ],
      );
    }

    Widget itemGuru() {
      return Column(
        children: [
          SizedBox(
            height: 20,
          ),
          inputDropdownGuruKaryawan(
            hint: 'Jenis PTK',
            item: [
              'Guru',
              'Tendik',
            ],
          ),
          inputNama(),
          inputTanggal(),
          inputJenisPemeriksaan(),
          inputObatDiberikan(),
          inputTindakLanjut(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: inputdataUKSHeader(),
      body: ListView(
        children: [
          provider.namaPTK == 'Siswa'
              ? itemSiswa()
              : provider.namaPTK == 'Tendik'
                  ? itemASN()
                  : itemGuru(),
          buttonSubmit(),
        ],
      ),
    );
  }
}
