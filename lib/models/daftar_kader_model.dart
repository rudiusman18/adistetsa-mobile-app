class DaftarKaderModel {
  int? iD;
  String? nAMA;
  String? nOMORHP;
  String? aLAMAT;
  int? nIS;

  DaftarKaderModel({this.iD, this.nAMA, this.nOMORHP, this.aLAMAT, this.nIS});

  DaftarKaderModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMA = json['NAMA'];
    nOMORHP = json['NOMOR_HP'];
    aLAMAT = json['ALAMAT'];
    nIS = json['NIS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA'] = this.nAMA;
    data['NOMOR_HP'] = this.nOMORHP;
    data['ALAMAT'] = this.aLAMAT;
    data['NIS'] = this.nIS;
    return data;
  }
}
