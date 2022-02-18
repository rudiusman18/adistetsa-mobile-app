import 'package:adistetsa/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class InputProyekKebaikanPage extends StatefulWidget {
  @override
  _InputProyekKebaikanPageState createState() =>
      _InputProyekKebaikanPageState();
}

Object? value1Item;
bool flag1 = false;

class _InputProyekKebaikanPageState extends State<InputProyekKebaikanPage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    PreferredSizeWidget inputPelanggaranHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Pengajuan Proyek Kebaikan',
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
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: mono4Color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: mono3Color),
              ),
              child: Text(
                provider.siswa.nIS.toString() +
                    ' - ' +
                    provider.siswa.nAMA.toString(),
                style: mono2TextStyle.copyWith(
                  fontSize: 12,
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
              'Bukti Program Kebaikan',
              style: mono2TextStyle.copyWith(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
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
              ],
            ),
          ],
        ),
      );
    }

    Widget dropdownList1({required String hint, required List item}) {
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
              'Jenis Program Kebaikan',
              style: mono2TextStyle.copyWith(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: flag1 == true && value1Item != null
                        ? p1Color
                        : mono2Color,
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
                            : mono2Color,
                      ),
                      hint: Text(
                        hint,
                        style: mono3TextStyle.copyWith(
                          color: flag1 == true && value1Item != null
                              ? p1Color
                              : mono2Color,
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

    Widget buttonSubmit() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
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
              name: 'Nama Siswa',
            ),
            dropdownList1(
              hint: 'Jenis Program Kebaikan',
              item: ['A', 'B', 'C'],
            ),
            buktiPelanggaran(),
            value1Item == null ? SizedBox() : buttonSubmit(),
          ],
        ));
  }
}
