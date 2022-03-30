class JaringanKerjaModel {
  int? iD;
  String? tANGGAL;
  String? nAMAKEGIATAN;
  String? kETERANGAN;
  String? fILEMOU;
  String? fILEDOKUMENTASI;

  JaringanKerjaModel(
      {this.iD,
      this.tANGGAL,
      this.nAMAKEGIATAN,
      this.kETERANGAN,
      this.fILEMOU,
      this.fILEDOKUMENTASI});

  JaringanKerjaModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tANGGAL = json['TANGGAL'];
    nAMAKEGIATAN = json['NAMA_KEGIATAN'];
    kETERANGAN = json['KETERANGAN'];
    fILEMOU = json['FILE_MOU'];
    fILEDOKUMENTASI = json['FILE_DOKUMENTASI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['TANGGAL'] = this.tANGGAL;
    data['NAMA_KEGIATAN'] = this.nAMAKEGIATAN;
    data['KETERANGAN'] = this.kETERANGAN;
    data['FILE_MOU'] = this.fILEMOU;
    data['FILE_DOKUMENTASI'] = this.fILEDOKUMENTASI;
    return data;
  }
}
