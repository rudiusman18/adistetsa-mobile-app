class GuruModel {
  int? iD;
  String? nAMASEKOLAH;
  String? nSS;
  String? nPSN;
  String? aLAMATSEKOLAH;
  String? nAMALENGKAP;
  String? nIK;
  String? jENISKELAMIN;
  String? tEMPATLAHIR;
  String? tANGGALLAHIR;
  String? nAMAIBUKANDUNG;
  String? aLAMATTEMPATTINGGAL;
  String? dUSUN;
  String? kELURAHAN;
  String? kECAMATAN;
  String? kOTA;
  String? pROVINSI;
  String? lINTANG1;
  String? lINTANG2;
  String? aGAMA;
  String? nPWP;
  String? nAMAWAJIBPAJAK;
  String? kEWARGANEGARAAN;
  String? sTATUSKAWIN;
  String? nAMAPASANGAN;
  String? pEKERJAANPASANGAN;
  String? pASANGANPNS;
  String? nIPPASANGAN;
  String? sTATUSPEGAWAI;
  String? pNS;
  String? nIP;
  String? nIY;
  String? nIGB;
  String? nUPTK;
  String? jENISPTK;
  String? sKPENGANGKATAN;
  String? tMTPENGANGKATAN;
  String? lEMBAGAPENGANGKATAN;
  String? sKCPNS;
  String? tMTCPNS;
  String? tMTPNS;
  String? pANGKAT;
  String? sUMBERGAJI;
  String? kARTUPEGAWAI;
  String? kARIS;
  String? nOSURAT;
  String? tGLSURAT;
  String? tMTTUGAS;
  String? sEKOLAHINDUK;
  String? lISENSIKEPALASEKOLAH;
  String? kODEPROGRAMKEAHLIAN;
  String? jENISKETUNAAN;
  String? sPESIALISMENANGANI;
  String? sTATUSAKTIF;
  String? hP;
  String? eMAIL;

  GuruModel(
      {this.iD,
      this.nAMASEKOLAH,
      this.nSS,
      this.nPSN,
      this.aLAMATSEKOLAH,
      this.nAMALENGKAP,
      this.nIK,
      this.jENISKELAMIN,
      this.tEMPATLAHIR,
      this.tANGGALLAHIR,
      this.nAMAIBUKANDUNG,
      this.aLAMATTEMPATTINGGAL,
      this.dUSUN,
      this.kELURAHAN,
      this.kECAMATAN,
      this.kOTA,
      this.pROVINSI,
      this.lINTANG1,
      this.lINTANG2,
      this.aGAMA,
      this.nPWP,
      this.nAMAWAJIBPAJAK,
      this.kEWARGANEGARAAN,
      this.sTATUSKAWIN,
      this.nAMAPASANGAN,
      this.pEKERJAANPASANGAN,
      this.pASANGANPNS,
      this.nIPPASANGAN,
      this.sTATUSPEGAWAI,
      this.pNS,
      this.nIP,
      this.nIY,
      this.nIGB,
      this.nUPTK,
      this.jENISPTK,
      this.sKPENGANGKATAN,
      this.tMTPENGANGKATAN,
      this.lEMBAGAPENGANGKATAN,
      this.sKCPNS,
      this.tMTCPNS,
      this.tMTPNS,
      this.pANGKAT,
      this.sUMBERGAJI,
      this.kARTUPEGAWAI,
      this.kARIS,
      this.nOSURAT,
      this.tGLSURAT,
      this.tMTTUGAS,
      this.sEKOLAHINDUK,
      this.lISENSIKEPALASEKOLAH,
      this.kODEPROGRAMKEAHLIAN,
      this.jENISKETUNAAN,
      this.sPESIALISMENANGANI,
      this.sTATUSAKTIF,
      this.hP,
      this.eMAIL});

  GuruModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAMASEKOLAH = json['NAMA_SEKOLAH'];
    nSS = json['NSS'];
    nPSN = json['NPSN'];
    aLAMATSEKOLAH = json['ALAMAT_SEKOLAH'];
    nAMALENGKAP = json['NAMA_LENGKAP'];
    nIK = json['NIK'];
    jENISKELAMIN = json['JENIS_KELAMIN'];
    tEMPATLAHIR = json['TEMPAT_LAHIR'];
    tANGGALLAHIR = json['TANGGAL_LAHIR'];
    nAMAIBUKANDUNG = json['NAMA_IBU_KANDUNG'];
    aLAMATTEMPATTINGGAL = json['ALAMAT_TEMPAT_TINGGAL'];
    dUSUN = json['DUSUN'];
    kELURAHAN = json['KELURAHAN'];
    kECAMATAN = json['KECAMATAN'];
    kOTA = json['KOTA'];
    pROVINSI = json['PROVINSI'];
    lINTANG1 = json['LINTANG_1'];
    lINTANG2 = json['LINTANG_2'];
    aGAMA = json['AGAMA'];
    nPWP = json['NPWP'];
    nAMAWAJIBPAJAK = json['NAMA_WAJIB_PAJAK'];
    kEWARGANEGARAAN = json['KEWARGANEGARAAN'];
    sTATUSKAWIN = json['STATUS_KAWIN'];
    nAMAPASANGAN = json['NAMA_PASANGAN'];
    pEKERJAANPASANGAN = json['PEKERJAAN_PASANGAN'];
    pASANGANPNS = json['PASANGAN_PNS'];
    nIPPASANGAN = json['NIP_PASANGAN'];
    sTATUSPEGAWAI = json['STATUS_PEGAWAI'];
    pNS = json['PNS'];
    nIP = json['NIP'];
    nIY = json['NIY'];
    nIGB = json['NIGB'];
    nUPTK = json['NUPTK'];
    jENISPTK = json['JENIS_PTK'];
    sKPENGANGKATAN = json['SK_PENGANGKATAN'];
    tMTPENGANGKATAN = json['TMT_PENGANGKATAN'];
    lEMBAGAPENGANGKATAN = json['LEMBAGA_PENGANGKATAN'];
    sKCPNS = json['SK_CPNS'];
    tMTCPNS = json['TMT_CPNS'];
    tMTPNS = json['TMT_PNS'];
    pANGKAT = json['PANGKAT'];
    sUMBERGAJI = json['SUMBER_GAJI'];
    kARTUPEGAWAI = json['KARTU_PEGAWAI'];
    kARIS = json['KARIS'];
    nOSURAT = json['NO_SURAT'];
    tGLSURAT = json['TGL_SURAT'];
    tMTTUGAS = json['TMT_TUGAS'];
    sEKOLAHINDUK = json['SEKOLAH_INDUK'];
    lISENSIKEPALASEKOLAH = json['LISENSI_KEPALA_SEKOLAH'];
    kODEPROGRAMKEAHLIAN = json['KODE_PROGRAM_KEAHLIAN'];
    jENISKETUNAAN = json['JENIS_KETUNAAN'];
    sPESIALISMENANGANI = json['SPESIALIS_MENANGANI'];
    sTATUSAKTIF = json['STATUS_AKTIF'];
    hP = json['HP'];
    eMAIL = json['EMAIL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAMA_SEKOLAH'] = this.nAMASEKOLAH;
    data['NSS'] = this.nSS;
    data['NPSN'] = this.nPSN;
    data['ALAMAT_SEKOLAH'] = this.aLAMATSEKOLAH;
    data['NAMA_LENGKAP'] = this.nAMALENGKAP;
    data['NIK'] = this.nIK;
    data['JENIS_KELAMIN'] = this.jENISKELAMIN;
    data['TEMPAT_LAHIR'] = this.tEMPATLAHIR;
    data['TANGGAL_LAHIR'] = this.tANGGALLAHIR;
    data['NAMA_IBU_KANDUNG'] = this.nAMAIBUKANDUNG;
    data['ALAMAT_TEMPAT_TINGGAL'] = this.aLAMATTEMPATTINGGAL;
    data['DUSUN'] = this.dUSUN;
    data['KELURAHAN'] = this.kELURAHAN;
    data['KECAMATAN'] = this.kECAMATAN;
    data['KOTA'] = this.kOTA;
    data['PROVINSI'] = this.pROVINSI;
    data['LINTANG_1'] = this.lINTANG1;
    data['LINTANG_2'] = this.lINTANG2;
    data['AGAMA'] = this.aGAMA;
    data['NPWP'] = this.nPWP;
    data['NAMA_WAJIB_PAJAK'] = this.nAMAWAJIBPAJAK;
    data['KEWARGANEGARAAN'] = this.kEWARGANEGARAAN;
    data['STATUS_KAWIN'] = this.sTATUSKAWIN;
    data['NAMA_PASANGAN'] = this.nAMAPASANGAN;
    data['PEKERJAAN_PASANGAN'] = this.pEKERJAANPASANGAN;
    data['PASANGAN_PNS'] = this.pASANGANPNS;
    data['NIP_PASANGAN'] = this.nIPPASANGAN;
    data['STATUS_PEGAWAI'] = this.sTATUSPEGAWAI;
    data['PNS'] = this.pNS;
    data['NIP'] = this.nIP;
    data['NIY'] = this.nIY;
    data['NIGB'] = this.nIGB;
    data['NUPTK'] = this.nUPTK;
    data['JENIS_PTK'] = this.jENISPTK;
    data['SK_PENGANGKATAN'] = this.sKPENGANGKATAN;
    data['TMT_PENGANGKATAN'] = this.tMTPENGANGKATAN;
    data['LEMBAGA_PENGANGKATAN'] = this.lEMBAGAPENGANGKATAN;
    data['SK_CPNS'] = this.sKCPNS;
    data['TMT_CPNS'] = this.tMTCPNS;
    data['TMT_PNS'] = this.tMTPNS;
    data['PANGKAT'] = this.pANGKAT;
    data['SUMBER_GAJI'] = this.sUMBERGAJI;
    data['KARTU_PEGAWAI'] = this.kARTUPEGAWAI;
    data['KARIS'] = this.kARIS;
    data['NO_SURAT'] = this.nOSURAT;
    data['TGL_SURAT'] = this.tGLSURAT;
    data['TMT_TUGAS'] = this.tMTTUGAS;
    data['SEKOLAH_INDUK'] = this.sEKOLAHINDUK;
    data['LISENSI_KEPALA_SEKOLAH'] = this.lISENSIKEPALASEKOLAH;
    data['KODE_PROGRAM_KEAHLIAN'] = this.kODEPROGRAMKEAHLIAN;
    data['JENIS_KETUNAAN'] = this.jENISKETUNAAN;
    data['SPESIALIS_MENANGANI'] = this.sPESIALISMENANGANI;
    data['STATUS_AKTIF'] = this.sTATUSAKTIF;
    data['HP'] = this.hP;
    data['EMAIL'] = this.eMAIL;
    return data;
  }
}
