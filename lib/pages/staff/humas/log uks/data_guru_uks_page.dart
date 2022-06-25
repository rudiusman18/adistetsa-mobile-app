import 'package:adistetsa/models/data_guru_uks_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataGuruUKSPage extends StatefulWidget {
  const DataGuruUKSPage({Key? key}) : super(key: key);

  @override
  State<DataGuruUKSPage> createState() => _DataGuruUKSPageState();
}

class _DataGuruUKSPageState extends State<DataGuruUKSPage> {
  bool isSearch = false;
  String urlSearch = '';
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  int currentIndex = 0;
  DataGuruUksModel dataGuruUKS = DataGuruUksModel();

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    PreferredSizeWidget dataGuruHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Data Guru',
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
              isLoading = true;
            });

            await Services().getDataGuruUKS();
            setState(() {
              isLoading = false;
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

            await Services().getDataGuruUKS();

            setState(() {
              isLoading = false;
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget dataGuru({
      required int index,
      required String name,
      required String nip,
      required String jenisPTK,
      required DataGuruUksModel guru,
    }) {
      return GestureDetector(
        onTap: () {
          setState(() {
            dataGuruUKS = guru;
            currentIndex = index;
            print(currentIndex);
          });
        },
        child: Container(
          color: mono6Color,
          margin: EdgeInsets.only(
            left: 8,
            right: 8,
            bottom: 12,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  children: [
                    currentIndex == index
                        ? Icon(
                            Icons.check_circle,
                            color: m1Color,
                          )
                        : SizedBox(
                            width: 24,
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: mono1TextStyle,
                          ),
                          Text(
                            nip,
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      jenisPTK,
                      style: mono1TextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
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
        ),
      );
    }

    Widget simpanButton() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        height: 46,
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
            onPressed: () {
              provider.setDataGuruUKS = dataGuruUKS;
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Pilih Guru',
                style: mono6TextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 16,
                ),
              ),
            )),
      );
    }

    return Scaffold(
      appBar: isSearch ? searchAppbar() : dataGuruHeader(),
      backgroundColor: mono6Color,
      body: isLoading
          ? Container()
          : Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder(
                    future: Services().getDataGuruUKS(search: urlSearch),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var index = 0;
                        List<DataGuruUksModel> data = snapshot.data;
                        print(data[1]);
                        return data.isEmpty
                            ? Center(
                                child: Text(
                                  'Data tidak ditemukan',
                                  style: mono1TextStyle,
                                ),
                              )
                            : ListView(
                                children: data.map((item) {
                                  index++;
                                  return dataGuru(
                                    index: index,
                                    name: '${item.nAMALENGKAP}',
                                    nip: '${item.nIP}',
                                    jenisPTK: '${item.jENISPTK}',
                                    guru: item,
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
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: currentIndex != 0 ? simpanButton() : SizedBox(),
                ),
              ],
            ),
    );
  }
}
