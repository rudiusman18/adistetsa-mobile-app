class RiwayatPeminjamanModel {
  int? iD;
  List<String>? bUKU;
  String? tANGGALPEMINJAMAN;
  String? tANGGALPENGEMBALIAN;
  String? jANGKAPEMINJAMAN;
  String? fILETTDPENGAJUAN;
  String? sTATUSPEMINJAMAN;

  RiwayatPeminjamanModel(
      {this.iD,
      this.bUKU,
      this.tANGGALPEMINJAMAN,
      this.tANGGALPENGEMBALIAN,
      this.jANGKAPEMINJAMAN,
      this.fILETTDPENGAJUAN,
      this.sTATUSPEMINJAMAN});

  RiwayatPeminjamanModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    bUKU = json['BUKU'].cast<String>();
    tANGGALPEMINJAMAN = json['TANGGAL_PEMINJAMAN'];
    tANGGALPENGEMBALIAN = json['TANGGAL_PENGEMBALIAN'];
    jANGKAPEMINJAMAN = json['JANGKA_PEMINJAMAN'];
    fILETTDPENGAJUAN = json['FILE_TTD_PENGAJUAN'];
    sTATUSPEMINJAMAN = json['STATUS_PEMINJAMAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['BUKU'] = this.bUKU;
    data['TANGGAL_PEMINJAMAN'] = this.tANGGALPEMINJAMAN;
    data['TANGGAL_PENGEMBALIAN'] = this.tANGGALPENGEMBALIAN;
    data['JANGKA_PEMINJAMAN'] = this.jANGKAPEMINJAMAN;
    data['FILE_TTD_PENGAJUAN'] = this.fILETTDPENGAJUAN;
    data['STATUS_PEMINJAMAN'] = this.sTATUSPEMINJAMAN;
    return data;
  }
}
