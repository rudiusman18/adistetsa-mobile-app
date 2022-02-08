import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';

class KatalogBuku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mono6Color,
        body: Center(
          child: Text(
            'Ini adalah halaman katalog buku',
          ),
        ));
  }
}
