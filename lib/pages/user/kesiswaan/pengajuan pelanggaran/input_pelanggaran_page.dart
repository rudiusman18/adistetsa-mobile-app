import 'package:adistetsa/models/jenispelanggaran_model.dart';
import 'package:adistetsa/models/siswa_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class InputPelanggaranPage extends StatefulWidget {
  @override
  _InputPelanggaranPageState createState() => _InputPelanggaranPageState();
}

PlatformFile? file;
FilePickerResult? result;

class _InputPelanggaranPageState extends State<InputPelanggaranPage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    SiswaModel siswaModel = provider.dataSiswa;
    JenisPelanggaranModel jenisPelanggaranModel = provider.jenisPelanggaran;

    _selectFolder() async {
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (result != null) {
        setState(() {
          file = result!.files.first;
        });
      } else {}
    }

    PreferredSizeWidget inputPelanggaranHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Pengajuan Pelanggaran',
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
            provider.clearDataSiswa();
            jenisPelanggaranModel = JenisPelanggaranModel();
            file = null;
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono2Color,
        ),
      );
    }

    Widget inputItem({required String name, required String value}) {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: mono2TextStyle.copyWith(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: TextButton(
                onPressed: () async {
                  if (name == 'Nama Siswa Pelanggar') {
                    Navigator.pushNamed(
                        context, '/user/kesiswaan/data-siswa-page');
                  } else if (name == 'Jenis Pelanggaran') {
                    Navigator.pushNamed(
                        context, '/user/kesiswaan/data-pelanggaran-page');
                  } else {
                    SizedBox();
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: mono6Color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: mono3Color),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value,
                    style: mono3TextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buktiPelanggaran() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bukti Laporan',
              style: mono2TextStyle.copyWith(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            TextButton(
                onPressed: () {
                  _selectFolder();
                },
                style: TextButton.styleFrom(
                  backgroundColor: m5Color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Row(
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
                          (file == null) ? 'Pilih File' : file!.name.toString(),
                          style: mono6TextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      );
    }

    Widget buttonSubmit() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
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
              if (await Services().laporanPelanggaran(
                dataSiswa: siswaModel.nIS.toString(),
                jenisPelanggaran: jenisPelanggaranModel.iD.toString(),
                filepath: file != null ? file!.path : null,
              )) {
                setState(() {
                  provider.setDataSiswa = SiswaModel();
                  provider.setJenisPelanggaran = JenisPelanggaranModel();
                  file = null;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: successColor,
                      content: Text(
                        'Berhasil mengajukan laporan',
                        textAlign: TextAlign.center,
                      )));
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: dangerColor,
                    content: Text(
                      'Gagal mengajukan laporan',
                      textAlign: TextAlign.center,
                    )));
              }
            },
            child: Text(
              'Simpan',
              style: mono6TextStyle.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            )),
      );
    }

    return Scaffold(
        backgroundColor: mono6Color,
        appBar: inputPelanggaranHeader(),
        body: ListView(
          children: [
            inputItem(
                name: 'Nama Siswa Pelanggar',
                value: siswaModel.nAMA != null
                    ? '${siswaModel.nIS} - ${siswaModel.nAMA}'
                    : 'Nama Siswa Pelanggar'),
            inputItem(
                name: 'Jenis Pelanggaran',
                value: jenisPelanggaranModel.kETERANGAN != null
                    ? '${jenisPelanggaranModel.kETERANGAN}'
                    : 'Jenis Pelanggaran'),
            buktiPelanggaran(),
            buttonSubmit(),
          ],
        ));
  }
}
