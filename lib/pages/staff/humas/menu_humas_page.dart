import 'package:adistetsa/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class MenuHumasPage extends StatefulWidget {
  @override
  State<MenuHumasPage> createState() => _MenuHumasPageState();
}

class _MenuHumasPageState extends State<MenuHumasPage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    PreferredSizeWidget logUksHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          '${provider.fiturHumas}',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: mono1Color,
        ),
      );
    }

    Widget itemList({required String name, required String url}) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '$url');
        },
        child: Container(
          // color: m1Color,
          width: double.infinity,
          margin: EdgeInsets.only(
            bottom: 18,
            left: 7,
            right: 7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 16,
                  left: 13,
                  right: 13,
                ),
                child: Text(
                  '$name',
                  style: mono1TextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              Divider(
                color: mono2Color,
                height: 1,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: logUksHeader(),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            itemList(
              name: 'Masukkan Data',
              url: provider.fiturHumas == 'Log UKS'
                  ? '/staff/humas/loguks/pilihPTK'
                  : '/staff/buku-tamu/input-data',
            ),
            itemList(
              name: 'Riwayat Data',
              url: provider.fiturHumas == 'Log UKS'
                  ? '/staff/humas/loguks/riwayat-data'
                  : '/staff/buku-tamu/riwayat',
            ),
          ],
        ),
      ),
    );
  }
}
