import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class StaffBkEditDaftarAlumniPage extends StatefulWidget {
  @override
  _StaffBkEditDaftarAlumniPageState createState() =>
      _StaffBkEditDaftarAlumniPageState();
}

class _StaffBkEditDaftarAlumniPageState
    extends State<StaffBkEditDaftarAlumniPage> {
  bool isLoading = false;
  String namaSiswaController = '';
  String kelasSiswaController = '';
  String nisnSiswaController = '';
  String nisSiswaController = '';
  String tahunAjaranLulusSiswaController = '';
  String kampusSiswaController = '';
  String prodiSiswaController = '';
  String medsosSiswaController = '';
  String emailSiswaController = '';
  String alamatSiswaController = '';
  String tempatKerjaSiswaController = '';

  late FocusNode namaSiswaFocusNode;
  late FocusNode kelasSiswaFocusNode;
  late FocusNode nisnSiswaFocusNode;
  late FocusNode nisSiswaFocusNode;
  late FocusNode tahunAjaranLulusSiswaFocusNode;
  late FocusNode kampusSiswaFocusNode;
  late FocusNode prodiSiswaFocusNode;
  late FocusNode medsosSiswaFocusNode;
  late FocusNode emailSiswaFocusNode;
  late FocusNode alamatSiswaFocusNode;
  late FocusNode tempatKerjaSiswaFocusNode;

  void initState() {
    super.initState();
    namaSiswaFocusNode = FocusNode();
    kelasSiswaFocusNode = FocusNode();
    nisnSiswaFocusNode = FocusNode();
    nisSiswaFocusNode = FocusNode();
    tahunAjaranLulusSiswaFocusNode = FocusNode();
    kampusSiswaFocusNode = FocusNode();
    prodiSiswaFocusNode = FocusNode();
    medsosSiswaFocusNode = FocusNode();
    emailSiswaFocusNode = FocusNode();
    alamatSiswaFocusNode = FocusNode();
    tempatKerjaSiswaFocusNode = FocusNode();
  }

  void dispose() {
    namaSiswaFocusNode.dispose();
    kelasSiswaFocusNode.dispose();
    nisnSiswaFocusNode.dispose();
    nisSiswaFocusNode.dispose();
    tahunAjaranLulusSiswaFocusNode.dispose();
    kampusSiswaFocusNode.dispose();
    prodiSiswaFocusNode.dispose();
    medsosSiswaFocusNode.dispose();
    emailSiswaFocusNode.dispose();
    alamatSiswaFocusNode.dispose();
    tempatKerjaSiswaFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    PreferredSizeWidget header() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mono6Color,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: mono1Color,
          ),
        ),
        title: Text(
          'Edit Data Alumni',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
      );
    }

    Widget namaSiswaInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Siswa',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: namaSiswaFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    namaSiswaFocusNode.requestFocus();
                  });
                },
                focusNode: namaSiswaFocusNode,
                initialValue: provider.daftarAlumni.nAMASISWA,
                onChanged: (value) {
                  namaSiswaController = value;
                },
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: namaSiswaFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Nama Siswa',
                  hintStyle: namaSiswaFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget kelasSiswaInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kelas',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: kelasSiswaFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    kelasSiswaFocusNode.requestFocus();
                  });
                },
                focusNode: kelasSiswaFocusNode,
                initialValue: provider.daftarAlumni.kELAS,
                onChanged: (value) {
                  kelasSiswaController = value;
                },
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: kelasSiswaFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Kelas',
                  hintStyle: kelasSiswaFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget nisnSiswaInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NISN',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: nisnSiswaFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    nisnSiswaFocusNode.requestFocus();
                  });
                },
                focusNode: nisnSiswaFocusNode,
                keyboardType: TextInputType.number,
                initialValue: provider.daftarAlumni.nISN,
                onChanged: (value) {
                  nisnSiswaController = value;
                },
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: nisnSiswaFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'NISN',
                  hintStyle: nisnSiswaFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget nisSiswaInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NIS',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: nisSiswaFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    nisSiswaFocusNode.requestFocus();
                  });
                },
                keyboardType: TextInputType.number,
                focusNode: nisSiswaFocusNode,
                initialValue: provider.daftarAlumni.nIS,
                onChanged: (value) {
                  nisSiswaController = value;
                },
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: nisSiswaFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'NIS',
                  hintStyle: nisSiswaFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget tahunAjaranLulusSiswaInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lulus Tahun Ajaran',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: tahunAjaranLulusSiswaFocusNode.hasFocus
                      ? p1Color
                      : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    tahunAjaranLulusSiswaFocusNode.requestFocus();
                  });
                },
                focusNode: tahunAjaranLulusSiswaFocusNode,
                initialValue: provider.daftarAlumni.tAHUNAJARAN,
                onChanged: (value) {
                  tahunAjaranLulusSiswaController = value;
                },
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: tahunAjaranLulusSiswaFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Lulus Tahun Ajaran',
                  hintStyle: tahunAjaranLulusSiswaFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget kampusSiswaInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama PTN, PTS/PTL',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: kampusSiswaFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    kampusSiswaFocusNode.requestFocus();
                  });
                },
                focusNode: kampusSiswaFocusNode,
                initialValue: provider.daftarAlumni.nAMAPT,
                onChanged: (value) {
                  kampusSiswaController = value;
                },
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: kampusSiswaFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Nama PTN, PTS/PTL',
                  hintStyle: kampusSiswaFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget prodiSiswaInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Program Studi',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: prodiSiswaFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    prodiSiswaFocusNode.requestFocus();
                  });
                },
                focusNode: prodiSiswaFocusNode,
                initialValue: provider.daftarAlumni.pROGRAMSTUDI,
                onChanged: (value) {
                  prodiSiswaController = value;
                },
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: prodiSiswaFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Program Studi',
                  hintStyle: prodiSiswaFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget medsosSiswaInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Media Sosial',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: medsosSiswaFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    medsosSiswaFocusNode.requestFocus();
                  });
                },
                focusNode: medsosSiswaFocusNode,
                initialValue: provider.daftarAlumni.mEDIASOSIAL,
                onChanged: (value) {
                  medsosSiswaController = value;
                },
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: medsosSiswaFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Media Sosial',
                  hintStyle: medsosSiswaFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailSiswaInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: emailSiswaFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    emailSiswaFocusNode.requestFocus();
                  });
                },
                keyboardType: TextInputType.emailAddress,
                focusNode: emailSiswaFocusNode,
                initialValue: provider.daftarAlumni.eMAIL,
                onChanged: (value) {
                  emailSiswaController = value;
                },
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: emailSiswaFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Email',
                  hintStyle: emailSiswaFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget alamatSiswaInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat Rumah',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: alamatSiswaFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    alamatSiswaFocusNode.requestFocus();
                  });
                },
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                focusNode: alamatSiswaFocusNode,
                initialValue: provider.daftarAlumni.aLAMAT,
                onChanged: (value) {
                  alamatSiswaController = value;
                },
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: alamatSiswaFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Alamat Rumah',
                  hintStyle: alamatSiswaFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget tempatKerjaSiswaInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tempat Kerja',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color:
                      tempatKerjaSiswaFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    tempatKerjaSiswaFocusNode.requestFocus();
                  });
                },
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                focusNode: tempatKerjaSiswaFocusNode,
                initialValue: provider.daftarAlumni.tEMPATBEKERJA,
                onChanged: (value) {
                  tempatKerjaSiswaController = value;
                },
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: tempatKerjaSiswaFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Tempat Kerja',
                  hintStyle: tempatKerjaSiswaFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSubmit({
      required String id,
      required String namaSiswa,
      required String kelas,
      required String nisn,
      required String nis,
      required String tahunAjaran,
      required String namaPTN,
      required String programStudi,
      required String mediaSosial,
      required String email,
      required String alamatRumah,
      required String tempatKerja,
    }) {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
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
              setState(() {
                isLoading = true;
              });
              await Services().patchDetailDaftarAlumni(
                id: id,
                namaSiswa: namaSiswa,
                kelas: kelas,
                nisn: nisn,
                nis: nis,
                tahunAjaran: tahunAjaran,
                namaPTN: namaPTN,
                programStudi: programStudi,
                mediaSosial: mediaSosial,
                email: email,
                alamatRumah: alamatRumah,
                tempatKerja: tempatKerja,
              );
              setState(() {
                isLoading = false;
              });
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: isLoading == false
                ? Text(
                    'Simpan',
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
      appBar: header(),
      backgroundColor: mono6Color,
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            namaSiswaInput(),
            kelasSiswaInput(),
            nisnSiswaInput(),
            nisSiswaInput(),
            tahunAjaranLulusSiswaInput(),
            kampusSiswaInput(),
            prodiSiswaInput(),
            medsosSiswaInput(),
            emailSiswaInput(),
            alamatSiswaInput(),
            tempatKerjaSiswaInput(),
            buttonSubmit(
              id: provider.daftarAlumni.iD.toString(),
              namaSiswa: namaSiswaController.isEmpty
                  ? provider.daftarAlumni.nAMASISWA.toString()
                  : namaSiswaController,
              kelas: kelasSiswaController.isEmpty
                  ? provider.daftarAlumni.kELAS.toString()
                  : kelasSiswaController,
              nisn: nisnSiswaController.isEmpty
                  ? provider.daftarAlumni.nISN.toString()
                  : nisnSiswaController,
              nis: nisSiswaController.isEmpty
                  ? provider.daftarAlumni.nIS.toString()
                  : nisSiswaController,
              tahunAjaran: tahunAjaranLulusSiswaController.isEmpty
                  ? provider.daftarAlumni.tAHUNAJARAN.toString()
                  : tahunAjaranLulusSiswaController,
              namaPTN: kampusSiswaController.isEmpty
                  ? provider.daftarAlumni.nAMAPT.toString()
                  : kampusSiswaController,
              programStudi: prodiSiswaController.isEmpty
                  ? provider.daftarAlumni.pROGRAMSTUDI.toString()
                  : prodiSiswaController,
              mediaSosial: medsosSiswaController.isEmpty
                  ? provider.daftarAlumni.mEDIASOSIAL.toString()
                  : medsosSiswaController,
              email: emailSiswaController.isEmpty
                  ? provider.daftarAlumni.eMAIL.toString()
                  : emailSiswaController,
              alamatRumah: alamatSiswaController.isEmpty
                  ? provider.daftarAlumni.aLAMAT.toString()
                  : alamatSiswaController,
              tempatKerja: tempatKerjaSiswaController.isEmpty
                  ? provider.daftarAlumni.tEMPATBEKERJA.toString()
                  : tempatKerjaSiswaController,
            ),
          ],
        ),
      ),
    );
  }
}
