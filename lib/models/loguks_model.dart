class LogUKSModel {
  int? iD;
  String? nAMA;
  String? jENISPTK;
  String? tANGGAL;
  String? dETAILURL;

  LogUKSModel(
      {this.iD, this.nAMA, this.jENISPTK, this.tANGGAL, this.dETAILURL});

  LogUKSModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMA = json['NAMA'];
    jENISPTK = json['JENIS_PTK'];
    tANGGAL = json['TANGGAL'];
    dETAILURL = json['DETAIL_URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA'] = this.nAMA;
    data['JENIS_PTK'] = this.jENISPTK;
    data['TANGGAL'] = this.tANGGAL;
    data['DETAIL_URL'] = this.dETAILURL;
    return data;
  }
}
