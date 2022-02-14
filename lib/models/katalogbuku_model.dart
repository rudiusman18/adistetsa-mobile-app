class KatalogBukuModel {
  String? rEGISTER;
  String? jUDUL;
  String? pENULIS;
  String? bAHASA;
  int? tAHUNTERBIT;
  String? mEDIA;
  String? tERSEDIA;
  String? jENISBUKU;

  KatalogBukuModel(
      {this.rEGISTER,
      this.jUDUL,
      this.pENULIS,
      this.bAHASA,
      this.tAHUNTERBIT,
      this.mEDIA,
      this.tERSEDIA,
      this.jENISBUKU});

  KatalogBukuModel.fromJson(Map<String, dynamic> json) {
    rEGISTER = json['REGISTER'];
    jUDUL = json['JUDUL'];
    pENULIS = json['PENULIS'];
    bAHASA = json['BAHASA'];
    tAHUNTERBIT = json['TAHUN_TERBIT'];
    mEDIA = json['MEDIA'];
    tERSEDIA = json['TERSEDIA'];
    jENISBUKU = json['JENIS_BUKU'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['REGISTER'] = this.rEGISTER;
    data['JUDUL'] = this.jUDUL;
    data['PENULIS'] = this.pENULIS;
    data['BAHASA'] = this.bAHASA;
    data['TAHUN_TERBIT'] = this.tAHUNTERBIT;
    data['MEDIA'] = this.mEDIA;
    data['TERSEDIA'] = this.tERSEDIA;
    data['JENIS_BUKU'] = this.jENISBUKU;
    return data;
  }
}
