class BukuTamuModel {
  int? iD;
  String? nAMA;
  String? iNSTANSIASAL;
  String? aLAMAT;
  String? nOHP;
  String? hARI;
  String? tANGGAL;
  String? jAM;
  String? kEPERLUAN;

  BukuTamuModel(
      {this.iD,
      this.nAMA,
      this.iNSTANSIASAL,
      this.aLAMAT,
      this.nOHP,
      this.hARI,
      this.tANGGAL,
      this.jAM,
      this.kEPERLUAN});

  BukuTamuModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMA = json['NAMA'];
    iNSTANSIASAL = json['INSTANSI_ASAL'];
    aLAMAT = json['ALAMAT'];
    nOHP = json['NO_HP'];
    hARI = json['HARI'];
    tANGGAL = json['TANGGAL'];
    jAM = json['JAM'];
    kEPERLUAN = json['KEPERLUAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA'] = this.nAMA;
    data['INSTANSI_ASAL'] = this.iNSTANSIASAL;
    data['ALAMAT'] = this.aLAMAT;
    data['NO_HP'] = this.nOHP;
    data['HARI'] = this.hARI;
    data['TANGGAL'] = this.tANGGAL;
    data['JAM'] = this.jAM;
    data['KEPERLUAN'] = this.kEPERLUAN;
    return data;
  }
}
