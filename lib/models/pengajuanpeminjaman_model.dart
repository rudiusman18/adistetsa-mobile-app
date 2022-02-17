class PengajuanPeminjamanModel {
  int? iD;
  List<String>? bUKU;
  String? tANGGALPENGAJUAN;
  String? sTATUSPENGAJUAN;
  String? jANGKAPEMINJAMAN;
  String? fILETTDPENGAJUAN;

  PengajuanPeminjamanModel(
      {this.iD,
      this.bUKU,
      this.tANGGALPENGAJUAN,
      this.sTATUSPENGAJUAN,
      this.jANGKAPEMINJAMAN,
      this.fILETTDPENGAJUAN});

  PengajuanPeminjamanModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    bUKU = json['BUKU'].cast<String>();
    tANGGALPENGAJUAN = json['TANGGAL_PENGAJUAN'];
    sTATUSPENGAJUAN = json['STATUS_PENGAJUAN'];
    jANGKAPEMINJAMAN = json['JANGKA_PEMINJAMAN'];
    fILETTDPENGAJUAN = json['FILE_TTD_PENGAJUAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['BUKU'] = this.bUKU;
    data['TANGGAL_PENGAJUAN'] = this.tANGGALPENGAJUAN;
    data['STATUS_PENGAJUAN'] = this.sTATUSPENGAJUAN;
    data['JANGKA_PEMINJAMAN'] = this.jANGKAPEMINJAMAN;
    data['FILE_TTD_PENGAJUAN'] = this.fILETTDPENGAJUAN;
    return data;
  }
}
