import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StaffFeedbackPage extends StatefulWidget {
  @override
  _StaffFeedbackPageState createState() => _StaffFeedbackPageState();
}

class _StaffFeedbackPageState extends State<StaffFeedbackPage> {
  TextEditingController kritikSaranController = TextEditingController(text: '');
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
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
                initialRating: 1,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
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
              width: 283,
              child: Text(
                'Terimakasih banyak bu, saran saya mungkin ibu tidak perlu merasa berhati - hati dalam memberikan nasehat kepada saya',
                style: mono2TextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
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
              urlImage:
                  'https://yt3.ggpht.com/ytc/AKedOLRr2b60uBxJkwXewo3SdAFNLmnSlXnkJxCTr98uhg=s900-c-k-c0x00ffffff-no-rj',
              name: 'Adam Babi',
            ),
            kritikSaranInput(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
