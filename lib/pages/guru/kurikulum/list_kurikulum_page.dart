import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/theme.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListKurikulumPage extends StatefulWidget {
  @override
  _ListKurikulumPageState createState() => _ListKurikulumPageState();
}

class _ListKurikulumPageState extends State<ListKurikulumPage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: mono6Color,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.arrow_back,
          color: mono1Color,
        ),
        title: Text(
          'Kurikulum',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
      );
    }

    contentItem({required String name}) {
      return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: mono1TextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Divider(
              thickness: 0.5,
              color: mono3Color,
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: header(),
        backgroundColor: mono6Color,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                setState(() {
                  loading(context);
                });
                await provider.getTahunAjaranFilter();
                Navigator.pushReplacementNamed(
                    context, '/guru/kurikulum/jadwal-mengajar-page');
              },
              child: contentItem(
                name: 'Jadwal Mengajar',
              ),
            ),
            GestureDetector(
              onTap: () async {
                setState(() {
                  loading(context);
                });
                await provider.getTahunAjaranFilter();
                Navigator.pushReplacementNamed(
                    context, '/guru/kurikulum/list-jurnal-belajar');
              },
              child: contentItem(
                name: 'Jurnal Belajar Mengajar',
              ),
            ),
          ],
        ));
  }
}
