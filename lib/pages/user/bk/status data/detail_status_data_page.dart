import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class DetailStatusDataPage extends StatefulWidget {
  @override
  _DetailStatusDataPageState createState() => _DetailStatusDataPageState();
}

class _DetailStatusDataPageState extends State<DetailStatusDataPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    RolesModel rolesModel = provider.role;

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
                          : value == 'Dijadwalkan'
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
          top: 60,
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
                color: m2Color,
                width: 2,
              ),
              backgroundColor: m2Color,
            ),
            onPressed: () async {
              if (name == 'Batalkan') {
                loading(context);
                await Services().deleteDaftarKonsultasi(
                  id: provider.daftarKonsultasiBKModel.iD.toString(),
                );
                Navigator.pop(context);
                Navigator.pop(context);
              }

              if (provider.status == 'Dijadwalkan') {
                loading(context);
                await provider.getDetailDaftarKonsultasiBK(
                    id: provider.daftarKonsultasiBKModel.iD.toString());
                Navigator.pushReplacementNamed(
                    context, '/user/bk/status-data/diterima');
              }
              if (provider.status == 'Selesai') {
                loading(context);
                await provider.getDetailDaftarKonsultasiBK(
                    id: provider.daftarKonsultasiBKModel.iD.toString());
                await provider.getDataKonselor(id: provider.idStaff);
                Navigator.pushReplacementNamed(
                    context, '/user/bk/status-data/selesai');
              }
            },
            child: isLoading == false
                ? Text(
                    name,
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
      backgroundColor: mono6Color,
      appBar: header(),
      body: Column(
        children: [
          profile(
            name: '${provider.daftarKonsultasiBKModel.kONSELOR}',
            role: 'Konsultan BK',
          ),
          Expanded(
            child: ListView(
              children: [
                rolesModel.name == 'Siswa'
                    ? item(
                        name: 'Nama Siswa',
                        value: '${provider.daftarKonsultasiBKModel.nAMA}',
                      )
                    : rolesModel.name == 'Guru'
                        ? item(
                            name: 'Nama Guru',
                            value: '${provider.guru.nAMALENGKAP}',
                          )
                        : rolesModel.name == 'Karyawan'
                            ? item(
                                name: 'Nama Karyawan',
                                value: '${provider.karyawan.nAMALENGKAP}',
                              )
                            : Container(),
                rolesModel.name == 'Guru' || rolesModel.name == 'Karyawan'
                    ? Container()
                    : item(
                        name: 'Kelas',
                        value: '${provider.daftarKonsultasiBKModel.kELAS}',
                      ),
                rolesModel.name == 'Guru' || rolesModel.name == 'Karyawan'
                    ? Container()
                    : item(
                        name: 'NISN',
                        value: '${provider.daftarKonsultasiBKModel.nISN}',
                      ),
                rolesModel.name == 'Guru'
                    ? item(
                        name: 'NIP',
                        value: '${provider.guru.nIP}',
                      )
                    : rolesModel.name == 'Karyawan'
                        ? item(
                            name: 'NIK',
                            value: '${provider.karyawan.nIK}',
                          )
                        : item(
                            name: 'NIS',
                            value: '${provider.daftarKonsultasiBKModel.nIS}',
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
                  value: '${provider.daftarKonsultasiBKModel.sTATUS}',
                ),
                provider.status == 'Diajukan'
                    ? buttonSubmit(name: 'Batalkan')
                    : provider.status == 'Dijadwalkan'
                        ? buttonSubmit(name: 'Konsultasi HaloBk')
                        : provider.status == 'Selesai'
                            ? buttonSubmit(name: 'Berikan Feedback')
                            : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
