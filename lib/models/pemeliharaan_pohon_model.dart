class PemeliharaanPohonModel {
  int? iD;
  String? tANGGAL;
  String? nAMAKEGIATAN;
  String? kETERANGAN;
  String? fILE;

  PemeliharaanPohonModel(
      {this.iD, this.tANGGAL, this.nAMAKEGIATAN, this.kETERANGAN, this.fILE});

  PemeliharaanPohonModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tANGGAL = json['TANGGAL'];
    nAMAKEGIATAN = json['NAMA_KEGIATAN'];
    kETERANGAN = json['KETERANGAN'];
    fILE = json['FILE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['TANGGAL'] = this.tANGGAL;
    data['NAMA_KEGIATAN'] = this.nAMAKEGIATAN;
    data['KETERANGAN'] = this.kETERANGAN;
    data['FILE'] = this.fILE;
    return data;
  }
}
