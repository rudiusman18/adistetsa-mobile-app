import 'package:adistetsa/models/katalogekskul_model.dart';
import 'package:adistetsa/models/siswa_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class DetailLihatEkstrakurikulerSiswaPage extends StatefulWidget {
  const DetailLihatEkstrakurikulerSiswaPage({Key? key}) : super(key: key);

  @override
  _DetailLihatEkstrakurikulerSiswaPageState createState() =>
      _DetailLihatEkstrakurikulerSiswaPageState();
}

class _DetailLihatEkstrakurikulerSiswaPageState
    extends State<DetailLihatEkstrakurikulerSiswaPage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    KatalogEkskulModel katalogEkskulModel = provider.katalogEkskul;
    PreferredSizeWidget detaillihatekstrakurikulerHeader() {
      return AppBar(
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        centerTitle: true,
        title: Text(
          'Detail Ekstrakurikuler',
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

    Widget ekstrakurikulername({required String name}) {
      return Container(
        width: double.infinity,
        color: m2Color,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$name',
              style: mono5TextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget ekstrakurikulerBody({
      required String kategori,
      required String deskripsi,
      required String dokumentasi,
    }) {
      return Container(
        margin: EdgeInsets.fromLTRB(33, 20, 33, 54),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kategori',
                  style: mono1TextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  width: 81,
                ),
                Expanded(
                  child: Text(
                    '$kategori',
                    style: mono1TextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jadwal',
                    style: mono1TextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  for (var i = 0; i < katalogEkskulModel.jADWAL!.length; i++)
                    Text(
                      katalogEkskulModel.jADWAL![i],
                      style: mono1TextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: mono1TextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '$deskripsi',
                    style: mono1TextStyle.copyWith(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dokumentasi',
                    style: mono1TextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(
                    '$dokumentasi',
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
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
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: detaillihatekstrakurikulerHeader(),
      body: Column(
        children: [
          ekstrakurikulername(
            name: '${katalogEkskulModel.nAMA}',
          ),
          Expanded(
            child: ListView(
              children: [
                ekstrakurikulerBody(
                  kategori: '${katalogEkskulModel.kATEGORI}',
                  deskripsi: '${katalogEkskulModel.dESKRIPSI}',
                  dokumentasi: '${katalogEkskulModel.dOKUMENTASI}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
