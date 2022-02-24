import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class DaftarEkstrakurikulerSiswaPage extends StatefulWidget {
  const DaftarEkstrakurikulerSiswaPage({Key? key}) : super(key: key);

  @override
  _DaftarEkstrakurikulerSiswaPageState createState() =>
      _DaftarEkstrakurikulerSiswaPageState();
}

class _DaftarEkstrakurikulerSiswaPageState
    extends State<DaftarEkstrakurikulerSiswaPage> {
  // Note: get date
  DateTime? selectedDate;
  String tanggalPendaftaran = '';
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
        tanggalPendaftaran = selectedDate.toString().split(' ')[0].toString();
        print(selectedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget daftarekstrakurikulerHeader() {
      return AppBar(
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        centerTitle: true,
        title: Text(
          'Daftar Ekstrakurikuler',
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

    Widget inputTanggal() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal',
              style: mono2TextStyle.copyWith(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              height: 44,
              child: TextButton(
                onPressed: () {
                  _selectDate(context);
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: mono2Color,
                          width: 2,
                        ))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate == null
                            ? 'Tanggal Pengajuan'
                            : tanggalPendaftaran,
                        style: mono2TextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: mono2Color,
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
        height: 46,
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 21,
          right: 18,
        ),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: m2Color,
            primary: m2Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Ajukan Ekstrakurikuler',
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
      appBar: daftarekstrakurikulerHeader(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            inputTanggal(),
            buttonSubmit(),
          ],
        ),
      ),
    );
  }
}
