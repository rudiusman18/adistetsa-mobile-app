import 'package:adistetsa/models/detail_daftar_konsultasi_bk_model.dart';
import 'package:adistetsa/models/konselor_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class KonsultasiSelesaiPage extends StatefulWidget {
  @override
  _KonsultasiSelesaiPageState createState() => _KonsultasiSelesaiPageState();
}

class _KonsultasiSelesaiPageState extends State<KonsultasiSelesaiPage> {
  TextEditingController kritikSaranController = TextEditingController(text: '');
  String ratingValue = '';
  bool isLoading = false;
  KonselorModel profile = KonselorModel();
  DetailDaftarKonsultasiBKModel dataInput = DetailDaftarKonsultasiBKModel();
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    profile = provider.dataKonselor;
    dataInput = provider.daftarKonsultasiBKModel;
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: mono6Color,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: mono1Color,
          ),
        ),
        title: Text(
          'Feedback HaloBK',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
      );
    }

    Widget body({required String urlImage, required String name}) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              urlImage,
              fit: BoxFit.fill,
              width: 120,
              height: 120,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  width: 120,
                  height: 120,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: m1Color,
                      value: loadingProgress.expectedTotalBytes != null
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
            height: 20,
          ),
          Divider(
            color: mono3Color,
            thickness: 0.5,
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            children: [
              Container(
                width: 184,
                child: Text(
                  'Berikan Penilaian kepada $name!',
                  style: mono1TextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  ratingValue = rating.toString();
                  print(ratingValue);
                },
              ),
            ],
          )
        ],
      );
    }

    Widget kritikSaranInput() {
      return Container(
        margin: EdgeInsets.only(top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saran dan Kritik',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 68),
              decoration: BoxDecoration(
                border: Border.all(
                  color: p1Color,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: kritikSaranController,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                style: mono1TextStyle.copyWith(
                  fontSize: 12,
                ),
                decoration: InputDecoration.collapsed(
                  hintText: 'Tuliskan saran dan kritik Anda disini...',
                  hintStyle: mono3TextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSubmit({required String name}) {
      return Container(
        margin: EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        height: 46,
        width: double.infinity,
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
            onPressed: () async {
              if (ratingValue != '' && kritikSaranController.text.isNotEmpty) {
                setState(() {
                  isLoading = true;
                });
                await Services().patchDetailDaftarKonsultasiBK(
                  rating: ratingValue,
                  kritikSaran: kritikSaranController.text,
                  id: dataInput.iD.toString(),
                  status: 'Telah Mengisi Feedback',
                );
                setState(() {
                  isLoading = false;
                });
                Navigator.pop(context);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: dangerColor,
                    content: Text(
                      'Anda harus mengisi semua form yang tersedia',
                      textAlign: TextAlign.center,
                    )));
              }
            },
            child: isLoading == false
                ? Text(
                    name,
                    style: mono6TextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  )
                : Container(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: mono6Color,
                    ),
                  )),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: header(),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            body(
              urlImage: '${profile.fOTO}',
              name: '${profile.nAMA}',
            ),
            kritikSaranInput(),
            SizedBox(
              height: 30,
            ),
            buttonSubmit(name: 'Simpan'),
          ],
        ),
      ),
    );
  }
}
