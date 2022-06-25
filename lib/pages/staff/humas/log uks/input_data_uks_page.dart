import 'package:adistetsa/models/data_guru_uks_model.dart';
import 'package:adistetsa/models/data_siswa_uks_model.dart';
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

    setState(() {
      provider.namaPTK == 'Siswa'
          ? nameInput.text = provider.dataSiswaUKS.nAMA.toString()
          : provider.namaPTK == 'Guru' || provider.namaPTK == 'Karyawan'
              ? nameInput.text = provider.dataGuruUKS.nAMALENGKAP.toString()
              : nameInput.text = '';

      if (nameInput.text == 'null') {
        nameInput.text = '';
      }
    });

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
            provider.setDataSiswaUKS = DataSiswaUksModel();
            provider.setDataGuruUKS = DataGuruUksModel();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono1Color,
        ),
      );
    }

    Widget inputNama() {
      return GestureDetector(
        onTap: () {
          provider.namaPTK == 'Siswa'
              ? Navigator.pushNamed(context, '/humas/data_siswa')
              : Navigator.pushNamed(context, '/humas/data_guru');
        },
        child: Container(
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
                      enabled: false,
                      hintStyle: p1TextStyle.copyWith(
                        fontSize: 12,
                        color:
                            nameFocusNode.hasFocus || isActiveInputName == true
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
            print(provider.namaPTK);
            if (provider.namaPTK == 'Siswa') {
              if (nameInput.text == '' ||
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
                      nama: provider.dataSiswaUKS.iD.toString(),
                      kelas: provider.dataSiswaUKS.kELAS,
                      nisn: provider.dataSiswaUKS.nIS.toString(),
                      tanggal: selectedDate.toString().split(' ')[0],
                      jenisPemeriksaan: jenisPemeriksaanInput.text,
                      obatDiberikan: obatDiberikanInput.text,
                      tindakLanjut: tindakLanjutInput.text,
                      jenisPTK: provider.namaPTK);
                  provider.setDataSiswaUKS = DataSiswaUksModel();

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
                  setState(() {
                    isLoading = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: dangerColor,
                      content: Text(
                        e.toString(),
                        textAlign: TextAlign.center,
                      )));
                }
              }
            } else {
              print(value3Item);
              print(nameInput.text);
              print(selectedDate);
              print(jenisPemeriksaanInput.text);
              print(obatDiberikanInput.text);
              print(tindakLanjutInput.text);
              if (value3Item == null ||
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
                    jenisPTK: value3Item.toString(),
                    nama: provider.dataGuruUKS.iD.toString(),
                    tanggal: selectedDate.toString().split(' ')[0],
                    jenisPemeriksaan: jenisPemeriksaanInput.text,
                    obatDiberikan: obatDiberikanInput.text,
                    tindakLanjut: tindakLanjutInput.text,
                  );
                  value3Item = null;
                  nameInput.text = '';
                  selectedDate = null;
                  provider.setDataGuruUKS = DataGuruUksModel();
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
                  setState(() {
                    isLoading = false;
                  });
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
          inputDropdownGuruKaryawan(
            hint: 'Jenis PTK',
            item: [
              'Guru Tidak Tetap',
              'Aparatur Sipil Negara',
              'Pegawai Tidak Tetap',
              'Guru',
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
              'Guru Tidak Tetap',
              'Aparatur Sipil Negara',
              'Pegawai Tidak Tetap',
              'Guru',
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

    return WillPopScope(
      onWillPop: () async {
        provider.setDataSiswaUKS = DataSiswaUksModel();
        provider.setDataGuruUKS = DataGuruUksModel();
        return true;
      },
      child: Scaffold(
        backgroundColor: mono6Color,
        appBar: inputdataUKSHeader(),
        body: ListView(
          children: [
            provider.namaPTK == 'Siswa'
                ? itemSiswa()
                : provider.namaPTK == 'Karyawan'
                    ? itemASN()
                    : itemGuru(),
            buttonSubmit(),
          ],
        ),
      ),
    );
  }
}
