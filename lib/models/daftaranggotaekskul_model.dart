class DaftarAnggotaEkskulModel {
  int? iD;
  String? nIS;
  String? nAMA;
  String? kELASSISWA;
  String? sTATUS;

  DaftarAnggotaEkskulModel(
      {this.iD, this.nIS, this.nAMA, this.kELASSISWA, this.sTATUS});

  DaftarAnggotaEkskulModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nIS = json['NIS'];
    nAMA = json['NAMA'];
    kELASSISWA = json['KELAS_SISWA'];
    sTATUS = json['STATUS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NIS'] = this.nIS;
    data['NAMA'] = this.nAMA;
    data['KELAS_SISWA'] = this.kELASSISWA;
    data['STATUS'] = this.sTATUS;
    return data;
  }
}
