class PelanggaranModel {
  int? iD;
  String? dATASISWA;
  String? jENISPELANGGARAN;
  String? bUKTIPELANGGARAN;
  String? tANGGALPENGAJUAN;
  String? sTATUSPENGAJUAN;

  PelanggaranModel(
      {this.iD,
      this.dATASISWA,
      this.jENISPELANGGARAN,
      this.bUKTIPELANGGARAN,
      this.tANGGALPENGAJUAN,
      this.sTATUSPENGAJUAN});

  PelanggaranModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    dATASISWA = json['DATA_SISWA'];
    jENISPELANGGARAN = json['JENIS_PELANGGARAN'];
    bUKTIPELANGGARAN = json['BUKTI_PELANGGARAN'];
    tANGGALPENGAJUAN = json['TANGGAL_PENGAJUAN'];
    sTATUSPENGAJUAN = json['STATUS_PENGAJUAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['DATA_SISWA'] = this.dATASISWA;
    data['JENIS_PELANGGARAN'] = this.jENISPELANGGARAN;
    data['BUKTI_PELANGGARAN'] = this.bUKTIPELANGGARAN;
    data['TANGGAL_PENGAJUAN'] = this.tANGGALPENGAJUAN;
    data['STATUS_PENGAJUAN'] = this.sTATUSPENGAJUAN;
    return data;
  }
}
