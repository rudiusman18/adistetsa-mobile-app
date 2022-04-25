import 'package:adistetsa/models/penanaman_pohon_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/services/service.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FiturOnePage extends StatefulWidget {
  @override
  State<FiturOnePage> createState() => _FiturOnePageState();
}

class _FiturOnePageState extends State<FiturOnePage> {
  bool isSearch = false;
  bool isLoading = false;
  String urlSearch = '';
  bool flag1 = false;
  bool getLoading = true;
  Object? value1Item;
  bool flag2 = false;
  Object? value2Item;
  String filterTahun = '';
  String valueTahun = DateTime.now().toString().split('-')[0];
  String url = '';
  TextEditingController searchController = TextEditingController();
  List<PenanamanPohonModel> tahun = [];
  PenanamanPohonModel getTahun = PenanamanPohonModel();
  int getTotalPohon = 0;
  List filterTahunTabunganSampah = [];
  Map<String, dynamic> json = {};

  void initState() {
    getInit();
    super.initState();
  }

  void getInit() async {
    json = await Services().getTotalTabunganSampah();
    tahun = await Services().getPenamamanPohon();
    filterTahunTabunganSampah = await Services().getTahunTabunganSampah();
    getTahun = tahun.last;
    getTotalPohon = await Services().getJumlahPenamamanPohon();
    setState(() {});
    getLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceWebView: true,
          enableJavaScript: true,
        );
      } else {
        Navigator.pushNamed(context, '/error-page');
      }
    }

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
          provider.fiturAdiwiyata == 'Tabungan Sampah'
              ? Container()
              : IconButton(
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
              isLoading = true;
              print(searchController.text);
              urlSearch = 'search=${searchController.text}';
            });
            provider.fiturAdiwiyata == 'Sanitasi Drainase'
                ? await Services().getSanitasiDrainase()
                : provider.fiturAdiwiyata == 'Jejaring Kerja'
                    ? await Services().getJaringanKerja()
                    : provider.fiturAdiwiyata == 'Publikasi'
                        ? await Services().getPublikasi()
                        : provider.fiturAdiwiyata == 'Kegiatan Kader'
                            ? await Services().getPublikasi()
                            : provider.fiturAdiwiyata == 'Penanaman Pohon'
                                ? await Services().getPenamamanPohon()
                                : provider.fiturAdiwiyata == 'Pembibitan Pohon'
                                    ? await Services().getPembibitanPohon()
                                    : provider.fiturAdiwiyata ==
                                            'Pemeliharaan Pohon'
                                        ? await Services()
                                            .getPemeliharaanPohon()
                                        : provider.fiturAdiwiyata ==
                                                'Karya Inovatif PRLH'
                                            ? await Services().getInovatif()
                                            : provider.fiturAdiwiyata ==
                                                    'Penerapan PRLH'
                                                ? await Services()
                                                    .getPenerapanPRLH()
                                                : provider.fiturAdiwiyata ==
                                                        '3R'
                                                    ? await Services().get3R()
                                                    : provider.fiturAdiwiyata ==
                                                            'Pemeliharaan Sampah'
                                                        ? await Services()
                                                            .getPemeliharaanSampah()
                                                        : Container();
            setState(() {
              isLoading = false;
            });
          },
        ),
        elevation: 4,
        centerTitle: false,
      );
    }

    Widget dropdownList1({required String hint, required List data}) {
      return Container(
          height: 24,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: flag1 == true ? p1Color : mono3Color,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: GestureDetector(
              onLongPress: () async {
                setState(() {
                  isLoading = true;
                  flag1 = false;
                  value1Item = null;
                });
              },
              child: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: flag1 == true ? p1Color : mono2Color,
                ),
                hint: Text(
                  hint,
                  style: mono2TextStyle.copyWith(
                    color: flag1 == true ? p1Color : mono2Color,
                    fontWeight: regular,
                    fontSize: 10,
                  ),
                ),
                dropdownColor: mono6Color,
                elevation: 2,
                value: value1Item,
                items: data.map(
                  (value) {
                    return DropdownMenuItem(
                      value: value['TAHUN'],
                      child: Text(
                        value['TAHUN'].toString(),
                        style: mono2TextStyle.copyWith(
                          color: value1Item == value['TAHUN']
                              ? p1Color
                              : mono2Color,
                          fontWeight: regular,
                          fontSize: 10,
                        ),
                      ),
                    );
                  },
                ).toList(),
                onChanged: (value) async {
                  setState(() {
                    isLoading = true;
                    print(value);
                    value1Item = value;
                    filterTahun = 'TAHUN=$value';
                    flag1 = true;
                  });
                  await Services().getTabunganSampah();
                  setState(() {
                    isLoading = false;
                    valueTahun = value.toString();
                  });
                },
              ),
            ),
          ));
    }

    setState(() {
      url = '$filterTahun';
    });

    Widget filter() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Row(
              children: [
                // NOTE: ini adalah button reset yang hanya akan muncul jika salah satu dropdown dipilih
                value1Item != null || value2Item != null
                    ? GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                            value1Item = null;
                            value2Item = null;
                            url = '';
                            filterTahun = '';
                            valueTahun =
                                DateTime.now().toString().split('-')[0];
                            flag1 = false;
                            flag2 = false;
                          });

                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Container(
                          height: 24,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: m5Color,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.restart_alt,
                                color: mono6Color,
                                size: 15,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'reset',
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
                dropdownList1(
                  hint: 'Tahun',
                  data: filterTahunTabunganSampah,
                ),
              ],
            ),
          ),
        ),
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
                          getLoading
                              ? Container(
                                  width: 14,
                                  height: 14,
                                  child: CircularProgressIndicator(
                                    color: mono6Color,
                                    strokeWidth: 4,
                                  ),
                                )
                              : Text(
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
                          getLoading
                              ? Container(
                                  width: 14,
                                  height: 14,
                                  child: CircularProgressIndicator(
                                    color: mono6Color,
                                    strokeWidth: 4,
                                  ),
                                )
                              : Text(
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
                          getLoading
                              ? Container(
                                  width: 14,
                                  height: 14,
                                  child: CircularProgressIndicator(
                                    color: mono6Color,
                                    strokeWidth: 4,
                                  ),
                                )
                              : Text(
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
                                    onPressed: () {
                                      launchUrl(urlMOU);
                                    },
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
                          provider.fiturAdiwiyata == 'Tabungan Sampah'
                              ? Container()
                              : TextButton(
                                  onPressed: () {
                                    launchUrl(urlDokumentasi);
                                  },
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
                                      provider.fiturAdiwiyata ==
                                              'Tabungan Sampah'
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          provider.fiturAdiwiyata == 'Penanaman Pohon'
              ? infoCard(
                  infoMessage: getLoading
                      ? 'Memuat Data'
                      : 'Hingga ${getTahun.tANGGAL} Jumlah pohon yang ditanam $getTotalPohon',
                )
              : provider.fiturAdiwiyata == 'Tabungan Sampah'
                  ? infoCard(
                      infoMessage: 'Total Tabungan Sampah Tahun ' + valueTahun,
                      sampahKering: json['SAMPAH_KERING'].toString(),
                      sampahBasah: json['SAMPAH_BASAH'].toString(),
                      totalSampah: json['TOTAL_TABUNGAN'].toString(),
                    )
                  : Container(),
          provider.fiturAdiwiyata == 'Tabungan Sampah' ? filter() : Container(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: isLoading
                  ? Container()
                  : FutureBuilder(
                      future: provider.fiturAdiwiyata == 'Sanitasi Drainase'
                          ? Services().getSanitasiDrainase(
                              search: urlSearch, fitur: provider.fiturAdiwiyata)
                          : provider.fiturAdiwiyata == 'Jejaring Kerja'
                              ? Services().getJaringanKerja(
                                  search: urlSearch,
                                  fitur: provider.fiturAdiwiyata)
                              : provider.fiturAdiwiyata == 'Publikasi'
                                  ? Services().getPublikasi(
                                      search: urlSearch,
                                      fitur: provider.fiturAdiwiyata)
                                  : provider.fiturAdiwiyata == 'Kegiatan Kader'
                                      ? Services().getKegiatanKader(
                                          search: urlSearch,
                                          fitur: provider.fiturAdiwiyata)
                                      : provider.fiturAdiwiyata ==
                                              'Penanaman Pohon'
                                          ? Services().getPenamamanPohon(
                                              search: urlSearch,
                                              fitur: provider.fiturAdiwiyata)
                                          : provider.fiturAdiwiyata ==
                                                  'Pembibitan Pohon'
                                              ? Services().getPembibitanPohon(
                                                  search: urlSearch,
                                                  fitur:
                                                      provider.fiturAdiwiyata,
                                                )
                                              : provider.fiturAdiwiyata ==
                                                      'Pemeliharaan Pohon'
                                                  ? Services()
                                                      .getPemeliharaanPohon(
                                                          search: urlSearch,
                                                          fitur: provider
                                                              .fiturAdiwiyata)
                                                  : provider.fiturAdiwiyata ==
                                                          'Karya Inovatif PRLH'
                                                      ? Services().getInovatif(
                                                          fitur: provider
                                                              .fiturAdiwiyata,
                                                          search: urlSearch)
                                                      : provider.fiturAdiwiyata ==
                                                              'Penerapan PRLH'
                                                          ? Services().getPenerapanPRLH(
                                                              fitur: provider
                                                                  .fiturAdiwiyata,
                                                              search: urlSearch)
                                                          : provider.fiturAdiwiyata ==
                                                                  '3R'
                                                              ? Services().get3R(
                                                                  fitur: provider
                                                                      .fiturAdiwiyata,
                                                                  search:
                                                                      urlSearch)
                                                              : provider.fiturAdiwiyata ==
                                                                      'Pemeliharaan Sampah'
                                                                  ? Services().getPemeliharaanSampah(
                                                                      search:
                                                                          urlSearch,
                                                                      fitur: provider
                                                                          .fiturAdiwiyata)
                                                                  : provider.fiturAdiwiyata ==
                                                                          'Tabungan Sampah'
                                                                      ? Services().getTabunganSampah(
                                                                          filter: filterTahun,
                                                                          fitur: provider.fiturAdiwiyata)
                                                                      : '',
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List data = snapshot.data;

                          return data.isEmpty
                              ? Center(
                                  child: Text(
                                    'Data tidak ditemukan',
                                    style: mono1TextStyle,
                                  ),
                                )
                              : ListView(
                                  children: data.map((item) {
                                    return provider.fiturAdiwiyata ==
                                            'Sanitasi Drainase'
                                        ? expandableItem(
                                            inputSatu: '${item.tANGGAL}',
                                            inputDua: '${item.nAMAKEGIATAN}',
                                            inputTiga: '${item.uNSURTERLIBAT}',
                                            inputEmpat: '',
                                            inputLima: '${item.kETERANGAN}',
                                            urlDokumentasi: '${item.fILE}',
                                            urlMOU: '',
                                          )
                                        : provider.fiturAdiwiyata ==
                                                'Jejaring Kerja'
                                            ? expandableItem(
                                                inputSatu: '',
                                                inputDua:
                                                    '${item.nAMAKEGIATAN}',
                                                inputTiga: '${item.tANGGAL}',
                                                inputEmpat: '',
                                                inputLima: '${item.kETERANGAN}',
                                                urlDokumentasi:
                                                    '${item.fILEDOKUMENTASI}',
                                                urlMOU: '${item.fILEMOU}',
                                              )
                                            : provider.fiturAdiwiyata ==
                                                    'Publikasi'
                                                ? expandableItem(
                                                    inputSatu:
                                                        '${item.jENISMEDIA}',
                                                    inputDua:
                                                        '${item.nAMAKEGIATAN}',
                                                    inputTiga:
                                                        '${item.tANGGAL}',
                                                    inputEmpat: '',
                                                    inputLima:
                                                        '${item.kETERANGAN}',
                                                    urlDokumentasi:
                                                        '${item.fILE}',
                                                    urlMOU: '',
                                                  )
                                                : provider.fiturAdiwiyata ==
                                                        'Kegiatan Kader'
                                                    ? expandableItem(
                                                        inputSatu:
                                                            '${item.tANGGAL}',
                                                        inputDua:
                                                            '${item.nAMAKEGIATAN}',
                                                        inputTiga: '',
                                                        inputEmpat: '',
                                                        inputLima:
                                                            '${item.kETERANGAN}',
                                                        urlDokumentasi:
                                                            '${item.fILE}',
                                                        urlMOU: '',
                                                      )
                                                    : provider.fiturAdiwiyata ==
                                                            'Pembibitan Pohon'
                                                        ? expandableItem(
                                                            inputSatu:
                                                                '${item.tANGGAL}',
                                                            inputDua:
                                                                '${item.nAMAKEGIATAN}',
                                                            inputTiga: '',
                                                            inputEmpat: '',
                                                            inputLima:
                                                                '${item.kETERANGAN}',
                                                            urlDokumentasi:
                                                                '${item.fILE}',
                                                            urlMOU: '',
                                                          )
                                                        : provider.fiturAdiwiyata ==
                                                                'Penanaman Pohon'
                                                            ? expandableItem(
                                                                inputSatu:
                                                                    '${item.tANGGAL}',
                                                                inputDua:
                                                                    '${item.nAMAKEGIATAN}',
                                                                inputTiga:
                                                                    'Jumlah Pohon ${item.jUMLAH}',
                                                                inputEmpat: '',
                                                                inputLima:
                                                                    '${item.kETERANGAN}',
                                                                urlDokumentasi:
                                                                    '${item.fILE}',
                                                                urlMOU: '',
                                                              )
                                                            : provider.fiturAdiwiyata ==
                                                                    'Pemeliharaan Pohon'
                                                                ? expandableItem(
                                                                    inputSatu:
                                                                        '',
                                                                    inputDua:
                                                                        '${item.nAMAKEGIATAN}',
                                                                    inputTiga:
                                                                        '${item.tANGGAL}',
                                                                    inputEmpat:
                                                                        '',
                                                                    inputLima:
                                                                        '${item.kETERANGAN}',
                                                                    urlDokumentasi:
                                                                        '${item.fILE}',
                                                                    urlMOU: '',
                                                                  )
                                                                : provider.fiturAdiwiyata ==
                                                                        'Karya Inovatif PRLH'
                                                                    ? expandableItem(
                                                                        inputSatu:
                                                                            '${item.tANGGAL}',
                                                                        inputDua:
                                                                            '${item.nAMAKARYAINOVATIF}',
                                                                        inputTiga:
                                                                            '${item.nAMAINOVATOR}',
                                                                        inputEmpat:
                                                                            'Jenis ${item.jENIS}',
                                                                        inputLima:
                                                                            '${item.kETERANGAN}',
                                                                        urlDokumentasi:
                                                                            '${item.fILE}',
                                                                        urlMOU:
                                                                            '',
                                                                      )
                                                                    : provider.fiturAdiwiyata ==
                                                                            'Penerapan PRLH'
                                                                        ? expandableItem(
                                                                            inputSatu:
                                                                                '${item.tANGGAL}',
                                                                            inputDua:
                                                                                '${item.nAMAKEGIATAN}',
                                                                            inputTiga:
                                                                                'Peserta ${item.pESERTA}',
                                                                            inputEmpat:
                                                                                '',
                                                                            inputLima:
                                                                                '${item.kETERANGAN}',
                                                                            urlDokumentasi:
                                                                                '${item.fILE}',
                                                                            urlMOU:
                                                                                '',
                                                                          )
                                                                        : provider.fiturAdiwiyata ==
                                                                                '3R'
                                                                            ? expandableItem(
                                                                                inputSatu: '${item.tANGGAL}',
                                                                                inputDua: '${item.nAMAKEGIATAN}',
                                                                                inputTiga: '${item.jENISKEGIATAN}',
                                                                                inputEmpat: 'Peserta ${item.pIHAKTERLIBAT}',
                                                                                inputLima: '${item.kETERANGAN}',
                                                                                urlDokumentasi: '${item.fILE}',
                                                                                urlMOU: '',
                                                                              )
                                                                            : provider.fiturAdiwiyata == 'Pemeliharaan Sampah'
                                                                                ? expandableItem(
                                                                                    inputSatu: '${item.tANGGAL}',
                                                                                    inputDua: '${item.nAMAKEGIATAN}',
                                                                                    inputTiga: '',
                                                                                    inputEmpat: '',
                                                                                    inputLima: '${item.kETERANGAN}',
                                                                                    urlDokumentasi: '${item.fILE}',
                                                                                    urlMOU: '',
                                                                                  )
                                                                                : provider.fiturAdiwiyata == 'Tabungan Sampah'
                                                                                    ? expandableItem(
                                                                                        inputSatu: '',
                                                                                        inputDua: '${item.bulan}',
                                                                                        inputTiga: '${item.sampahKering} kg',
                                                                                        inputEmpat: '${item.sampahBasah} kg',
                                                                                        inputLima: '${item.totalTabungan} kg',
                                                                                        urlDokumentasi: '',
                                                                                        urlMOU: '',
                                                                                      )
                                                                                    : Container();
                                  }).toList(),
                                );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 4,
                              color: m1Color,
                            ),
                          );
                        }
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
