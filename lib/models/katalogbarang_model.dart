class KatalogBarangModel {
  int? iD;
  String? jENIS;
  String? nAMA;
  String? sTATUS;

  KatalogBarangModel({this.iD, this.jENIS, this.nAMA, this.sTATUS});

  KatalogBarangModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    jENIS = json['JENIS'];
    nAMA = json['NAMA'];
    sTATUS = json['STATUS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['JENIS'] = this.jENIS;
    data['NAMA'] = this.nAMA;
    data['STATUS'] = this.sTATUS;
    return data;
  }
}
