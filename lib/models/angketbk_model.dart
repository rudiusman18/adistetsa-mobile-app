class AngketBKModel {
  int? iD;
  String? kELAS;
  String? nAMA;
  String? kATEGORI;
  String? fILEANGKET;
  String? fILE;
  int? kELASSISWA;

  AngketBKModel(
      {this.iD,
      this.kELAS,
      this.nAMA,
      this.kATEGORI,
      this.fILEANGKET,
      this.fILE,
      this.kELASSISWA});

  AngketBKModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    kELAS = json['KELAS'];
    nAMA = json['NAMA'];
    kATEGORI = json['KATEGORI'];
    fILEANGKET = json['FILE_ANGKET'];
    fILE = json['FILE'];
    kELASSISWA = json['KELAS_SISWA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['KELAS'] = this.kELAS;
    data['NAMA'] = this.nAMA;
    data['KATEGORI'] = this.kATEGORI;
    data['FILE_ANGKET'] = this.fILEANGKET;
    data['FILE'] = this.fILE;
    data['KELAS_SISWA'] = this.kELASSISWA;
    return data;
  }
}
