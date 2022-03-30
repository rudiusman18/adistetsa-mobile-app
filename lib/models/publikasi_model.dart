class PublikasiModel {
  int? iD;
  String? tANGGAL;
  String? nAMAKEGIATAN;
  String? jENISMEDIA;
  String? kETERANGAN;
  String? fILE;

  PublikasiModel(
      {this.iD,
      this.tANGGAL,
      this.nAMAKEGIATAN,
      this.jENISMEDIA,
      this.kETERANGAN,
      this.fILE});

  PublikasiModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tANGGAL = json['TANGGAL'];
    nAMAKEGIATAN = json['NAMA_KEGIATAN'];
    jENISMEDIA = json['JENIS_MEDIA'];
    kETERANGAN = json['KETERANGAN'];
    fILE = json['FILE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['TANGGAL'] = this.tANGGAL;
    data['NAMA_KEGIATAN'] = this.nAMAKEGIATAN;
    data['JENIS_MEDIA'] = this.jENISMEDIA;
    data['KETERANGAN'] = this.kETERANGAN;
    data['FILE'] = this.fILE;
    return data;
  }
}
