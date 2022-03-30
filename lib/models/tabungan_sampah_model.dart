class TabunganSampahModel {
  String? bulan;
  int? sampahKering;
  int? sampahBasah;
  int? totalTabungan;

  TabunganSampahModel(
      {this.bulan, this.sampahKering, this.sampahBasah, this.totalTabungan});

  TabunganSampahModel.fromJson(Map<String, dynamic> json) {
    bulan = json['bulan'];
    sampahKering = json['sampah_kering'];
    sampahBasah = json['sampah_basah'];
    totalTabungan = json['total_tabungan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bulan'] = this.bulan;
    data['sampah_kering'] = this.sampahKering;
    data['sampah_basah'] = this.sampahBasah;
    data['total_tabungan'] = this.totalTabungan;
    return data;
  }
}
