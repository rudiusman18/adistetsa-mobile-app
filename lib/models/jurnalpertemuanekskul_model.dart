class JurnalEkskulPertemuanModel {
  int? iD;
  String? pELATIH;
  String? eKSKUL;
  String? hARI;
  String? tAHUNAJARAN;
  String? sEMESTER;
  String? pERTEMUAN;
  String? tANGGALMELATIH;
  String? dESKRIPSIKEGIATAN;
  String? fILEDOKUMENTASI;

  JurnalEkskulPertemuanModel(
      {this.iD,
      this.pELATIH,
      this.eKSKUL,
      this.hARI,
      this.tAHUNAJARAN,
      this.sEMESTER,
      this.pERTEMUAN,
      this.tANGGALMELATIH,
      this.dESKRIPSIKEGIATAN,
      this.fILEDOKUMENTASI});

  JurnalEkskulPertemuanModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    pELATIH = json['PELATIH'];
    eKSKUL = json['EKSKUL'];
    hARI = json['HARI'];
    tAHUNAJARAN = json['TAHUN_AJARAN'];
    sEMESTER = json['SEMESTER'];
    pERTEMUAN = json['PERTEMUAN'];
    tANGGALMELATIH = json['TANGGAL_MELATIH'];
    dESKRIPSIKEGIATAN = json['DESKRIPSI_KEGIATAN'];
    fILEDOKUMENTASI = json['FILE_DOKUMENTASI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['PELATIH'] = this.pELATIH;
    data['EKSKUL'] = this.eKSKUL;
    data['HARI'] = this.hARI;
    data['TAHUN_AJARAN'] = this.tAHUNAJARAN;
    data['SEMESTER'] = this.sEMESTER;
    data['PERTEMUAN'] = this.pERTEMUAN;
    data['TANGGAL_MELATIH'] = this.tANGGALMELATIH;
    data['DESKRIPSI_KEGIATAN'] = this.dESKRIPSIKEGIATAN;
    data['FILE_DOKUMENTASI'] = this.fILEDOKUMENTASI;
    return data;
  }
}
