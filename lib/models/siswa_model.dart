class SiswaModel {
  String? nIS;
  String? nISN;
  String? nAMA;
  String? nIPD;
  String? jENISKELAMIN;
  String? tEMPATLAHIR;
  String? tANGGALLAHIR;
  String? nIK;
  String? aGAMA;
  String? aLAMAT;
  int? rT;
  int? rW;
  String? dUSUN;
  String? kELURAHAN;
  String? kECAMATAN;
  int? kODEPOS;
  String? jENISTINGGAL;
  String? tELEPON;
  String? hP;
  String? eMAIL;
  String? sKHUN;
  String? pENERIMAKPS;
  String? nOKPS;
  String? rOMBELSAATINI;
  String? nOPESERTAUJIANNASIONAL;
  String? nOSERIIJAZAH;
  String? pENERIMAKIP;
  String? nOKKS;
  String? nOREGRISTASIAKTALAHIR;
  String? bANK;
  String? nOREKENINGBANK;
  String? rEKENINGATASNAMA;
  String? lAYAKPIP;
  String? kEBUTUHANKHUSUS;
  String? aNAKKE;
  String? lINTANG;
  String? bUJUR;
  String? nOKK;
  int? bERATBADAN;
  int? tINGGIBADAN;
  int? lINGKARKEPALA;
  int? jUMLAHSAUDARAKANDUNG;
  int? jARAKRUMAHKESEKOLAHKM;

  SiswaModel(
      {this.nIS,
      this.nISN,
      this.nAMA,
      this.nIPD,
      this.jENISKELAMIN,
      this.tEMPATLAHIR,
      this.tANGGALLAHIR,
      this.nIK,
      this.aGAMA,
      this.aLAMAT,
      this.rT,
      this.rW,
      this.dUSUN,
      this.kELURAHAN,
      this.kECAMATAN,
      this.kODEPOS,
      this.jENISTINGGAL,
      this.tELEPON,
      this.hP,
      this.eMAIL,
      this.sKHUN,
      this.pENERIMAKPS,
      this.nOKPS,
      this.rOMBELSAATINI,
      this.nOPESERTAUJIANNASIONAL,
      this.nOSERIIJAZAH,
      this.pENERIMAKIP,
      this.nOKKS,
      this.nOREGRISTASIAKTALAHIR,
      this.bANK,
      this.nOREKENINGBANK,
      this.rEKENINGATASNAMA,
      this.lAYAKPIP,
      this.kEBUTUHANKHUSUS,
      this.aNAKKE,
      this.lINTANG,
      this.bUJUR,
      this.nOKK,
      this.bERATBADAN,
      this.tINGGIBADAN,
      this.lINGKARKEPALA,
      this.jUMLAHSAUDARAKANDUNG,
      this.jARAKRUMAHKESEKOLAHKM});

  SiswaModel.fromJson(Map<String, dynamic> json) {
    nIS = json['NIS'];
    nISN = json['NISN'];
    nAMA = json['NAMA'];
    nIPD = json['NIPD'];
    jENISKELAMIN = json['JENIS_KELAMIN'];
    tEMPATLAHIR = json['TEMPAT_LAHIR'];
    tANGGALLAHIR = json['TANGGAL_LAHIR'];
    nIK = json['NIK'];
    aGAMA = json['AGAMA'];
    aLAMAT = json['ALAMAT'];
    rT = json['RT'];
    rW = json['RW'];
    dUSUN = json['DUSUN'];
    kELURAHAN = json['KELURAHAN'];
    kECAMATAN = json['KECAMATAN'];
    kODEPOS = json['KODE_POS'];
    jENISTINGGAL = json['JENIS_TINGGAL'];
    tELEPON = json['TELEPON'];
    hP = json['HP'];
    eMAIL = json['EMAIL'];
    sKHUN = json['SKHUN'];
    pENERIMAKPS = json['PENERIMA_KPS'];
    nOKPS = json['NO_KPS'];
    rOMBELSAATINI = json['ROMBEL_SAAT_INI'];
    nOPESERTAUJIANNASIONAL = json['NO_PESERTA_UJIAN_NASIONAL'];
    nOSERIIJAZAH = json['NO_SERI_IJAZAH'];
    pENERIMAKIP = json['PENERIMA_KIP'];
    nOKKS = json['NO_KKS'];
    nOREGRISTASIAKTALAHIR = json['NO_REGRISTASI_AKTA_LAHIR'];
    bANK = json['BANK'];
    nOREKENINGBANK = json['NO_REKENING_BANK'];
    rEKENINGATASNAMA = json['REKENING_ATAS_NAMA'];
    lAYAKPIP = json['LAYAK_PIP'];
    kEBUTUHANKHUSUS = json['KEBUTUHAN_KHUSUS'];
    aNAKKE = json['ANAK_KE'];
    lINTANG = json['LINTANG'];
    bUJUR = json['BUJUR'];
    nOKK = json['NO_KK'];
    bERATBADAN = json['BERAT_BADAN'];
    tINGGIBADAN = json['TINGGI_BADAN'];
    lINGKARKEPALA = json['LINGKAR_KEPALA'];
    jUMLAHSAUDARAKANDUNG = json['JUMLAH_SAUDARA_KANDUNG'];
    jARAKRUMAHKESEKOLAHKM = json['JARAK_RUMAH_KESEKOLAH_KM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NIS'] = this.nIS;
    data['NISN'] = this.nISN;
    data['NAMA'] = this.nAMA;
    data['NIPD'] = this.nIPD;
    data['JENIS_KELAMIN'] = this.jENISKELAMIN;
    data['TEMPAT_LAHIR'] = this.tEMPATLAHIR;
    data['TANGGAL_LAHIR'] = this.tANGGALLAHIR;
    data['NIK'] = this.nIK;
    data['AGAMA'] = this.aGAMA;
    data['ALAMAT'] = this.aLAMAT;
    data['RT'] = this.rT;
    data['RW'] = this.rW;
    data['DUSUN'] = this.dUSUN;
    data['KELURAHAN'] = this.kELURAHAN;
    data['KECAMATAN'] = this.kECAMATAN;
    data['KODE_POS'] = this.kODEPOS;
    data['JENIS_TINGGAL'] = this.jENISTINGGAL;
    data['TELEPON'] = this.tELEPON;
    data['HP'] = this.hP;
    data['EMAIL'] = this.eMAIL;
    data['SKHUN'] = this.sKHUN;
    data['PENERIMA_KPS'] = this.pENERIMAKPS;
    data['NO_KPS'] = this.nOKPS;
    data['ROMBEL_SAAT_INI'] = this.rOMBELSAATINI;
    data['NO_PESERTA_UJIAN_NASIONAL'] = this.nOPESERTAUJIANNASIONAL;
    data['NO_SERI_IJAZAH'] = this.nOSERIIJAZAH;
    data['PENERIMA_KIP'] = this.pENERIMAKIP;
    data['NO_KKS'] = this.nOKKS;
    data['NO_REGRISTASI_AKTA_LAHIR'] = this.nOREGRISTASIAKTALAHIR;
    data['BANK'] = this.bANK;
    data['NO_REKENING_BANK'] = this.nOREKENINGBANK;
    data['REKENING_ATAS_NAMA'] = this.rEKENINGATASNAMA;
    data['LAYAK_PIP'] = this.lAYAKPIP;
    data['KEBUTUHAN_KHUSUS'] = this.kEBUTUHANKHUSUS;
    data['ANAK_KE'] = this.aNAKKE;
    data['LINTANG'] = this.lINTANG;
    data['BUJUR'] = this.bUJUR;
    data['NO_KK'] = this.nOKK;
    data['BERAT_BADAN'] = this.bERATBADAN;
    data['TINGGI_BADAN'] = this.tINGGIBADAN;
    data['LINGKAR_KEPALA'] = this.lINGKARKEPALA;
    data['JUMLAH_SAUDARA_KANDUNG'] = this.jUMLAHSAUDARAKANDUNG;
    data['JARAK_RUMAH_KESEKOLAH_KM'] = this.jARAKRUMAHKESEKOLAHKM;
    return data;
  }
}
