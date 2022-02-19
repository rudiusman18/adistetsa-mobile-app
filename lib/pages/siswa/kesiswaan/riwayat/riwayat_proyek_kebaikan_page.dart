import 'package:adistetsa/models/laporankebaikan_model.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class RiwayatProyekKebaikanPage extends StatefulWidget {
  @override
  _RiwayatProyekKebaikanPageState createState() =>
      _RiwayatProyekKebaikanPageState();
}

Object? value1Item;
bool flag1 = false;

class _RiwayatProyekKebaikanPageState extends State<RiwayatProyekKebaikanPage> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget riwayatPelanggaranHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Riwayat Proyek Kebaikan',
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

    Widget downloadButton({required String url}) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
              onPressed: () async {
                await launch(url);
              },
              style: TextButton.styleFrom(
                backgroundColor: m5Color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.file_download_outlined,
                    color: mono6Color,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Bukti',
                    style: mono6TextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              )),
        ],
      );
    }

    Widget dataPelanggaran({
      required String name,
      required String date,
      required String urlDownload,
    }) {
      return Container(
        color: mono6Color,
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 18,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: mono1TextStyle,
                        ),
                        Text(
                          date,
                          style: mono2TextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  downloadButton(url: urlDownload),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              color: mono3Color,
              thickness: 0.5,
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: mono6Color,
        appBar: riwayatPelanggaranHeader(),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: FutureBuilder(
            future: Services().getLaporaKebaikan(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<LaporanKebaikanModel> data = snapshot.data;
                return data.isEmpty
                    ? Center(
                        child: Text(
                          'Data tidak ditemukan',
                          style: mono1TextStyle,
                        ),
                      )
                    : ListView(
                        children: data.map((item) {
                          return dataPelanggaran(
                            name: '${item.dATASISWA}',
                            date: '${item.tANGGALPENGAJUAN!.split('T')[0]}',
                            urlDownload: '${item.bUKTIPROGRAMKEBAIKAN}',
                          );
                        }).toList(),
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
        ));
  }
}
