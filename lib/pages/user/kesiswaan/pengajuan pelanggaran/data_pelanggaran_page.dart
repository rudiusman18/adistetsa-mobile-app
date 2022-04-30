import 'package:adistetsa/models/jenispelanggaran_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataPelanggaranPage extends StatefulWidget {
  @override
  _DataPelanggaranPageState createState() => _DataPelanggaranPageState();
}

class _DataPelanggaranPageState extends State<DataPelanggaranPage> {
  bool isSearch = false;
  String urlSearch = '';
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  int currentIndex = 0;

  JenisPelanggaranModel jenisPelanggaranModel = JenisPelanggaranModel();

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);

    PreferredSizeWidget dataSiswaHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Data Pelanggaran',
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
            await Services().getJenisPelanggaran();
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

            await Services().getJenisPelanggaran();
            setState(() {
              isLoading = false;
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget dataSiswa({
      required int index,
      required String pelanggaran,
      required JenisPelanggaranModel jenisPelanggaran,
    }) {
      return GestureDetector(
        onTap: () {
          setState(() {
            jenisPelanggaranModel = jenisPelanggaran;
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
                    Flexible(
                      child: Text(
                        pelanggaran,
                        style: mono1TextStyle,
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

    Widget submitButton() {
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
              setState(() {
                provider.setJenisPelanggaran = jenisPelanggaranModel;
              });
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Pilih Pelanggaran',
                style: mono6TextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 16,
                ),
              ),
            )),
      );
    }

    return Scaffold(
      appBar: isSearch ? searchAppbar() : dataSiswaHeader(),
      backgroundColor: mono6Color,
      body: isLoading
          ? Container()
          : Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder(
                    future: Services().getJenisPelanggaran(search: urlSearch),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var index = 0;
                        List<JenisPelanggaranModel> data = snapshot.data;
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
                                  return dataSiswa(
                                    index: index,
                                    pelanggaran: '${item.kETERANGAN}',
                                    jenisPelanggaran: item,
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
                currentIndex != 0
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: submitButton(),
                      )
                    : SizedBox(),
              ],
            ),
    );
  }
}
