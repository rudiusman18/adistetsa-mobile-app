import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class EditLayananBkPage extends StatefulWidget {
  @override
  _EditLayananBkPageState createState() => _EditLayananBkPageState();
}

class _EditLayananBkPageState extends State<EditLayananBkPage> {
  TextEditingController kompetensiController = TextEditingController(text: '');
  TextEditingController alumnusController = TextEditingController(text: '');
  TextEditingController linkWhatsappController =
      TextEditingController(text: '');
  TextEditingController linkVidcallController = TextEditingController(text: '');
  bool isLoading = false;
  late FocusNode kompetensiFocusNode;
  late FocusNode alumnusFocusNode;
  late FocusNode linkWhatsappFocusNode;
  late FocusNode linkVidcallFocusNode;

  void initState() {
    super.initState();
    kompetensiFocusNode = FocusNode();
    alumnusFocusNode = FocusNode();
    linkWhatsappFocusNode = FocusNode();
    linkVidcallFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // menghapus focus node ketika form input tidak lagi dipilih
    kompetensiFocusNode.dispose();
    alumnusFocusNode.dispose();
    linkWhatsappFocusNode.dispose();
    linkVidcallFocusNode.dispose();
    super.dispose();
  }

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
          'Edit Data Staff BK',
          style: mono1TextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
      );
    }

    Widget kompetensiInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kompetensi',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: kompetensiFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    kompetensiFocusNode.requestFocus();
                  });
                },
                focusNode: kompetensiFocusNode,
                controller: kompetensiController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: kompetensiFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Kompetensi',
                  hintStyle: kompetensiFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget alumnusInput() {
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alumnus',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: alumnusFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    alumnusFocusNode.requestFocus();
                  });
                },
                focusNode: alumnusFocusNode,
                controller: alumnusController,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: alumnusFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Alumnus',
                  hintStyle: alumnusFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget linkWhatsappInput() {
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Link WhatsApp',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: linkWhatsappFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    linkWhatsappFocusNode.requestFocus();
                  });
                },
                focusNode: linkWhatsappFocusNode,
                controller: linkWhatsappController,
                keyboardType: TextInputType.url,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: linkWhatsappFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Link WhatsApp',
                  hintStyle: linkWhatsappFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget linkVidcallInput() {
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Link Video Conference',
              style: mono1TextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: linkVidcallFocusNode.hasFocus ? p1Color : mono3Color,
                ),
              ),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    linkVidcallFocusNode.requestFocus();
                  });
                },
                focusNode: linkVidcallFocusNode,
                controller: linkVidcallController,
                keyboardType: TextInputType.url,
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: linkVidcallFocusNode.hasFocus
                    ? p1TextStyle.copyWith(fontSize: 12)
                    : mono3TextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration.collapsed(
                  hintText: 'Link Video Conference',
                  hintStyle: linkVidcallFocusNode.hasFocus
                      ? p1TextStyle.copyWith(fontSize: 12)
                      : mono3TextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSubmit() {
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
            onPressed: () {},
            child: isLoading == false
                ? Text(
                    'Simpan',
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
      body: ListView(
        children: [
          kompetensiInput(),
          alumnusInput(),
          linkWhatsappInput(),
          linkVidcallInput(),
          buttonSubmit(),
        ],
      ),
    );
  }
}
