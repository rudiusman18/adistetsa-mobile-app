class PengajuanEkskulModel {
  int? iD;
  String? nIS;
  String? nAMA;
  String? kELAS;
  String? eKSKUL;
  String? tAHUNAJARAN;
  String? tANGGALPENGAJUAN;
  String? sTATUSPENGAJUAN;
  int? kELASSISWA;

  PengajuanEkskulModel(
      {this.iD,
      this.nIS,
      this.nAMA,
      this.kELAS,
      this.eKSKUL,
      this.tAHUNAJARAN,
      this.tANGGALPENGAJUAN,
      this.sTATUSPENGAJUAN,
      this.kELASSISWA});

  PengajuanEkskulModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nIS = json['NIS'];
    nAMA = json['NAMA'];
    kELAS = json['KELAS'];
    eKSKUL = json['EKSKUL'];
    tAHUNAJARAN = json['TAHUN_AJARAN'];
    tANGGALPENGAJUAN = json['TANGGAL_PENGAJUAN'];
    sTATUSPENGAJUAN = json['STATUS_PENGAJUAN'];
    kELASSISWA = json['KELAS_SISWA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NIS'] = this.nIS;
    data['NAMA'] = this.nAMA;
    data['KELAS'] = this.kELAS;
    data['EKSKUL'] = this.eKSKUL;
    data['TAHUN_AJARAN'] = this.tAHUNAJARAN;
    data['TANGGAL_PENGAJUAN'] = this.tANGGALPENGAJUAN;
    data['STATUS_PENGAJUAN'] = this.sTATUSPENGAJUAN;
    data['KELAS_SISWA'] = this.kELASSISWA;
    return data;
  }
}
