class DetailJurnalMengajarGuruModel {
  int? iD;
  String? pERTEMUAN;
  String? tANGGALMENGAJAR;
  String? dESKRIPSIMATERI;
  String? fILEDOKUMENTASI;

  DetailJurnalMengajarGuruModel(
      {this.iD,
      this.pERTEMUAN,
      this.tANGGALMENGAJAR,
      this.dESKRIPSIMATERI,
      this.fILEDOKUMENTASI});

  DetailJurnalMengajarGuruModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    pERTEMUAN = json['PERTEMUAN'];
    tANGGALMENGAJAR = json['TANGGAL_MENGAJAR'];
    dESKRIPSIMATERI = json['DESKRIPSI_MATERI'];
    fILEDOKUMENTASI = json['FILE_DOKUMENTASI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['PERTEMUAN'] = this.pERTEMUAN;
    data['TANGGAL_MENGAJAR'] = this.tANGGALMENGAJAR;
    data['DESKRIPSI_MATERI'] = this.dESKRIPSIMATERI;
    data['FILE_DOKUMENTASI'] = this.fILEDOKUMENTASI;
    return data;
  }
}
