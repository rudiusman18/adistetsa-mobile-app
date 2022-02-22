import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class IsiJurnalPage extends StatefulWidget {
  const IsiJurnalPage({Key? key}) : super(key: key);

  @override
  _IsiJurnalPageState createState() => _IsiJurnalPageState();
}

class _IsiJurnalPageState extends State<IsiJurnalPage> {
  FocusNode pertemuanFocusNode = new FocusNode();
  FocusNode deskripsiFocusNode = new FocusNode();
  bool isActivePertemuan = false;
  bool isActiveDeskripsi = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController pertemuanInput = TextEditingController(text: '');
    TextEditingController deskripsiMengajarInput =
        TextEditingController(text: '');

    PreferredSizeWidget headerIsiJurnal() {
      return AppBar(
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        centerTitle: true,
        title: Text(
          'Isi Jurnal',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono1Color,
        ),
      );
    }

    Widget inputNamaGuru() {
      return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Guru',
              style: mono2TextStyle.copyWith(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: mono4Color,
                    primary: mono4Color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: mono3Color,
                          width: 0.5,
                        ))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Miguel Wagnes',
                      style: mono2TextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputPertemuanKe() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pertemuan Ke-',
              style: mono3TextStyle.copyWith(
                fontSize: 10,
                color: pertemuanFocusNode.hasFocus || isActivePertemuan == true
                    ? m2Color
                    : mono3Color,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: mono6Color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color:
                      pertemuanFocusNode.hasFocus || isActivePertemuan == true
                          ? m2Color
                          : mono3Color,
                ),
              ),
              child: GestureDetector(
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      isActivePertemuan = true;
                      isActiveDeskripsi = false;
                    });
                  },
                  focusNode: pertemuanFocusNode,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      isActivePertemuan = false;
                    });
                  },
                  controller: pertemuanInput,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Pertemuan Ke -',
                    hintStyle:
                        pertemuanFocusNode.hasFocus || isActivePertemuan == true
                            ? m2TextStyle.copyWith(
                                fontSize: 12,
                              )
                            : mono3TextStyle.copyWith(
                                fontSize: 12,
                              ),
                  ),
                  style:
                      pertemuanFocusNode.hasFocus || isActivePertemuan == true
                          ? m2TextStyle.copyWith(
                              fontSize: 12,
                            )
                          : mono3TextStyle.copyWith(
                              fontSize: 12,
                            ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputDeskripsiMengajar() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pertemuan Ke-',
              style: mono3TextStyle.copyWith(
                fontSize: 10,
                color: deskripsiFocusNode.hasFocus || isActiveDeskripsi == true
                    ? m2Color
                    : mono3Color,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: mono6Color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color:
                      deskripsiFocusNode.hasFocus || isActiveDeskripsi == true
                          ? m2Color
                          : mono3Color,
                ),
              ),
              child: GestureDetector(
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      isActivePertemuan = false;
                      isActiveDeskripsi = true;
                    });
                  },
                  focusNode: deskripsiFocusNode,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      isActiveDeskripsi = false;
                    });
                  },
                  controller: deskripsiMengajarInput,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Deskripsi Mengajar',
                    hintStyle:
                        deskripsiFocusNode.hasFocus || isActiveDeskripsi == true
                            ? m2TextStyle.copyWith(
                                fontSize: 12,
                              )
                            : mono3TextStyle.copyWith(
                                fontSize: 12,
                              ),
                  ),
                  style:
                      deskripsiFocusNode.hasFocus || isActiveDeskripsi == true
                          ? m2TextStyle.copyWith(
                              fontSize: 12,
                            )
                          : mono3TextStyle.copyWith(
                              fontSize: 12,
                            ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputUnggahDokumen() {
      return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Unggah Dokumentasi',
              style: mono2TextStyle.copyWith(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: m5Color,
                  primary: m5Color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        color: mono6Color,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'Pilih File',
                          style: mono6TextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSubmit() {
      return Container(
        height: 40,
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
      appBar: headerIsiJurnal(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              inputNamaGuru(),
              inputPertemuanKe(),
              inputDeskripsiMengajar(),
              inputUnggahDokumen(),
              buttonSubmit(),
            ],
          ),
        ),
      ),
    );
  }
}
