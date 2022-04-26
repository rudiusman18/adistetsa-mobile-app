class PresensiSiswaModel {
  int? iD;
  String? nAMA;
  String? kETERANGAN;
  String? fILEKETERANGAN;
  int? nIS;

  PresensiSiswaModel(
      {this.iD, this.nAMA, this.kETERANGAN, this.fILEKETERANGAN, this.nIS});

  PresensiSiswaModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMA = json['NAMA'];
    kETERANGAN = json['KETERANGAN'];
    fILEKETERANGAN = json['FILE_KETERANGAN'];
    nIS = json['NIS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA'] = this.nAMA;
    data['KETERANGAN'] = this.kETERANGAN;
    data['FILE_KETERANGAN'] = this.fILEKETERANGAN;
    data['NIS'] = this.nIS;
    return data;
  }
}
