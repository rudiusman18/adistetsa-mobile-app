class ListBukuModel {
  int? id;
  String? rEGISTER;
  String? jUDUL;
  String? pENULIS;
  String? bAHASA;
  int? tAHUNTERBIT;
  String? mEDIA;

  ListBukuModel(
      {this.id,
      this.rEGISTER,
      this.jUDUL,
      this.pENULIS,
      this.bAHASA,
      this.tAHUNTERBIT,
      this.mEDIA});

  ListBukuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rEGISTER = json['REGISTER'];
    jUDUL = json['JUDUL'];
    pENULIS = json['PENULIS'];
    bAHASA = json['BAHASA'];
    tAHUNTERBIT = json['TAHUN_TERBIT'];
    mEDIA = json['MEDIA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['REGISTER'] = this.rEGISTER;
    data['JUDUL'] = this.jUDUL;
    data['PENULIS'] = this.pENULIS;
    data['BAHASA'] = this.bAHASA;
    data['TAHUN_TERBIT'] = this.tAHUNTERBIT;
    data['MEDIA'] = this.mEDIA;
    return data;
  }
}
