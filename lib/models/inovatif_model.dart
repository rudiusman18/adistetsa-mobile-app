class InovatifModel {
  int? iD;
  String? tANGGAL;
  String? nAMAINOVATOR;
  String? nAMAKARYAINOVATIF;
  String? jENIS;
  String? fILE;
  String? kETERANGAN;

  InovatifModel(
      {this.iD,
      this.tANGGAL,
      this.nAMAINOVATOR,
      this.nAMAKARYAINOVATIF,
      this.jENIS,
      this.fILE,
      this.kETERANGAN});

  InovatifModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tANGGAL = json['TANGGAL'];
    nAMAINOVATOR = json['NAMA_INOVATOR'];
    nAMAKARYAINOVATIF = json['NAMA_KARYA_INOVATIF'];
    jENIS = json['JENIS'];
    fILE = json['FILE'];
    kETERANGAN = json['KETERANGAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['TANGGAL'] = this.tANGGAL;
    data['NAMA_INOVATOR'] = this.nAMAINOVATOR;
    data['NAMA_KARYA_INOVATIF'] = this.nAMAKARYAINOVATIF;
    data['JENIS'] = this.jENIS;
    data['FILE'] = this.fILE;
    data['KETERANGAN'] = this.kETERANGAN;
    return data;
  }
}
