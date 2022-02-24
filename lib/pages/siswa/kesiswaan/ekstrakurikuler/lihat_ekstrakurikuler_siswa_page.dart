import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class LihatEkstrakurikulerSiswaPage extends StatefulWidget {
  const LihatEkstrakurikulerSiswaPage({Key? key}) : super(key: key);

  @override
  _LihatEkstrakurikulerSiswaPageState createState() =>
      _LihatEkstrakurikulerSiswaPageState();
}

class _LihatEkstrakurikulerSiswaPageState
    extends State<LihatEkstrakurikulerSiswaPage> {
  bool isSearch = false;
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget lihatekstrakurikulerHeader() {
      return AppBar(
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        centerTitle: true,
        title: Text(
          'Lihat Ekstrakurikuler',
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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearch = true;
              });
            },
            icon: Icon(Icons.search_outlined),
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
              isSearch = false;
            });
          },
          child: Icon(
            Icons.arrow_back,
            color: mono1Color,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                searchController.clear();
              });
            },
            icon: Icon(
              Icons.clear_outlined,
              color: mono3Color,
            ),
          ),
        ],
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
              isLoading = true;
            });

            setState(() {
              isLoading = false;
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget listItem({
      required String name,
      required String date,
    }) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/siswa/lihat-ekskul/detail-page');
        },
        child: Container(
          color: mono6Color,
          margin: EdgeInsets.only(
            bottom: 12,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$name',
                          style: mono1TextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '$date',
                          style: mono2TextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Divider(
                color: mono3Color,
                height: 0.5,
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: isSearch == false ? lihatekstrakurikulerHeader() : searchAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
              listItem(name: 'Futsal', date: '2022-02-22'),
            ],
          ),
        ),
      ),
    );
  }
}
