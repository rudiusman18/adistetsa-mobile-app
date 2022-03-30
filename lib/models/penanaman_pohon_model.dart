class PenanamanPohonModel {
  int? iD;
  String? tANGGAL;
  String? nAMAKEGIATAN;
  String? jUMLAH;
  String? kETERANGAN;
  String? fILE;

  PenanamanPohonModel(
      {this.iD,
      this.tANGGAL,
      this.nAMAKEGIATAN,
      this.jUMLAH,
      this.kETERANGAN,
      this.fILE});

  PenanamanPohonModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tANGGAL = json['TANGGAL'];
    nAMAKEGIATAN = json['NAMA_KEGIATAN'];
    jUMLAH = json['JUMLAH'];
    kETERANGAN = json['KETERANGAN'];
    fILE = json['FILE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['TANGGAL'] = this.tANGGAL;
    data['NAMA_KEGIATAN'] = this.nAMAKEGIATAN;
    data['JUMLAH'] = this.jUMLAH;
    data['KETERANGAN'] = this.kETERANGAN;
    data['FILE'] = this.fILE;
    return data;
  }
}
