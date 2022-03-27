class KonselorModel {
  int? iD;
  String? nAMA;
  String? fOTO;
  String? sTATUS;
  int? uSER;

  KonselorModel({this.iD, this.nAMA, this.fOTO, this.sTATUS, this.uSER});

  KonselorModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMA = json['NAMA'];
    fOTO = json['FOTO'];
    sTATUS = json['STATUS'];
    uSER = json['USER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA'] = this.nAMA;
    data['FOTO'] = this.fOTO;
    data['STATUS'] = this.sTATUS;
    data['USER'] = this.uSER;
    return data;
  }
}
