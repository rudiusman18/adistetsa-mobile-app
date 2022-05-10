class JadwalEkskulModel {
  int? iD;
  String? pELATIH;
  String? tAHUNAJARAN;
  String? sEMESTER;
  String? eKSKUL;
  String? iDEKSKUL;
  String? hARI;
  String? wAKTUMULAI;
  String? wAKTUBERAKHIR;

  JadwalEkskulModel(
      {this.iD,
      this.pELATIH,
      this.tAHUNAJARAN,
      this.sEMESTER,
      this.eKSKUL,
      this.iDEKSKUL,
      this.hARI,
      this.wAKTUMULAI,
      this.wAKTUBERAKHIR});

  JadwalEkskulModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    pELATIH = json['PELATIH'];
    tAHUNAJARAN = json['TAHUN_AJARAN'];
    sEMESTER = json['SEMESTER'];
    eKSKUL = json['EKSKUL'];
    iDEKSKUL = json['ID_EKSKUL'];
    hARI = json['HARI'];
    wAKTUMULAI = json['WAKTU_MULAI'];
    wAKTUBERAKHIR = json['WAKTU_BERAKHIR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['PELATIH'] = this.pELATIH;
    data['TAHUN_AJARAN'] = this.tAHUNAJARAN;
    data['SEMESTER'] = this.sEMESTER;
    data['EKSKUL'] = this.eKSKUL;
    data['ID_EKSKUL'] = this.iDEKSKUL;
    data['HARI'] = this.hARI;
    data['WAKTU_MULAI'] = this.wAKTUMULAI;
    data['WAKTU_BERAKHIR'] = this.wAKTUBERAKHIR;
    return data;
  }
}
