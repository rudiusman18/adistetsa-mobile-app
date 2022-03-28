class ProfilKonselorModel {
  int? iD;
  String? nIP;
  String? nAMA;
  String? kOMPETENSI;
  String? aLUMNUS;
  String? wHATSAPP;
  String? cONFERENCE;
  String? fOTO;
  String? sTATUS;
  int? uSER;

  ProfilKonselorModel(
      {this.iD,
      this.nIP,
      this.nAMA,
      this.kOMPETENSI,
      this.aLUMNUS,
      this.wHATSAPP,
      this.cONFERENCE,
      this.fOTO,
      this.sTATUS,
      this.uSER});

  ProfilKonselorModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nIP = json['NIP'];
    nAMA = json['NAMA'];
    kOMPETENSI = json['KOMPETENSI'];
    aLUMNUS = json['ALUMNUS'];
    wHATSAPP = json['WHATSAPP'];
    cONFERENCE = json['CONFERENCE'];
    fOTO = json['FOTO'];
    sTATUS = json['STATUS'];
    uSER = json['USER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NIP'] = this.nIP;
    data['NAMA'] = this.nAMA;
    data['KOMPETENSI'] = this.kOMPETENSI;
    data['ALUMNUS'] = this.aLUMNUS;
    data['WHATSAPP'] = this.wHATSAPP;
    data['CONFERENCE'] = this.cONFERENCE;
    data['FOTO'] = this.fOTO;
    data['STATUS'] = this.sTATUS;
    data['USER'] = this.uSER;
    return data;
  }
}
