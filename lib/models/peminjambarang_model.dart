class PeminjamBarangModel {
  int? iD;
  List<ALAT>? aLAT;
  String? nAMAPEMINJAM;
  String? nOTELEPON;
  String? kEGIATAN;
  String? tANGGALPENGAJUAN;
  String? tANGGALPENGGUNAAN;
  String? tANGGALPENGEMBALIAN;
  String? kETERANGAN;
  String? sTATUSPENGAJUAN;
  String? tANDATANGAN;
  int? uSER;

  PeminjamBarangModel(
      {this.iD,
      this.aLAT,
      this.nAMAPEMINJAM,
      this.nOTELEPON,
      this.kEGIATAN,
      this.tANGGALPENGAJUAN,
      this.tANGGALPENGGUNAAN,
      this.tANGGALPENGEMBALIAN,
      this.kETERANGAN,
      this.sTATUSPENGAJUAN,
      this.tANDATANGAN,
      this.uSER});

  PeminjamBarangModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    if (json['ALAT'] != null) {
      aLAT = <ALAT>[];
      json['ALAT'].forEach((v) {
        aLAT!.add(new ALAT.fromJson(v));
      });
    }
    nAMAPEMINJAM = json['NAMA_PEMINJAM'];
    nOTELEPON = json['NO_TELEPON'];
    kEGIATAN = json['KEGIATAN'];
    tANGGALPENGAJUAN = json['TANGGAL_PENGAJUAN'];
    tANGGALPENGGUNAAN = json['TANGGAL_PENGGUNAAN'];
    tANGGALPENGEMBALIAN = json['TANGGAL_PENGEMBALIAN'];
    kETERANGAN = json['KETERANGAN'];
    sTATUSPENGAJUAN = json['STATUS_PENGAJUAN'];
    tANDATANGAN = json['TANDA_TANGAN'];
    uSER = json['USER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    if (this.aLAT != null) {
      data['ALAT'] = this.aLAT!.map((v) => v.toJson()).toList();
    }
    data['NAMA_PEMINJAM'] = this.nAMAPEMINJAM;
    data['NO_TELEPON'] = this.nOTELEPON;
    data['KEGIATAN'] = this.kEGIATAN;
    data['TANGGAL_PENGAJUAN'] = this.tANGGALPENGAJUAN;
    data['TANGGAL_PENGGUNAAN'] = this.tANGGALPENGGUNAAN;
    data['TANGGAL_PENGEMBALIAN'] = this.tANGGALPENGEMBALIAN;
    data['KETERANGAN'] = this.kETERANGAN;
    data['STATUS_PENGAJUAN'] = this.sTATUSPENGAJUAN;
    data['TANDA_TANGAN'] = this.tANDATANGAN;
    data['USER'] = this.uSER;
    return data;
  }
}

class ALAT {
  String? iD;
  String? nAMA;

  ALAT({this.iD, this.nAMA});

  ALAT.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMA = json['NAMA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA'] = this.nAMA;
    return data;
  }
}
