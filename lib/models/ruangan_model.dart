class RuanganModel {
  int? iD;
  String? rUANGAN;
  String? pENGGUNA;
  String? nOHP;
  String? kEGIATAN;
  String? tANGGALPENGAJUAN;
  String? tANGGALPEMAKAIAN;
  String? tANGGALBERAKHIR;
  String? jAMPENGGUNAAN;
  String? jAMBERAKHIR;
  String? sTATUS;
  String? jENISPEMINJAMAN;
  String? kETERANGAN;
  String? tANDATANGAN;

  RuanganModel(
      {this.iD,
      this.rUANGAN,
      this.pENGGUNA,
      this.nOHP,
      this.kEGIATAN,
      this.tANGGALPENGAJUAN,
      this.tANGGALPEMAKAIAN,
      this.tANGGALBERAKHIR,
      this.jAMPENGGUNAAN,
      this.jAMBERAKHIR,
      this.sTATUS,
      this.jENISPEMINJAMAN,
      this.kETERANGAN,
      this.tANDATANGAN});

  RuanganModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    rUANGAN = json['RUANGAN'];
    pENGGUNA = json['PENGGUNA'];
    nOHP = json['NO_HP'];
    kEGIATAN = json['KEGIATAN'];
    tANGGALPENGAJUAN = json['TANGGAL_PENGAJUAN'];
    tANGGALPEMAKAIAN = json['TANGGAL_PEMAKAIAN'];
    tANGGALBERAKHIR = json['TANGGAL_BERAKHIR'];
    jAMPENGGUNAAN = json['JAM_PENGGUNAAN'];
    jAMBERAKHIR = json['JAM_BERAKHIR'];
    sTATUS = json['STATUS'];
    jENISPEMINJAMAN = json['JENIS_PEMINJAMAN'];
    kETERANGAN = json['KETERANGAN'];
    tANDATANGAN = json['TANDA_TANGAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['RUANGAN'] = this.rUANGAN;
    data['PENGGUNA'] = this.pENGGUNA;
    data['NO_HP'] = this.nOHP;
    data['KEGIATAN'] = this.kEGIATAN;
    data['TANGGAL_PENGAJUAN'] = this.tANGGALPENGAJUAN;
    data['TANGGAL_PEMAKAIAN'] = this.tANGGALPEMAKAIAN;
    data['TANGGAL_BERAKHIR'] = this.tANGGALBERAKHIR;
    data['JAM_PENGGUNAAN'] = this.jAMPENGGUNAAN;
    data['JAM_BERAKHIR'] = this.jAMBERAKHIR;
    data['STATUS'] = this.sTATUS;
    data['JENIS_PEMINJAMAN'] = this.jENISPEMINJAMAN;
    data['KETERANGAN'] = this.kETERANGAN;
    data['TANDA_TANGAN'] = this.tANDATANGAN;
    return data;
  }
}
