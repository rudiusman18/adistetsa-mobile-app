class PenerapanPRLHModel {
  int? iD;
  String? tANGGAL;
  String? nAMAKEGIATAN;
  String? pESERTA;
  String? kETERANGAN;
  String? fILE;

  PenerapanPRLHModel(
      {this.iD,
      this.tANGGAL,
      this.nAMAKEGIATAN,
      this.pESERTA,
      this.kETERANGAN,
      this.fILE});

  PenerapanPRLHModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tANGGAL = json['TANGGAL'];
    nAMAKEGIATAN = json['NAMA_KEGIATAN'];
    pESERTA = json['PESERTA'];
    kETERANGAN = json['KETERANGAN'];
    fILE = json['FILE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['TANGGAL'] = this.tANGGAL;
    data['NAMA_KEGIATAN'] = this.nAMAKEGIATAN;
    data['PESERTA'] = this.pESERTA;
    data['KETERANGAN'] = this.kETERANGAN;
    data['FILE'] = this.fILE;
    return data;
  }
}
