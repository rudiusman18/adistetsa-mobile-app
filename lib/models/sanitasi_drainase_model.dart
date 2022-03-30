class sanitasiDrainaseModel {
  int? iD;
  String? tANGGAL;
  String? nAMAKEGIATAN;
  String? uNSURTERLIBAT;
  String? kETERANGAN;
  String? fILE;

  sanitasiDrainaseModel({
    this.iD,
    this.tANGGAL,
    this.nAMAKEGIATAN,
    this.uNSURTERLIBAT,
    this.kETERANGAN,
    this.fILE,
  });

  sanitasiDrainaseModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tANGGAL = json['TANGGAL'];
    nAMAKEGIATAN = json['NAMA_KEGIATAN'];
    uNSURTERLIBAT = json['UNSUR_TERLIBAT'];
    kETERANGAN = json['KETERANGAN'];
    fILE = json['FILE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['TANGGAL'] = this.tANGGAL;
    data['NAMA_KEGIATAN'] = this.nAMAKEGIATAN;
    data['UNSUR_TERLIBAT'] = this.uNSURTERLIBAT;
    data['KETERANGAN'] = this.kETERANGAN;
    data['FILE'] = this.fILE;
    return data;
  }
}
