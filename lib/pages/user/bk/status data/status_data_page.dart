import 'package:adistetsa/models/status_pengajuan_konseling_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class StatusDataPage extends StatefulWidget {
  @override
  _StatusDataPageState createState() => _StatusDataPageState();
}

class _StatusDataPageState extends State<StatusDataPage> {
  bool isSearch = false;
  String urlSearch = '';
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Status haloBK',
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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearch = true;
              });
            },
            icon: Icon(Icons.search),
            color: mono2Color,
          ),
        ],
      );
    }

    PreferredSizeWidget searchAppbar() {
      return AppBar(
        backgroundColor: mono6Color,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () async {
            setState(() {
              searchController.clear();
              urlSearch = '';
              isSearch = false;
            });
          },
          child: Icon(
            Icons.arrow_back,
            color: mono1Color,
          ),
        ),
        title: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            isDense: true,
            border: InputBorder.none,
          ),
          onChanged: (newValue) async {
            setState(() {
              if (searchController.selection.start >
                  searchController.text.length) {
                searchController.selection = new TextSelection.fromPosition(
                    new TextPosition(offset: searchController.text.length));
                searchController.text = newValue.toString();
              }
              print(searchController.text);
              urlSearch = 'search=${searchController.text}';
              isLoading = true;
            });
            await Services().getPengajuanKonseling();

            setState(() {
              isLoading = false;
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget listKonsulen({
      required String idKonselor,
      required String id,
      required String name,
      required String tahun,
      required String status,
    }) {
      return GestureDetector(
        onTap: () async {
          provider.setStatus = status;
          loading(context);
          provider.setId = idKonselor;
          await provider.getDetailDaftarKonsultasiBK(id: id);
          Navigator.pushReplacementNamed(context, '/user/bk/status-data/detail')
              .then((_) async {
            setState(() {
              isLoading = true;
            });
            await Services().getPengajuanKonseling();
            setState(() {
              isLoading = false;
            });
          });
        },
        child: Container(
          color: mono6Color,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
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
                          tahun,
                          style: mono2TextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    status,
                    style: mono1TextStyle.copyWith(
                      fontSize: 10,
                      color: status == 'Diajukan'
                          ? infoColor
                          : status == 'Ditolak'
                              ? dangerColor
                              : status == 'Dijadwalkan'
                                  ? successColor
                                  : status == 'Selesai'
                                      ? p1Color
                                      : status == 'Telah Mengisi Feedback'
                                          ? warningColor
                                          : mono1Color,
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Divider(
                color: mono3Color,
                thickness: 0.5,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: isSearch ? searchAppbar() : header(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: isLoading == true
            ? Container()
            : FutureBuilder(
                future: Services().getPengajuanKonseling(search: urlSearch),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<StatusPengajuanKonselingModel> data = snapshot.data;
                    return data.isEmpty
                        ? Center(
                            child: Text(
                              'Data tidak ditemukan',
                              style: mono1TextStyle,
                            ),
                          )
                        : ListView(
                            children: data.map((item) {
                              return listKonsulen(
                                idKonselor: '${item.kONSELOR}',
                                id: '${item.iD}',
                                name: '${item.nAMAKONSELOR}',
                                tahun: '${item.tANGGALKONSULTASI}',
                                status: '${item.sTATUS}',
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
              ), // ListView(
      ),
    );
  }
}
