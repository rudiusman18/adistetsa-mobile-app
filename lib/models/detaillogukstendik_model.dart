class DetailLogUKSTendikModel {
  int? iD;
  String? jENISPTK;
  String? nAMA;
  String? tANGGAL;
  String? jENISPEMERIKSAAN;
  String? oBATDIBERIKAN;
  String? tINDAKLANJUT;

  DetailLogUKSTendikModel(
      {this.iD,
      this.jENISPTK,
      this.nAMA,
      this.tANGGAL,
      this.jENISPEMERIKSAAN,
      this.oBATDIBERIKAN,
      this.tINDAKLANJUT});

  DetailLogUKSTendikModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    jENISPTK = json['JENIS_PTK'];
    nAMA = json['NAMA'];
    tANGGAL = json['TANGGAL'];
    jENISPEMERIKSAAN = json['JENIS_PEMERIKSAAN'];
    oBATDIBERIKAN = json['OBAT_DIBERIKAN'];
    tINDAKLANJUT = json['TINDAK_LANJUT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['JENIS_PTK'] = this.jENISPTK;
    data['NAMA'] = this.nAMA;
    data['TANGGAL'] = this.tANGGAL;
    data['JENIS_PEMERIKSAAN'] = this.jENISPEMERIKSAAN;
    data['OBAT_DIBERIKAN'] = this.oBATDIBERIKAN;
    data['TINDAK_LANJUT'] = this.tINDAKLANJUT;
    return data;
  }
}
