import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class DaftarKkonselingPage extends StatefulWidget {
  @override
  State<DaftarKkonselingPage> createState() => _DaftarKkonselingPageState();
}

class _DaftarKkonselingPageState extends State<DaftarKkonselingPage> {
  bool isSearch = false;
  String urlSearch = '';
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Daftar haloBK',
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

    Widget listKonsulen({
      required String urlImage,
      required String name,
      required String role,
      required String status,
    }) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: () {
            status == 'Online'
                ? Navigator.pushNamed(
                    context, '/user/bk/daftar-konseling/ajukan-konsultasi')
                : Container();
          },
          child: Column(
            children: [
              Container(
                color: status == 'Online' ? mono6Color : mono4Color,
                margin: EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        urlImage,
                        fit: BoxFit.fill,
                        width: 80,
                        height: 80,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Container(
                            width: 80,
                            height: 80,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: m1Color,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: mono1TextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            role,
                            style: mono1TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            status,
                            style: mono1TextStyle.copyWith(
                                fontSize: 10,
                                color: status == 'Online'
                                    ? successColor
                                    : dangerColor),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
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
        appBar: isSearch ? searchAppbar() : header(),
        body: ListView(
          children: [
            listKonsulen(
              urlImage:
                  'https://yt3.ggpht.com/ytc/AKedOLRr2b60uBxJkwXewo3SdAFNLmnSlXnkJxCTr98uhg=s900-c-k-c0x00ffffff-no-rj',
              name: 'Adam Anjing',
              role: 'BEBAN',
              status: 'Online',
            ),
            listKonsulen(
              urlImage:
                  'https://images.unsplash.com/photo-1549740425-5e9ed4d8cd34?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb',
              name: 'Adam Anjing',
              role: 'BEBAN',
              status: 'Offline',
            ),
            for (var i = 0; i < 5; i++)
              listKonsulen(
                urlImage:
                    'https://yt3.ggpht.com/ytc/AKedOLRr2b60uBxJkwXewo3SdAFNLmnSlXnkJxCTr98uhg=s900-c-k-c0x00ffffff-no-rj',
                name: 'Adam Anjing',
                role: 'BEBAN',
                status: 'Online',
              ),
          ],
        ));
  }
}
