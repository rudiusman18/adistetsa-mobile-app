class DetailDaftarAlumniModel {
  int? iD;
  String? nAMASISWA;
  String? kELAS;
  String? nISN;
  String? nIS;
  String? tAHUNAJARAN;
  String? nAMAPT;
  String? pROGRAMSTUDI;
  String? mEDIASOSIAL;
  String? eMAIL;
  String? aLAMAT;
  String? tEMPATBEKERJA;

  DetailDaftarAlumniModel(
      {this.iD,
      this.nAMASISWA,
      this.kELAS,
      this.nISN,
      this.nIS,
      this.tAHUNAJARAN,
      this.nAMAPT,
      this.pROGRAMSTUDI,
      this.mEDIASOSIAL,
      this.eMAIL,
      this.aLAMAT,
      this.tEMPATBEKERJA});

  DetailDaftarAlumniModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMASISWA = json['NAMA_SISWA'];
    kELAS = json['KELAS'];
    nISN = json['NISN'];
    nIS = json['NIS'];
    tAHUNAJARAN = json['TAHUN_AJARAN'];
    nAMAPT = json['NAMA_PT'];
    pROGRAMSTUDI = json['PROGRAM_STUDI'];
    mEDIASOSIAL = json['MEDIA_SOSIAL'];
    eMAIL = json['EMAIL'];
    aLAMAT = json['ALAMAT'];
    tEMPATBEKERJA = json['TEMPAT_BEKERJA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA_SISWA'] = this.nAMASISWA;
    data['KELAS'] = this.kELAS;
    data['NISN'] = this.nISN;
    data['NIS'] = this.nIS;
    data['TAHUN_AJARAN'] = this.tAHUNAJARAN;
    data['NAMA_PT'] = this.nAMAPT;
    data['PROGRAM_STUDI'] = this.pROGRAMSTUDI;
    data['MEDIA_SOSIAL'] = this.mEDIASOSIAL;
    data['EMAIL'] = this.eMAIL;
    data['ALAMAT'] = this.aLAMAT;
    data['TEMPAT_BEKERJA'] = this.tEMPATBEKERJA;
    return data;
  }
}
