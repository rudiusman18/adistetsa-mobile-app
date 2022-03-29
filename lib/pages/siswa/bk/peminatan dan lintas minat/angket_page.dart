import 'package:adistetsa/models/angketbk_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AngketPage extends StatefulWidget {
  @override
  _AngketPageState createState() => _AngketPageState();
}

class _AngketPageState extends State<AngketPage> {
  PlatformFile? file;
  bool isLoading = true;
  FilePickerResult? result;
  AngketBKModel angket = AngketBKModel();

  _selectFolder() async {
    result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        file = result!.files.first;
      });
    } else {}
  }

  void getInit({String? jenisAngket}) async {
    angket = await Services().getAngketSiswa(jenisAngket: jenisAngket);
    if (this.mounted) {
      setState(() {});
    }
    isLoading = false;
  }

  void iniState() {
    super.initState();
    getInit();
  }

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    getInit(jenisAngket: provider.angket);
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceWebView: true,
          enableJavaScript: true,
        );
      } else {
        Navigator.pushNamed(context, '/error-page');
      }
    }

    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Angket ${provider.angket}',
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

    Widget document({
      required String docName,
      required String docSize,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Silahkan unduh angket dibawah ini.',
            style: mono1TextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          GestureDetector(
            onTap: () {
              launchUrl(
                  'https://adistetsa.pythonanywhere.com/${angket.fILEANGKET}');
            },
            child: Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: mono6Color,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: m1Color,
                  )),
              child: Row(
                children: [
                  Icon(
                    Icons.description_outlined,
                    color: m1Color,
                    size: 30,
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(docName),
                        Text(docSize),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.file_download_outlined,
                    color: m1Color,
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget uploadJawaban() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Unggah Jawaban',
              style: mono1TextStyle.copyWith(
                fontWeight: regular,
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
              if (file == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: dangerColor,
                    content: Text(
                      'Silahkan unggah jawaban anda terlebih dahulu',
                      textAlign: TextAlign.center,
                    )));
              } else {
                try {
                  setState(() {
                    isLoading = true;
                  });
                  await Services().patchAngketSiswa(
                      jenisAngket: provider.angket, fileUpload: file!.path);
                  setState(() {
                    isLoading = false;
                  });
                  file = null;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: successColor,
                      content: Text(
                        'Berhasil melakukan upload data',
                        textAlign: TextAlign.center,
                      )));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: dangerColor,
                      content: Text(
                        '$e',
                        textAlign: TextAlign.center,
                      )));
                }
              }
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: m1Color,
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  document(
                    docName: '${angket.fILEANGKET}'.split('/')[3],
                    docSize: '${angket.kATEGORI}',
                  ),
                  uploadJawaban(),
                  buttonSubmit(),
                ],
              ),
            ),
    );
  }
}
