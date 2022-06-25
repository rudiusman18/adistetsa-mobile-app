import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PilihPTKPage extends StatefulWidget {
  PilihPTKPage({Key? key}) : super(key: key);

  @override
  State<PilihPTKPage> createState() => _PilihPTKPageState();
}

class _PilihPTKPageState extends State<PilihPTKPage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    PreferredSizeWidget pilihPTKHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Log UKS',
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

    Widget itemList({required String name}) {
      return GestureDetector(
        onTap: () {
          provider.setNamaPTK = name;
          Navigator.pushNamed(context, '/staff/humas/loguks/input-data');
        },
        child: Container(
          color: mono6Color,
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
      appBar: pilihPTKHeader(),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          itemList(
            name: 'Siswa',
          ),
          itemList(
            name: 'Guru',
          ),
          itemList(
            name: 'Karyawan',
          ),
        ],
      ),
    );
  }
}
