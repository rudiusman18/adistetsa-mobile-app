import 'package:adistetsa/providers/provider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class FiturOnePage extends StatefulWidget {
  const FiturOnePage({Key? key}) : super(key: key);

  @override
  State<FiturOnePage> createState() => _FiturOnePageState();
}

class _FiturOnePageState extends State<FiturOnePage> {
  bool isSearch = false;
  String urlSearch = '';
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of(context);
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          '${provider.fiturAdiwiyata}',
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

    Widget infoCard({
      required String infoMessage,
      String? sampahKering,
      String? sampahBasah,
      String? totalSampah,
    }) {
      return Container(
        padding: EdgeInsets.all(24),
        color: m4Color,
        width: double.infinity,
        child: provider.fiturAdiwiyata == 'Tabungan Sampah'
            ? Column(
                children: [
                  Center(
                    child: Text(
                      infoMessage,
                      style: mono6TextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/adiwiyata/tabungan_sampah/sampah_kering.png',
                            height: 30,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Sampah Kering',
                            style: mono6TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '$sampahKering',
                            style: mono6TextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/adiwiyata/tabungan_sampah/sampah_basah.png',
                            height: 30,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Sampah Basah',
                            style: mono6TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '$sampahBasah',
                            style: mono6TextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/adiwiyata/tabungan_sampah/total_tabungan.png',
                            height: 30,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Total Tabungan',
                            style: mono6TextStyle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '$totalSampah',
                            style: mono6TextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            : Center(
                child: Text(
                  infoMessage,
                  style: mono6TextStyle.copyWith(fontSize: 12),
                ),
              ),
      );
    }

    Widget expandableItem({
      required String inputSatu,
      required String inputDua,
      required String inputTiga,
      required String inputEmpat,
      required String inputLima,
      required String urlDokumentasi,
      required String urlMOU,
    }) {
      return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 7,
            right: 7,
            bottom: 18,
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
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      provider.fiturAdiwiyata == 'Jejaring Kerja' ||
                              provider.fiturAdiwiyata == 'Pemeliharaan Pohon' ||
                              provider.fiturAdiwiyata == 'Tabungan Sampah'
                          ? Container()
                          : Text(
                              '$inputSatu',
                              style: mono1TextStyle.copyWith(
                                fontSize: 10,
                              ),
                            ),
                      Text(
                        '$inputDua',
                        style: mono1TextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      provider.fiturAdiwiyata == 'Kegiatan Kader' ||
                              provider.fiturAdiwiyata == 'Pembibitan Pohon' ||
                              provider.fiturAdiwiyata ==
                                  'Pemeliharaan Sampah' ||
                              provider.fiturAdiwiyata == 'Tabungan Sampah'
                          ? Container()
                          : Text(
                              '$inputTiga',
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
                    horizontal: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      provider.fiturAdiwiyata == 'Karya Inovatif PRLH' ||
                              provider.fiturAdiwiyata == '3R'
                          ? Container(
                              margin: EdgeInsets.only(top: 11),
                              child: Text(
                                '$inputEmpat',
                                style: mono1TextStyle.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                            )
                          : Container(),
                      provider.fiturAdiwiyata == 'Tabungan Sampah'
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/adiwiyata/tabungan_sampah/sampah_kering.png',
                                      height: 30,
                                      color: mono1Color,
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Sampah Kering',
                                      style: mono1TextStyle.copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '$inputTiga',
                                      style: mono1TextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/adiwiyata/tabungan_sampah/sampah_basah.png',
                                      height: 30,
                                      color: mono1Color,
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Sampah Basah',
                                      style: mono1TextStyle.copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '$inputEmpat',
                                      style: mono1TextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/adiwiyata/tabungan_sampah/total_tabungan.png',
                                      height: 30,
                                      color: mono1Color,
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Total Tabungan',
                                      style: mono1TextStyle.copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '$inputLima',
                                      style: mono1TextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Text(
                              'Keterangan',
                              style: mono1TextStyle.copyWith(
                                fontWeight: semiBold,
                                fontSize: 10,
                              ),
                            ),
                      SizedBox(
                        height: 2,
                      ),
                      provider.fiturAdiwiyata == 'Tabungan Sampah'
                          ? Container()
                          : Text(
                              '$inputLima',
                              style: mono1TextStyle.copyWith(
                                fontSize: 10,
                              ),
                            ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          provider.fiturAdiwiyata == 'Jejaring Kerja'
                              ? Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor: m5Color,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                          color: m5Color,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.file_download_outlined,
                                          color: mono6Color,
                                          size: 11,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'MOU',
                                          style: mono6TextStyle.copyWith(
                                            fontWeight: semiBold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: m5Color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  color: m5Color,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.file_download_outlined,
                                  color: mono6Color,
                                  size: 11,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                provider.fiturAdiwiyata == 'Tabungan Sampah'
                                    ? Text(
                                        'Download',
                                        style: mono6TextStyle.copyWith(
                                          fontWeight: semiBold,
                                          fontSize: 10,
                                        ),
                                      )
                                    : Text(
                                        'Dokumentasi',
                                        style: mono6TextStyle.copyWith(
                                          fontWeight: semiBold,
                                          fontSize: 10,
                                        ),
                                      ),
                              ],
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
      appBar: isSearch == true ? searchAppbar() : header(),
      body: Column(
        children: [
          provider.fiturAdiwiyata == 'Penanaman Pohon'
              ? infoCard(
                  infoMessage: 'Hingga 2022-02-02 Jumlah pohon yang ditanam 65',
                )
              : provider.fiturAdiwiyata == 'Tabungan Sampah'
                  ? infoCard(
                      infoMessage: 'Toal Tabungan Sampah Maret 2022',
                      sampahKering: '7Kg',
                      sampahBasah: '8Kg',
                      totalSampah: '15Kg',
                    )
                  : Container(),
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                for (var i = 0; i < 30; i++)
                  provider.fiturAdiwiyata == 'Sanitasi Drainase'
                      ? expandableItem(
                          inputSatu: '2022-02-22',
                          inputDua: 'Pembersihan Kamar Mandi',
                          inputTiga: 'Peserta Siswa',
                          inputEmpat: '',
                          inputLima: 'Dilakukan pengurasan kamar mandi',
                          urlDokumentasi: '',
                          urlMOU: '',
                        )
                      : provider.fiturAdiwiyata == 'Jejaring Kerja'
                          ? expandableItem(
                              inputSatu: '',
                              inputDua: 'Reboisasi Hutan Kota Malang',
                              inputTiga: '2022-02-22',
                              inputEmpat: '',
                              inputLima: 'http://',
                              urlDokumentasi: '',
                              urlMOU: '',
                            )
                          : provider.fiturAdiwiyata == 'Publikasi'
                              ? expandableItem(
                                  inputSatu: 'Website Sekolah',
                                  inputDua: 'Reboisasi Hutan Kota Malang',
                                  inputTiga: '2022-02-22',
                                  inputEmpat: '',
                                  inputLima: 'http://',
                                  urlDokumentasi: '',
                                  urlMOU: '',
                                )
                              : provider.fiturAdiwiyata == 'Kegiatan Kader'
                                  ? expandableItem(
                                      inputSatu: '2022-02-22',
                                      inputDua:
                                          'Penanaman Pohon Bakau Pantai A',
                                      inputTiga: '',
                                      inputEmpat: '',
                                      inputLima: 'http://',
                                      urlDokumentasi: '',
                                      urlMOU: '',
                                    )
                                  : provider.fiturAdiwiyata ==
                                          'Pembibitan Pohon'
                                      ? expandableItem(
                                          inputSatu: '2022-02-22',
                                          inputDua:
                                              'Penanaman Pohon Gunung Kawi',
                                          inputTiga: '',
                                          inputEmpat: '',
                                          inputLima:
                                              'Penanaman lahan gundul hutan kawi',
                                          urlDokumentasi: '',
                                          urlMOU: '',
                                        )
                                      : provider.fiturAdiwiyata ==
                                              'Penanaman Pohon'
                                          ? expandableItem(
                                              inputSatu: '2022-02-22',
                                              inputDua:
                                                  'Penanaman Pohon Gunung Kawi',
                                              inputTiga: 'Jumlah Pohon 55',
                                              inputEmpat: '',
                                              inputLima:
                                                  'Penanaman lahan gundul hutan kawi',
                                              urlDokumentasi: '',
                                              urlMOU: '',
                                            )
                                          : provider.fiturAdiwiyata ==
                                                  'Pemeliharaan Pohon'
                                              ? expandableItem(
                                                  inputSatu: '',
                                                  inputDua:
                                                      'Pemangkasan Pohon Sekolah',
                                                  inputTiga: '2022-02-22',
                                                  inputEmpat: '',
                                                  inputLima:
                                                      'Penanaman lahan gundul hutan kawi',
                                                  urlDokumentasi: '',
                                                  urlMOU: '',
                                                )
                                              : provider.fiturAdiwiyata ==
                                                      'Karya Inovatif PRLH'
                                                  ? expandableItem(
                                                      inputSatu: '2022-02-02',
                                                      inputDua:
                                                          'Pembuatan Tas Limbah Makanan RIngan',
                                                      inputTiga: 'Anabelle',
                                                      inputEmpat: 'Jenis ?',
                                                      inputLima:
                                                          'Penanaman lahan gundul hutan kawi',
                                                      urlDokumentasi: '',
                                                      urlMOU: '',
                                                    )
                                                  : provider.fiturAdiwiyata ==
                                                          'Penerapan PRLH'
                                                      ? expandableItem(
                                                          inputSatu:
                                                              '2022-02-02',
                                                          inputDua:
                                                              'Pembuatan Tas Limbah Makanan RIngan',
                                                          inputTiga:
                                                              'Peserta Siswa',
                                                          inputEmpat: '',
                                                          inputLima:
                                                              'Penerapan karya inovatif  Anabelle di gedung Aula',
                                                          urlDokumentasi: '',
                                                          urlMOU: '',
                                                        )
                                                      : provider.fiturAdiwiyata ==
                                                              '3R'
                                                          ? expandableItem(
                                                              inputSatu:
                                                                  '2022-02-02',
                                                              inputDua:
                                                                  'Pengolahan Sampah Botol Kaca',
                                                              inputTiga:
                                                                  'Recycle',
                                                              inputEmpat:
                                                                  'Peserta Siswa',
                                                              inputLima:
                                                                  'Hasil digunakan untuk memperindah taman',
                                                              urlDokumentasi:
                                                                  '',
                                                              urlMOU: '',
                                                            )
                                                          : provider.fiturAdiwiyata ==
                                                                  'Pemeliharaan Sampah'
                                                              ? expandableItem(
                                                                  inputSatu:
                                                                      '2022-02-02',
                                                                  inputDua:
                                                                      'Mengolah Sampah Organik Menjadi Kompos',
                                                                  inputTiga:
                                                                      'Recycle',
                                                                  inputEmpat:
                                                                      'Peserta Siswa',
                                                                  inputLima:
                                                                      'Mengolah Sampah Organik Menjadi Kompos',
                                                                  urlDokumentasi:
                                                                      '',
                                                                  urlMOU: '',
                                                                )
                                                              : provider.fiturAdiwiyata ==
                                                                      'Tabungan Sampah'
                                                                  ? expandableItem(
                                                                      inputSatu:
                                                                          '',
                                                                      inputDua:
                                                                          '2022-02-22',
                                                                      inputTiga:
                                                                          '5kg',
                                                                      inputEmpat:
                                                                          '5 kg',
                                                                      inputLima:
                                                                          '19 kg',
                                                                      urlDokumentasi:
                                                                          '',
                                                                      urlMOU:
                                                                          '',
                                                                    )
                                                                  : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
