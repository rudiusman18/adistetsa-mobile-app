import 'package:adistetsa/models/siswa_model.dart';

class ListSiswaModel {
  List<SiswaModel> siswa = [];

  ListSiswaModel(this.siswa);

  ListSiswaModel.fromjson(Map<String, dynamic> json) {
    siswa = json['results']
        .map<SiswaModel>((item) => SiswaModel.fromJson(item))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'results': siswa.map((item) => item.toJson()).toList(),
    };
  }
}
