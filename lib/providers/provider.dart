import 'package:adistetsa/models/guru_model.dart';
import 'package:adistetsa/models/katalogbuku_model.dart';
import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/cupertino.dart';

class Providers with ChangeNotifier {
  late RolesModel _role;
  RolesModel get role => _role;

  GuruModel _guru = GuruModel();
  GuruModel get guru => _guru;

  KatalogBukuModel _katalog = KatalogBukuModel();
  KatalogBukuModel get katalog => _katalog;

  set setGuru(GuruModel guru) {
    _guru = guru;
    notifyListeners();
  }

  set roles(RolesModel role) {
    _role = role;
    notifyListeners();
  }

  set setKatalogBuku(KatalogBukuModel katalog) {
    _katalog = katalog;
    notifyListeners();
  }

  Future<bool> getGuruProfile() async {
    try {
      GuruModel guruModel = await Services().getProfile();
      _guru = guruModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getDetailKatalogBuku({String? register}) async {
    try {
      KatalogBukuModel katalogBukuModel =
          await Services().getDetailKatalogBuku(register: register);
      _katalog = katalogBukuModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
