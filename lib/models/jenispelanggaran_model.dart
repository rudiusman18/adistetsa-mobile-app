class JenisPelanggaranModel {
  int? iD;
  String? kETERANGAN;
  int? pOIN;

  JenisPelanggaranModel({this.iD, this.kETERANGAN, this.pOIN});

  JenisPelanggaranModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    kETERANGAN = json['KETERANGAN'];
    pOIN = json['POIN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['KETERANGAN'] = this.kETERANGAN;
    data['POIN'] = this.pOIN;
    return data;
  }
}
