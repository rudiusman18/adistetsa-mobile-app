class StatusPengajuanKonselingModel {
  int? iD;
  String? nAMAKONSELOR;
  String? tANGGALKONSULTASI;
  String? sTATUS;
  int? uSER;
  int? kONSELOR;

  StatusPengajuanKonselingModel(
      {this.iD,
      this.nAMAKONSELOR,
      this.tANGGALKONSULTASI,
      this.sTATUS,
      this.uSER,
      this.kONSELOR});

  StatusPengajuanKonselingModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMAKONSELOR = json['NAMA_KONSELOR'];
    tANGGALKONSULTASI = json['TANGGAL_KONSULTASI'];
    sTATUS = json['STATUS'];
    uSER = json['USER'];
    kONSELOR = json['KONSELOR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA_KONSELOR'] = this.nAMAKONSELOR;
    data['TANGGAL_KONSULTASI'] = this.tANGGALKONSULTASI;
    data['STATUS'] = this.sTATUS;
    data['USER'] = this.uSER;
    data['KONSELOR'] = this.kONSELOR;
    return data;
  }
}
