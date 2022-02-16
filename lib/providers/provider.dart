import 'package:adistetsa/models/guru_model.dart';
import 'package:adistetsa/models/karyawan_model.dart';
import 'package:adistetsa/models/katalogbuku_model.dart';
import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/models/siswa_model.dart';
import 'package:adistetsa/services/service.dart';
import 'package:flutter/cupertino.dart';

class Providers with ChangeNotifier {
  late RolesModel _role;
  RolesModel get role => _role;

  GuruModel _guru = GuruModel();
  GuruModel get guru => _guru;

  KaryawanModel _karyawan = KaryawanModel();
  KaryawanModel get karyawan => _karyawan;

  SiswaModel _siswa = SiswaModel();
  SiswaModel get siswa => _siswa;

  KatalogBukuModel _katalog = KatalogBukuModel();
  KatalogBukuModel get katalog => _katalog;

  List<KatalogBukuModel> _listKatalog = [];
  List<KatalogBukuModel> get listKatalog => _listKatalog;

  set listKatalog(List<KatalogBukuModel> listKatalog) {
    _listKatalog = listKatalog;
    notifyListeners();
  }

  set setGuru(GuruModel guru) {
    _guru = guru;
    notifyListeners();
  }

  set setKaryawan(KaryawanModel karyawan) {
    _karyawan = karyawan;
    notifyListeners();
  }

  set setSiswa(SiswaModel siswa) {
    _siswa = siswa;
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

  Future<bool> getKaryawan() async {
    try {
      KaryawanModel karyawanModel = await Services().getProfile();
      _karyawan = karyawanModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getSiswa() async {
    try {
      SiswaModel siswaModel = await Services().getProfile();
      _siswa = siswaModel;
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

  // NOTE: Untuk mendapatkan list dari katalog yang user ambil

  // ? mengecek apakah buku sudah dipinjam oleh user yang sama
  bookExist(KatalogBukuModel buku) {
    // -1 menandakan bahwa data sudah ada dan tidak dapat dimasukkan kembali
    if (_listKatalog
            .indexWhere((element) => element.rEGISTER == buku.rEGISTER) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  // ? menambah buku kedalam list
  addBooks({required KatalogBukuModel buku}) {
    if (bookExist(buku)) {
      print('${buku.jUDUL} wes masuk');
      // _listKatalog.clear();
      // throw Exception('Anda telah memasukkan buku ini ke daftar pinjaman');
    } else {
      print(buku.jUDUL);
      _listKatalog.add(buku);
    }
  }
}
