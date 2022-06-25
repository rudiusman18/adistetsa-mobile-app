class DataSiswaUksModel {
  int? iD;
  String? nAMA;
  String? kELAS;
  int? nIS;

  DataSiswaUksModel({this.iD, this.nAMA, this.kELAS, this.nIS});

  DataSiswaUksModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMA = json['NAMA'];
    kELAS = json['KELAS'];
    nIS = json['NIS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA'] = this.nAMA;
    data['KELAS'] = this.kELAS;
    data['NIS'] = this.nIS;
    return data;
  }
}
