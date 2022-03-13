import 'package:adistetsa/providers/provider.dart';
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
          onChanged: (newValue) {
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

            //Note: await disini
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget listKonsulen(
        {required String name, required String tahun, required String status}) {
      return GestureDetector(
        onTap: () {
          provider.setStatus = status;
          print(provider.status);
          Navigator.pushNamed(context, '/user/bk/status-data/detail');
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
                              : status == 'Diterima'
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
        child: ListView(
          children: [
            listKonsulen(
              name: 'Adam Babi',
              tahun: '33-03-2033',
              status: 'Diajukan',
            ),
            listKonsulen(
              name: 'Adam Babi',
              tahun: '33-03-2033',
              status: 'Ditolak',
            ),
            listKonsulen(
              name: 'Adam Babi',
              tahun: '33-03-2033',
              status: 'Diterima',
            ),
            listKonsulen(
              name: 'Adam Babi',
              tahun: '33-03-2033',
              status: 'Selesai',
            ),
            listKonsulen(
              name: 'Adam Babi',
              tahun: '33-03-2033',
              status: 'Telah Mengisi Feedback',
            ),
            for (var i = 0; i < 10; i++)
              listKonsulen(
                name: 'Adam Babi',
                tahun: '33-03-2033',
                status: 'Diajukan',
              ),
          ],
        ),
      ),
    );
  }
}
