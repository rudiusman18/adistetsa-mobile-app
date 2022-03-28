class DaftarAlumniModel {
  int? iD;
  String? nAMASISWA;
  String? kELAS;
  String? nIS;

  DaftarAlumniModel({this.iD, this.nAMASISWA, this.kELAS, this.nIS});

  DaftarAlumniModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMASISWA = json['NAMA_SISWA'];
    kELAS = json['KELAS'];
    nIS = json['NIS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA_SISWA'] = this.nAMASISWA;
    data['KELAS'] = this.kELAS;
    data['NIS'] = this.nIS;
    return data;
  }
}
