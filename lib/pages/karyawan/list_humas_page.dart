import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListHumasPage extends StatefulWidget {
  @override
  _ListHumasPageState createState() => _ListHumasPageState();
}

class _ListHumasPageState extends State<ListHumasPage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Hubungan Masyarakat',
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
            Navigator.pushNamedAndRemoveUntil(
                context, '/main-page/back', (route) => false);
          },
          icon: Icon(Icons.arrow_back),
          color: mono2Color,
        ),
      );
    }

    Widget contentItem(String text) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        padding: EdgeInsets.only(
          bottom: 17,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: mono1TextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16,
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
      backgroundColor: mono6Color,
      appBar: header(),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              provider.setFiturHumas = 'Log UKS';
              Navigator.pushNamed(context, '/staff/humas/');
            },
            child: contentItem(
              'Log UKS',
            ),
          ),
          GestureDetector(
            onTap: () {
              provider.setFiturHumas = 'Buku Tamu';
              Navigator.pushNamed(context, '/staff/humas/');
            },
            child: contentItem(
              'Buku Tamu',
            ),
          ),
        ],
      ),
    );
  }
}
