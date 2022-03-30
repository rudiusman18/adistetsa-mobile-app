class KonservasiAirModel {
  int? iD;
  String? tANGGAL;
  String? kATEGORI;
  String? nAMAKEGIATAN;
  String? kETERANGAN;
  String? fILE;

  KonservasiAirModel(
      {this.iD,
      this.tANGGAL,
      this.kATEGORI,
      this.nAMAKEGIATAN,
      this.kETERANGAN,
      this.fILE});

  KonservasiAirModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tANGGAL = json['TANGGAL'];
    kATEGORI = json['KATEGORI'];
    nAMAKEGIATAN = json['NAMA_KEGIATAN'];
    kETERANGAN = json['KETERANGAN'];
    fILE = json['FILE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['TANGGAL'] = this.tANGGAL;
    data['KATEGORI'] = this.kATEGORI;
    data['NAMA_KEGIATAN'] = this.nAMAKEGIATAN;
    data['KETERANGAN'] = this.kETERANGAN;
    data['FILE'] = this.fILE;
    return data;
  }
}
