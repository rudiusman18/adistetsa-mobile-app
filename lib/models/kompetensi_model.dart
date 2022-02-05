class KompetensiModel {
  int? iD;
  String? bIDANGSTUDI;
  String? uRUTAN;

  KompetensiModel({this.iD, this.bIDANGSTUDI, this.uRUTAN});

  KompetensiModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    bIDANGSTUDI = json['BIDANG_STUDI'];
    uRUTAN = json['URUTAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['BIDANG_STUDI'] = this.bIDANGSTUDI;
    data['URUTAN'] = this.uRUTAN;
    return data;
  }
}
