class detailDaftarKonsultasiBKModel {
  int? iD;
  String? nAMA;
  String? nIS;
  String? nISN;
  String? kELAS;
  String? kONSELOR;
  String? tANGGALKONSULTASI;
  String? jAMAWAL;
  String? jAMAKHIR;
  String? jENISMASALAH;
  Null? rATING;
  String? sTATUS;
  String? kRITIKSARAN;
  int? uSER;

  detailDaftarKonsultasiBKModel(
      {this.iD,
      this.nAMA,
      this.nIS,
      this.nISN,
      this.kELAS,
      this.kONSELOR,
      this.tANGGALKONSULTASI,
      this.jAMAWAL,
      this.jAMAKHIR,
      this.jENISMASALAH,
      this.rATING,
      this.sTATUS,
      this.kRITIKSARAN,
      this.uSER});

  detailDaftarKonsultasiBKModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMA = json['NAMA'];
    nIS = json['NIS'];
    nISN = json['NISN'];
    kELAS = json['KELAS'];
    kONSELOR = json['KONSELOR'];
    tANGGALKONSULTASI = json['TANGGAL_KONSULTASI'];
    jAMAWAL = json['JAM_AWAL'];
    jAMAKHIR = json['JAM_AKHIR'];
    jENISMASALAH = json['JENIS_MASALAH'];
    rATING = json['RATING'];
    sTATUS = json['STATUS'];
    kRITIKSARAN = json['KRITIK_SARAN'];
    uSER = json['USER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA'] = this.nAMA;
    data['NIS'] = this.nIS;
    data['NISN'] = this.nISN;
    data['KELAS'] = this.kELAS;
    data['KONSELOR'] = this.kONSELOR;
    data['TANGGAL_KONSULTASI'] = this.tANGGALKONSULTASI;
    data['JAM_AWAL'] = this.jAMAWAL;
    data['JAM_AKHIR'] = this.jAMAKHIR;
    data['JENIS_MASALAH'] = this.jENISMASALAH;
    data['RATING'] = this.rATING;
    data['STATUS'] = this.sTATUS;
    data['KRITIK_SARAN'] = this.kRITIKSARAN;
    data['USER'] = this.uSER;
    return data;
  }
}
