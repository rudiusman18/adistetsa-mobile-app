import 'package:adistetsa/models/katalogbuku_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class DetailKatalogBukuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    KatalogBukuModel katalogBukuModel = provider.katalog;


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
                  '${katalogBukuModel.jUDUL}',
                  style: mono5TextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  '${katalogBukuModel.mEDIA}',
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
                  value: '${katalogBukuModel.pENULIS}',
                ),
                listItem(
                  name: 'Tahun Terbit',
                  value: '${katalogBukuModel.tAHUNTERBIT}',
                ),
                listItem(
                  name: 'ISBN',
                  value: '${katalogBukuModel.rEGISTER}',
                ),
                listItem(
                  name: 'Bahasa',
                  value: '${katalogBukuModel.bAHASA}',
                ),
                listItem(
                  name: 'Jumlah',
                  value: '${katalogBukuModel.tERSEDIA}',
                ),
                listItem(
                  name: 'Jenis Buku',
                  value: 'Buku ${katalogBukuModel.jENISBUKU}',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
