class KatalogEkskulModel {
  int? iD;
  List<String>? jADWAL;
  String? nAMA;
  String? kATEGORI;
  String? dESKRIPSI;
  String? dOKUMENTASI;

  KatalogEkskulModel(
      {this.iD,
      this.jADWAL,
      this.nAMA,
      this.kATEGORI,
      this.dESKRIPSI,
      this.dOKUMENTASI});

  KatalogEkskulModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    jADWAL = json['JADWAL'].cast<String>();
    nAMA = json['NAMA'];
    kATEGORI = json['KATEGORI'];
    dESKRIPSI = json['DESKRIPSI'];
    dOKUMENTASI = json['DOKUMENTASI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['JADWAL'] = this.jADWAL;
    data['NAMA'] = this.nAMA;
    data['KATEGORI'] = this.kATEGORI;
    data['DESKRIPSI'] = this.dESKRIPSI;
    data['DOKUMENTASI'] = this.dOKUMENTASI;
    return data;
  }
}
