class ReduceReuseRecycleModel {
  int? iD;
  String? tANGGAL;
  String? nAMAKEGIATAN;
  String? jENISKEGIATAN;
  String? pIHAKTERLIBAT;
  String? kETERANGAN;
  String? fILE;

  ReduceReuseRecycleModel(
      {this.iD,
      this.tANGGAL,
      this.nAMAKEGIATAN,
      this.jENISKEGIATAN,
      this.pIHAKTERLIBAT,
      this.kETERANGAN,
      this.fILE});

  ReduceReuseRecycleModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tANGGAL = json['TANGGAL'];
    nAMAKEGIATAN = json['NAMA_KEGIATAN'];
    jENISKEGIATAN = json['JENIS_KEGIATAN'];
    pIHAKTERLIBAT = json['PIHAK_TERLIBAT'];
    kETERANGAN = json['KETERANGAN'];
    fILE = json['FILE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['TANGGAL'] = this.tANGGAL;
    data['NAMA_KEGIATAN'] = this.nAMAKEGIATAN;
    data['JENIS_KEGIATAN'] = this.jENISKEGIATAN;
    data['PIHAK_TERLIBAT'] = this.pIHAKTERLIBAT;
    data['KETERANGAN'] = this.kETERANGAN;
    data['FILE'] = this.fILE;
    return data;
  }
}
