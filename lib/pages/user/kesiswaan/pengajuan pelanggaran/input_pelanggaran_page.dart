import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class InputPelanggaranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono2Color,
        ),
      );
    }

    Widget inputItem({required String name}) {
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
                onPressed: () {
                  name == 'Nama Siswa Pelanggar'
                      ? Navigator.pushNamed(
                          context, '/user/kesiswaan/data-siswa-page')
                      : SizedBox();
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
                    name,
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
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(
              20,
            ),
            child: TextButton(
                onPressed: () {},
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
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        color: mono6Color,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Pilih File',
                        style: mono6TextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
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
            onPressed: () {},
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
            ),
            inputItem(
              name: 'Jenis Pelanggaran',
            ),
            buktiPelanggaran(),
            buttonSubmit(),
          ],
        ));
  }
}
