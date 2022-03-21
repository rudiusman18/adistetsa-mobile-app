import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class LayananBkPage extends StatefulWidget {
  @override
  _LayananBkPageState createState() => _LayananBkPageState();
}

class _LayananBkPageState extends State<LayananBkPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: mono6Color,
        automaticallyImplyLeading: false,
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
          'HaloBK',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/staff/bk/halobk/edit').then(
                (_) => setState(() {}),
              );
            },
            child: Text(
              'Edit',
              style: mono2TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      );
    }

    Widget nameCard({
      required String name,
      required String role,
      required String status,
    }) {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: m2Color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Text(
              name,
              style: mono6TextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              role,
              style: mono6TextStyle.copyWith(
                fontSize: 10,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              status,
              style: mono6TextStyle.copyWith(
                fontSize: 10,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget infoItem({
      required IconData iconName,
      required String keterangan,
      required String value,
    }) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            iconName,
            color: m1Color,
            size: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                child: Center(
                  child: Text(
                    keterangan,
                    style: mono1TextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Text(
                value,
                style: mono2TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      );
    }

    buttonCommunication({
      required String url,
      required String iconName,
      required String keterangan,
    }) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(21),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: mono6Color,
          border: Border.all(
            color: p1Color,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              iconName,
              width: 30,
              height: 30,
              color: m1Color,
            ),
            SizedBox(
              width: 21,
            ),
            Flexible(
              child: Text(
                keterangan,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: semiBold,
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
          top: 60,
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
                    'Buka Layanan HaloBK',
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
        margin: EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          children: [
            nameCard(
              name: 'Adam Babi',
              role: 'Konsultas HaloBK',
              status: 'Offline',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListView(
                  children: [
                    infoItem(
                      iconName: Icons.subtitles_outlined,
                      keterangan: 'NIP',
                      value: '191203934090',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    infoItem(
                      iconName: Icons.app_registration,
                      keterangan: 'Kompetensi',
                      value: 'Pendidikan Pancasila dan Kewarganegaraan',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    infoItem(
                      iconName: Icons.school,
                      keterangan: 'Alumnus',
                      value: 'Universitas Negeri Malang, 2015',
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    buttonCommunication(
                      url: 'url',
                      iconName: 'assets/whatsapp.png',
                      keterangan: 'Hubungi Melalui Whatsapp',
                    ),
                    buttonCommunication(
                      url: '',
                      iconName: 'assets/videocam.png',
                      keterangan: 'Hubungi Melalui Video Conference',
                    ),
                    buttonSubmit(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
