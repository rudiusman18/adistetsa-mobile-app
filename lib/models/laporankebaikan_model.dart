class LaporanKebaikanModel {
  int? iD;
  String? dATASISWA;
  String? jENISPROGRAMKEBAIKAN;
  String? bUKTIPROGRAMKEBAIKAN;
  String? tANGGALPENGAJUAN;
  String? sTATUSPENGAJUAN;

  LaporanKebaikanModel(
      {this.iD,
      this.dATASISWA,
      this.jENISPROGRAMKEBAIKAN,
      this.bUKTIPROGRAMKEBAIKAN,
      this.tANGGALPENGAJUAN,
      this.sTATUSPENGAJUAN});

  LaporanKebaikanModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    dATASISWA = json['DATA_SISWA'];
    jENISPROGRAMKEBAIKAN = json['JENIS_PROGRAM_KEBAIKAN'];
    bUKTIPROGRAMKEBAIKAN = json['BUKTI_PROGRAM_KEBAIKAN'];
    tANGGALPENGAJUAN = json['TANGGAL_PENGAJUAN'];
    sTATUSPENGAJUAN = json['STATUS_PENGAJUAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['DATA_SISWA'] = this.dATASISWA;
    data['JENIS_PROGRAM_KEBAIKAN'] = this.jENISPROGRAMKEBAIKAN;
    data['BUKTI_PROGRAM_KEBAIKAN'] = this.bUKTIPROGRAMKEBAIKAN;
    data['TANGGAL_PENGAJUAN'] = this.tANGGALPENGAJUAN;
    data['STATUS_PENGAJUAN'] = this.sTATUSPENGAJUAN;
    return data;
  }
}
