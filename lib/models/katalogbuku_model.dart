class KatalogBukuModel {
  String? jUDUL;
  String? pENULIS;
  String? bAHASA;
  int? tAHUNTERBIT;
  String? mEDIA;
  String? tERSEDIA;

  KatalogBukuModel(
      {this.jUDUL,
      this.pENULIS,
      this.bAHASA,
      this.tAHUNTERBIT,
      this.mEDIA,
      this.tERSEDIA});

  KatalogBukuModel.fromJson(Map<String, dynamic> json) {
    jUDUL = json['JUDUL'];
    pENULIS = json['PENULIS'];
    bAHASA = json['BAHASA'];
    tAHUNTERBIT = json['TAHUN_TERBIT'];
    mEDIA = json['MEDIA'];
    tERSEDIA = json['TERSEDIA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JUDUL'] = this.jUDUL;
    data['PENULIS'] = this.pENULIS;
    data['BAHASA'] = this.bAHASA;
    data['TAHUN_TERBIT'] = this.tAHUNTERBIT;
    data['MEDIA'] = this.mEDIA;
    data['TERSEDIA'] = this.tERSEDIA;
    return data;
  }
}
