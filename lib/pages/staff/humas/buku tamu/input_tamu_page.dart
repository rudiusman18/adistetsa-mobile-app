import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

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
                      : mono2Color,
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
                          : mono2Color,
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
                      : mono2Color,
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
                          : mono2Color,
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
                      : mono2Color,
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
                          : mono2Color,
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
                      : mono2Color,
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
                  decoration: InputDecoration.collapsed(
                    hintText: 'Nomor HP',
                    hintStyle: p1TextStyle.copyWith(
                      fontSize: 12,
                      color: nohpFocusNode.hasFocus || isActiveInputnohp == true
                          ? p1Color
                          : mono2Color,
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
                      : mono2Color,
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
                          : mono2Color,
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
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(
                  color: isActivedate == true ? p1Color : mono2Color,
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
                        color: isActivedate == true ? p1Color : mono2Color,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today_rounded,
                    color: isActivedate == true ? p1Color : mono2Color,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget inputDropdownHari({required String hint, required List item}) {
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

    Widget inputDropdownJam({required String hint, required List item}) {
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
                            value: value,
                            child: Text(
                              value,
                              style: mono3TextStyle.copyWith(
                                color:
                                    value2Item == value ? p1Color : mono1Color,
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
          onPressed: () {},
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
          child: Text(
            'Simpan',
            style: mono6TextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
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
            inputDropdownHari(
              hint: 'Hari',
              item: [
                'Senin',
                'Selasa',
              ],
            ),
            inputTanggal(),
            inputDropdownJam(
              hint: 'Jam',
              item: [
                'Senin',
                'Selasa',
              ],
            ),
            inputKeperluan(),
            buttonSubmit(),
          ],
        ),
      ),
    );
  }
}
