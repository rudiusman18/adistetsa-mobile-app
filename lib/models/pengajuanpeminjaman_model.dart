class PengajuanPeminjamanModel {
  int? iD;
  String? nAMA;
  List<String>? bUKU;
  String? tANGGALPENGAJUAN;
  String? sTATUSPENGAJUAN;
  String? jANGKAPEMINJAMAN;
  String? fILETTDPENGAJUAN;
  int? dATAGURU;

  PengajuanPeminjamanModel(
      {this.iD,
      this.nAMA,
      this.bUKU,
      this.tANGGALPENGAJUAN,
      this.sTATUSPENGAJUAN,
      this.jANGKAPEMINJAMAN,
      this.fILETTDPENGAJUAN,
      this.dATAGURU});

  PengajuanPeminjamanModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMA = json['NAMA'];
    bUKU = json['BUKU'].cast<String>();
    tANGGALPENGAJUAN = json['TANGGAL_PENGAJUAN'];
    sTATUSPENGAJUAN = json['STATUS_PENGAJUAN'];
    jANGKAPEMINJAMAN = json['JANGKA_PEMINJAMAN'];
    fILETTDPENGAJUAN = json['FILE_TTD_PENGAJUAN'];
    dATAGURU = json['DATA_GURU'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA'] = this.nAMA;
    data['BUKU'] = this.bUKU;
    data['TANGGAL_PENGAJUAN'] = this.tANGGALPENGAJUAN;
    data['STATUS_PENGAJUAN'] = this.sTATUSPENGAJUAN;
    data['JANGKA_PEMINJAMAN'] = this.jANGKAPEMINJAMAN;
    data['FILE_TTD_PENGAJUAN'] = this.fILETTDPENGAJUAN;
    data['DATA_GURU'] = this.dATAGURU;
    return data;
  }
}
