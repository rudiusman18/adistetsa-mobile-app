import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class DetailStatusDataStaffHalobkPage extends StatefulWidget {
  @override
  _DetailStatusDataStaffHalobkPageState createState() =>
      _DetailStatusDataStaffHalobkPageState();
}

class _DetailStatusDataStaffHalobkPageState
    extends State<DetailStatusDataStaffHalobkPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);

    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Detail haloBK',
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

    Widget profile({required String name, required String role}) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 20),
        width: double.infinity,
        color: m2Color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: mono6TextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Text(
              role,
              style: mono6TextStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }

    Widget item({required String name, required String value}) {
      return Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            width: 110,
            child: Text(
              name,
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                value,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                  color: value == 'Diajukan'
                      ? infoColor
                      : value == 'Ditolak'
                          ? dangerColor
                          : value == 'Diterima'
                              ? successColor
                              : value == 'Selesai'
                                  ? p1Color
                                  : value == 'Telah Mengisi Feedback'
                                      ? warningColor
                                      : mono1Color,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSubmit({required String name}) {
      return Container(
        margin: EdgeInsets.only(
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
                color: name == 'Setuju'
                    ? successColor
                    : name == 'Lihat Feedback' &&
                            provider.daftarKonsultasiBKModel.rATING == null
                        ? mono2Color
                        : m2Color,
                width: 2,
              ),
              backgroundColor: name == 'Setuju'
                  ? successColor
                  : name == 'Tolak'
                      ? mono6Color
                      : name == 'Lihat Feedback' &&
                              provider.daftarKonsultasiBKModel.rATING == null
                          ? mono2Color
                          : m2Color,
            ),
            onPressed: () async {
              if (name == 'Tolak') {
                loading(context);
                await Services().deleteDetailDaftarKonsultasiBK(
                    id: '${provider.daftarKonsultasiBKModel.iD}');
                Navigator.pop(context);
                Navigator.pop(context);
              }

              if (name == 'Selesai Konsultasi') {
                loading(context);
                await Services().patchDetailDaftarKonsultasiBK(
                    id: '${provider.daftarKonsultasiBKModel.iD}',
                    status: 'Selesai');
                Navigator.pop(context);
                Navigator.pop(context);
              }

              if (name == 'Setuju') {
                loading(context);
                await Services().patchDetailDaftarKonsultasiBK(
                    id: '${provider.daftarKonsultasiBKModel.iD}',
                    status: 'Dijadwalkan');
                Navigator.pop(context);
                Navigator.pop(context);
              }
              name == 'Lihat Feedback' &&
                      provider.daftarKonsultasiBKModel.kRITIKSARAN!.isNotEmpty
                  ? Navigator.pushNamed(
                      context, '/staff/bk/status-data/detail/feedback')
                  : Container();
            },
            child: isLoading == false
                ? Text(
                    name,
                    style: mono6TextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 16,
                      color: name == 'Tolak' ? m2Color : mono6Color,
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
      backgroundColor: mono6Color,
      appBar: header(),
      body: Column(
        children: [
          profile(
            name: '${provider.daftarKonsultasiBKModel.nAMA}',
            role: '${provider.daftarKonsultasiBKModel.kELAS}',
          ),
          Expanded(
            child: ListView(
              children: [
                item(
                  name: 'Nama Siswa',
                  value: '${provider.daftarKonsultasiBKModel.nAMA}',
                ),
                item(
                  name: 'Kelas',
                  value: '${provider.daftarKonsultasiBKModel.kELAS}',
                ),
                item(
                  name: 'NISN',
                  value: '${provider.daftarKonsultasiBKModel.nISN}',
                ),
                item(
                  name: 'NIS',
                  value: '${provider.daftarKonsultasiBKModel.nISN}',
                ),
                item(
                  name: 'Tanggal',
                  value:
                      '${provider.daftarKonsultasiBKModel.tANGGALKONSULTASI}',
                ),
                item(
                  name: 'Jam',
                  value:
                      '${provider.daftarKonsultasiBKModel.jAMAWAL!.split(':')[0]}:${provider.daftarKonsultasiBKModel.jAMAWAL!.split(':')[1]} - ${provider.daftarKonsultasiBKModel.jAMAKHIR!.split(':')[0]}:${provider.daftarKonsultasiBKModel.jAMAKHIR!.split(':')[1]}',
                ),
                item(
                  name: 'Jenis Masalah',
                  value: '${provider.daftarKonsultasiBKModel.jENISMASALAH}',
                ),
                item(
                  name: 'Status Pengajuan',
                  value: '${provider.staffStatus}',
                ),
                SizedBox(
                  height: 60,
                ),
                provider.staffStatus == 'Diajukan'
                    ? buttonSubmit(name: 'Setuju')
                    : provider.staffStatus == 'Dijadwalkan'
                        ? buttonSubmit(name: 'Selesai Konsultasi')
                        : provider.staffStatus == 'Selesai'
                            ? buttonSubmit(name: 'Lihat Feedback')
                            : Container(),
                provider.staffStatus == 'Diajukan'
                    ? buttonSubmit(name: 'Tolak')
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
