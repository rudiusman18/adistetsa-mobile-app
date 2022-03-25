import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class KaderPage extends StatefulWidget {
  const KaderPage({Key? key}) : super(key: key);

  @override
  State<KaderPage> createState() => _KaderPageState();
}

class _KaderPageState extends State<KaderPage> {
  bool isSearch = false;
  String urlSearch = '';
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget kaderHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Daftar Kader',
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
          color: mono1Color,
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
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget expandableItem({
      required String name,
      required String nis,
      required String phone,
      required String address,
    }) {
      return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 9,
          ),
          child: Column(
            children: [
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                  iconPadding: EdgeInsets.only(
                    bottom: 15,
                    right: 19,
                  ),
                ),
                header: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 39,
                  ),
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
                        '$nis',
                        style: mono1TextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                collapsed: Container(),
                expanded: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 39,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone_in_talk_outlined,
                            size: 18,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '$phone',
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.home_outlined,
                            size: 18,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '$address',
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
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
      backgroundColor: mono6Color,
      appBar: isSearch == true ? searchAppbar() : kaderHeader(),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          for (var i = 0; i < 30; i++)
            expandableItem(
              name: 'Cerry Bans',
              nis: '123819873182731893',
              address: 'Jl. Jombang',
              phone: '099233456789',
            ),
        ],
      ),
    );
  }
}
