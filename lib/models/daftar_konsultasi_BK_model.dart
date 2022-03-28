class DaftarKonsultasiBKModel {
  int? iD;
  String? nAMA;
  String? tANGGALKONSULTASI;
  String? sTATUS;
  int? uSER;

  DaftarKonsultasiBKModel(
      {this.iD, this.nAMA, this.tANGGALKONSULTASI, this.sTATUS, this.uSER});

  DaftarKonsultasiBKModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMA = json['NAMA'];
    tANGGALKONSULTASI = json['TANGGAL_KONSULTASI'];
    sTATUS = json['STATUS'];
    uSER = json['USER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA'] = this.nAMA;
    data['TANGGAL_KONSULTASI'] = this.tANGGALKONSULTASI;
    data['STATUS'] = this.sTATUS;
    data['USER'] = this.uSER;
    return data;
  }
}
