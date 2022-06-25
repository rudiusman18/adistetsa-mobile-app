class JadwalMengajarGuruModel {
  int? iD;
  String? gURU;
  String? tAHUNAJARAN;
  String? kELAS;
  String? mATAPELAJARAN;
  List<String>? wAKTUPELAJARAN;
  String? sEMESTER;
  String? hARI;

  JadwalMengajarGuruModel({
    this.iD,
    this.gURU,
    this.tAHUNAJARAN,
    this.kELAS,
    this.mATAPELAJARAN,
    this.wAKTUPELAJARAN,
    this.sEMESTER,
    this.hARI,
  });

  JadwalMengajarGuruModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    gURU = json['GURU'];
    tAHUNAJARAN = json['TAHUN_AJARAN'];
    kELAS = json['KELAS'];
    mATAPELAJARAN = json['MATA_PELAJARAN'];
    wAKTUPELAJARAN = json['WAKTU_PELAJARAN'].cast<String>();
    sEMESTER = json['SEMESTER'];
    hARI = json['HARI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['GURU'] = this.gURU;
    data['TAHUN_AJARAN'] = this.tAHUNAJARAN;
    data['KELAS'] = this.kELAS;
    data['MATA_PELAJARAN'] = this.mATAPELAJARAN;
    data['WAKTU_PELAJARAN'] = this.wAKTUPELAJARAN;
    data['SEMESTER'] = this.sEMESTER;
    data['HARI'] = this.hARI;
    return data;
  }
}
