import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class StaffBkEditDaftarAlumniPage extends StatefulWidget {
  @override
  _StaffBkEditDaftarAlumniPageState createState() =>
      _StaffBkEditDaftarAlumniPageState();
}

class _StaffBkEditDaftarAlumniPageState
    extends State<StaffBkEditDaftarAlumniPage> {
  bool isLoading = false;
  TextEditingController namaSiswaController = TextEditingController(text: '');
  TextEditingController kelasSiswaController = TextEditingController(text: '');
  TextEditingController nisnSiswaController = TextEditingController(text: '');
  TextEditingController nisSiswaController = TextEditingController(text: '');
  TextEditingController tahunAjaranLulusSiswaController =
      TextEditingController(text: '');
  TextEditingController kampusSiswaController = TextEditingController(text: '');
  TextEditingController prodiSiswaController = TextEditingController(text: '');
  TextEditingController medsosSiswaController = TextEditingController(text: '');
  TextEditingController emailSiswaController = TextEditingController(text: '');
  TextEditingController alamatSiswaController = TextEditingController(text: '');
  TextEditingController tempatKerjaSiswaController =
      TextEditingController(text: '');

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
    setState(() {
      namaSiswaController.text = 'Adam Bangsat';
      namaSiswaController.selection = TextSelection.fromPosition(
        TextPosition(offset: namaSiswaController.text.length),
      );
      kelasSiswaController.text = 'XII-IPA A';
      kelasSiswaController.selection = TextSelection.fromPosition(
        TextPosition(offset: kelasSiswaController.text.length),
      );
      nisnSiswaController.text = '123456789';
      nisnSiswaController.selection = TextSelection.fromPosition(
        TextPosition(offset: nisnSiswaController.text.length),
      );
      nisSiswaController.text = '987654321';
      nisSiswaController.selection = TextSelection.fromPosition(
        TextPosition(offset: nisSiswaController.text.length),
      );
      tahunAjaranLulusSiswaController.text = '2000/2001';
      tahunAjaranLulusSiswaController.selection = TextSelection.fromPosition(
        TextPosition(offset: tahunAjaranLulusSiswaController.text.length),
      );
      kampusSiswaController.text = 'Universitas Gadjah Mada';
      kampusSiswaController.selection = TextSelection.fromPosition(
        TextPosition(offset: kampusSiswaController.text.length),
      );
      prodiSiswaController.text = 'Aktuaria';
      prodiSiswaController.selection = TextSelection.fromPosition(
        TextPosition(offset: prodiSiswaController.text.length),
      );
      medsosSiswaController.text = '@Adambgst';
      medsosSiswaController.selection = TextSelection.fromPosition(
        TextPosition(offset: medsosSiswaController.text.length),
      );
      emailSiswaController.text = 'Adambangsat@gmail.com';
      emailSiswaController.selection = TextSelection.fromPosition(
        TextPosition(offset: emailSiswaController.text.length),
      );
      alamatSiswaController.text =
          'perum peruri, jln, wijaya kusuma blok 3 rt 5';
      alamatSiswaController.selection = TextSelection.fromPosition(
        TextPosition(offset: alamatSiswaController.text.length),
      );
      tempatKerjaSiswaController.text = 'Penjara';
      tempatKerjaSiswaController.selection = TextSelection.fromPosition(
        TextPosition(offset: tempatKerjaSiswaController.text.length),
      );
    });
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
                controller: namaSiswaController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: namaSiswaFocusNode.hasFocus ||
                        namaSiswaController.text != ''
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
                controller: kelasSiswaController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: kelasSiswaFocusNode.hasFocus ||
                        kelasSiswaController.text != ''
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
                controller: nisnSiswaController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: nisnSiswaFocusNode.hasFocus ||
                        nisnSiswaController.text != ''
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
                controller: nisSiswaController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style:
                    nisSiswaFocusNode.hasFocus || nisSiswaController.text != ''
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
                controller: tahunAjaranLulusSiswaController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: tahunAjaranLulusSiswaFocusNode.hasFocus ||
                        tahunAjaranLulusSiswaController.text != ''
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
                controller: kampusSiswaController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: kampusSiswaFocusNode.hasFocus ||
                        kampusSiswaController.text != ''
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
                controller: prodiSiswaController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: prodiSiswaFocusNode.hasFocus ||
                        prodiSiswaController.text != ''
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
                controller: medsosSiswaController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: medsosSiswaFocusNode.hasFocus ||
                        medsosSiswaController.text != ''
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
                controller: emailSiswaController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: emailSiswaFocusNode.hasFocus ||
                        emailSiswaController.text != ''
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
                controller: alamatSiswaController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: alamatSiswaFocusNode.hasFocus ||
                        alamatSiswaController.text != ''
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
                controller: tempatKerjaSiswaController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: tempatKerjaSiswaFocusNode.hasFocus ||
                        tempatKerjaSiswaController.text != ''
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

    Widget buttonSubmit() {
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
            onPressed: () {},
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
            buttonSubmit(),
          ],
        ),
      ),
    );
  }
}
