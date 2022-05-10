import 'package:adistetsa/models/jadwalekskul_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class ListEkskulPelatih extends StatefulWidget {
  @override
  _ListEkskulPelatihState createState() => _ListEkskulPelatihState();
}

class _ListEkskulPelatihState extends State<ListEkskulPelatih> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
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
          'Daftar Ekskul',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
      );
    }

    contentItem({required String name, required String idEkskul}) {
      return GestureDetector(
        onTap: () {
          provider.setIdEkskul = idEkskul;
          Navigator.pushNamed(context, '/pelatih/daftar-anggota-page');
        },
        child: Container(
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
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: mono6Color,
      body: FutureBuilder(
        future: Services().getJadwalEkskul(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<JadwalEkskulModel> data = snapshot.data;
            return data.isEmpty
                ? Center(
                    child: Text(
                      'Data tidak ditemukan',
                      style: mono1TextStyle,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView(
                      children: data.map((item) {
                        return contentItem(
                            name: item.eKSKUL.toString(),
                            idEkskul: item.iDEKSKUL.toString());
                      }).toList(),
                    ),
                  );
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 4,
                color: m1Color,
              ),
            );
          }
        },
      ),
    );
  }
}
