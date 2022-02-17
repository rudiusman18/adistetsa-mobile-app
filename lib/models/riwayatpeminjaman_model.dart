class RiwayatPeminjamanModel {
  int? iD;
  String? nAMA;
  List<String>? bUKU;
  String? dATAGURU;
  String? tANGGALPEMINJAMAN;
  String? tANGGALPENGEMBALIAN;
  String? jANGKAPEMINJAMAN;
  String? fILETTDPENGAJUAN;
  String? sTATUSPEMINJAMAN;
  String? nIS;

  RiwayatPeminjamanModel(
      {this.iD,
      this.nAMA,
      this.bUKU,
      this.dATAGURU,
      this.tANGGALPEMINJAMAN,
      this.tANGGALPENGEMBALIAN,
      this.jANGKAPEMINJAMAN,
      this.fILETTDPENGAJUAN,
      this.sTATUSPEMINJAMAN,
      this.nIS});

  RiwayatPeminjamanModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMA = json['NAMA'];
    bUKU = json['BUKU'].cast<String>();
    dATAGURU = json['DATA_GURU'];
    tANGGALPEMINJAMAN = json['TANGGAL_PEMINJAMAN'];
    tANGGALPENGEMBALIAN = json['TANGGAL_PENGEMBALIAN'];
    jANGKAPEMINJAMAN = json['JANGKA_PEMINJAMAN'];
    fILETTDPENGAJUAN = json['FILE_TTD_PENGAJUAN'];
    sTATUSPEMINJAMAN = json['STATUS_PEMINJAMAN'];
    nIS = json['NIS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA'] = this.nAMA;
    data['BUKU'] = this.bUKU;
    data['DATA_GURU'] = this.dATAGURU;
    data['TANGGAL_PEMINJAMAN'] = this.tANGGALPEMINJAMAN;
    data['TANGGAL_PENGEMBALIAN'] = this.tANGGALPENGEMBALIAN;
    data['JANGKA_PEMINJAMAN'] = this.jANGKAPEMINJAMAN;
    data['FILE_TTD_PENGAJUAN'] = this.fILETTDPENGAJUAN;
    data['STATUS_PEMINJAMAN'] = this.sTATUSPEMINJAMAN;
    data['NIS'] = this.nIS;
    return data;
  }
}
