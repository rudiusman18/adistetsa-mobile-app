import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class DetailKatalogBukuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    RolesModel rolesModel = provider.role;
    PreferredSizeWidget detailKatalogHeader() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Detail Buku',
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

    Widget listItem({required String name, required String value}) {
      return Container(
        margin: EdgeInsets.only(
          bottom: 25,
          left: 37,
          right: 37,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                name,
                style: mono1TextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: detailKatalogHeader(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 15,
            ),
            width: double.infinity,
            color: m2Color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bumi',
                  style: mono5TextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  'Novel',
                  style: mono5TextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                listItem(
                  name: 'Pengarang',
                  value: 'Tere Liye',
                ),
                listItem(
                  name: 'Penerbit',
                  value: 'Gramedia',
                ),
                listItem(
                  name: 'Pengarang',
                  value: 'Tere Liye',
                ),
                listItem(
                  name: 'Kota Terbit',
                  value: 'Jakarta',
                ),
                listItem(
                  name: 'Tahun Terbit',
                  value: '2020',
                ),
                listItem(
                  name: 'ISBN',
                  value: '978-602-8519-93-9',
                ),
                listItem(
                  name: 'Volume',
                  value: '1',
                ),
                listItem(
                  name: 'Edisi',
                  value: '1',
                ),
                listItem(
                  name: 'Bahasa',
                  value: 'Indonesia',
                ),
                listItem(
                  name: 'Jumlah',
                  value: '1 eks',
                ),
                listItem(
                  name: 'Deskripsi Fisik',
                  value: 'hlm 156, ilus 45 cm',
                ),
                listItem(
                  name: 'Tipe Kode',
                  value: 'Book',
                ),
                rolesModel.name != 'Staf Perpustakaan'
                    ? Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 50,
                            bottom: 30,
                          ),
                          width: 284,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: m2Color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                            ),
                            child: Text(
                              'Pinjam Buku',
                              style: mono6TextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
