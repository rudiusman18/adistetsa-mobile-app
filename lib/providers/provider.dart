import 'package:adistetsa/models/detailjurnalmengajarguru_model.dart';
import 'package:adistetsa/models/katalogbarang_model.dart';
import 'package:adistetsa/models/katalogruangan_model.dart';
import 'package:adistetsa/models/peminjambarang_model.dart';
import 'package:adistetsa/models/guru_model.dart';
import 'package:adistetsa/models/jenispelanggaran_model.dart';
import 'package:adistetsa/models/karyawan_model.dart';
import 'package:adistetsa/models/katalogbuku_model.dart';
import 'package:adistetsa/models/list_buku_model.dart';
import 'package:adistetsa/models/pengajuanpeminjaman_model.dart';
import 'package:adistetsa/models/presensisiswa_model.dart';
import 'package:adistetsa/models/riwayatbarang_model.dart';
import 'package:adistetsa/models/riwayatpeminjaman_model.dart';
import 'package:adistetsa/models/riwayatruangan_model.dart';
import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/models/peminjamruangan_model.dart';
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

  List<ListBukuModel> _listKatalog = [];
  List<ListBukuModel> get listKatalog => _listKatalog;

  List<String> _idBuku = [];
  List<String> get idBuku => _idBuku;

  SiswaModel _listSiswa = SiswaModel();
  SiswaModel get listSiswa => _listSiswa;

  PengajuanPeminjamanModel _pengajuanPeminjaman = PengajuanPeminjamanModel();
  PengajuanPeminjamanModel get pengajuanPeminjaman => _pengajuanPeminjaman;

  RiwayatPeminjamanModel _riwayatPeminjaman = RiwayatPeminjamanModel();
  RiwayatPeminjamanModel get riwayatPeminjaman => _riwayatPeminjaman;

  SiswaModel _dataSiswa = SiswaModel();
  SiswaModel get dataSiswa => _dataSiswa;

  JenisPelanggaranModel _jenisPelanggaran = JenisPelanggaranModel();
  JenisPelanggaranModel get jenisPelanggaran => _jenisPelanggaran;

  PeminjamRuanganModel _ruangan = PeminjamRuanganModel();
  PeminjamRuanganModel get ruangan => _ruangan;

  PeminjamBarangModel _barang = PeminjamBarangModel();
  PeminjamBarangModel get barang => _barang;

  List<KatalogBarangModel> _barangChart = [];
  List<KatalogBarangModel> get barangChart => _barangChart;

  List<String> _idBarang = [];
  List<String> get idBarang => _idBarang;

  KatalogRuanganModel? _ruangChart;
  KatalogRuanganModel? get ruangChart => _ruangChart;

  String _idRuang = '';
  String get idRuang => _idRuang;

  RiwayatBarangModel _riwayatBarang = RiwayatBarangModel();
  RiwayatBarangModel get riwayatBarang => _riwayatBarang;

  RiwayatRuanganModel _riwayatRuangan = RiwayatRuanganModel();
  RiwayatRuanganModel get riwayatRuang => _riwayatRuangan;

  PeminjamRuanganModel _peminjamanRuangan = PeminjamRuanganModel();
  PeminjamRuanganModel get peminjamanRuangan => _peminjamanRuangan;

  PeminjamBarangModel _peminjamanBarang = PeminjamBarangModel();
  PeminjamBarangModel get peminjamanBarang => _peminjamanBarang;

  DetailJurnalMengajarGuruModel _detailJurnalMengajar =
      DetailJurnalMengajarGuruModel();
  DetailJurnalMengajarGuruModel get detailJurnalMengajar =>
      _detailJurnalMengajar;

  PresensiSiswaModel _detailPresensiSiswa = PresensiSiswaModel();
  PresensiSiswaModel get detailPresensiSiswa => _detailPresensiSiswa;

  List listJenisProgramKebaikan = [];

  String detailRuang = '';

  String idJurnalMengajar = '';

  String errorMessage = '';

  set listKatalog(List<ListBukuModel> listKatalog) {
    _listKatalog = listKatalog;
    notifyListeners();
  }

  set idBuku(List<String> idBuku) {
    _idBuku = idBuku;
    notifyListeners();
  }

  set barangChart(List<KatalogBarangModel> barang) {
    _barangChart = barang;
    notifyListeners();
  }

  set idBarang(List<String> idBarang) {
    _idBarang = idBarang;
    notifyListeners();
  }

  set ruangChart(KatalogRuanganModel? ruang) {
    _ruangChart = ruang;
    notifyListeners();
  }

  set idRuang(String idRuang) {
    _idRuang = idRuang;
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

  set setPengajuanPeminjaman(PengajuanPeminjamanModel pengajuanPeminjaman) {
    _pengajuanPeminjaman = pengajuanPeminjaman;
    notifyListeners();
  }

  set setRiwayatPeminjaman(RiwayatPeminjamanModel riwayatPeminjaman) {
    _riwayatPeminjaman = riwayatPeminjaman;
    notifyListeners();
  }

  set setDataSiswa(SiswaModel dataSiswaKesiswaan) {
    _dataSiswa = dataSiswaKesiswaan;
    notifyListeners();
  }

  set setJenisPelanggaran(JenisPelanggaranModel jenisPelanggaran) {
    _jenisPelanggaran = jenisPelanggaran;
    notifyListeners();
  }

  set setRuangan(PeminjamRuanganModel ruangan) {
    _ruangan = ruangan;
    notifyListeners();
  }

  set setBarang(PeminjamBarangModel barang) {
    _barang = barang;
    notifyListeners();
  }

  set setRiwayatBarang(RiwayatBarangModel riwayatBarang) {
    _riwayatBarang = riwayatBarang;
    notifyListeners();
  }

  set setRiwayatRuangan(RiwayatRuanganModel ruang) {
    _riwayatRuangan = riwayatRuang;
    notifyListeners();
  }

  setDetailRuangan({required String detail}) {
    detailRuang = detail;
    notifyListeners();
  }

  setIdJurnalBelajar({required String getIdJurnalBelajar}) {
    idJurnalMengajar = getIdJurnalBelajar;
    notifyListeners();
  }

  set setPeminjamanRuangan(PeminjamRuanganModel peminjamanRuangan) {
    _peminjamanRuangan = peminjamanRuangan;
    notifyListeners();
  }

  set setPeminjamanBarang(PeminjamBarangModel peminjamanBarang) {
    _peminjamanBarang = peminjamanBarang;
    notifyListeners();
  }

  set setJurnalMengajar(DetailJurnalMengajarGuruModel detailJurnal) {
    _detailJurnalMengajar = detailJurnal;
    notifyListeners();
  }

  set setDetailPresensiSiswa(PresensiSiswaModel presensi) {
    _detailPresensiSiswa = presensi;
    notifyListeners();
  }

  clearDataSiswa() {
    _dataSiswa = SiswaModel();
  }

  Future<bool> getJenisProgramKebaikan() async {
    try {
      listJenisProgramKebaikan = await Services().getJenisProgramKebaikan();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
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

  Future<bool> getDetailPengajuanPeminjaman({String? id}) async {
    try {
      PengajuanPeminjamanModel pengajuanPeminjamanModel =
          await Services().getDetailPengajuanPeminjaman(id: id);
      _pengajuanPeminjaman = pengajuanPeminjamanModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getDetailRiwayatPeminjaman({String? id}) async {
    try {
      RiwayatPeminjamanModel riwayatPeminjamanModel =
          await Services().getDetailRiwayatPeminjam(id: id);
      _riwayatPeminjaman = riwayatPeminjamanModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getDetailRiwayatPeminjamanAdmin(
      {String? dataGuru, String? nis, String? id}) async {
    try {
      print(nis);
      print(dataGuru);
      RiwayatPeminjamanModel riwayatPeminjamanModel = await Services()
          .getDetailRiwayatPeminjamanAdmin(
              dataGuru: dataGuru, nis: nis, id: id);
      _riwayatPeminjaman = riwayatPeminjamanModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getDetailRuanganAdmin({String? id}) async {
    try {
      PeminjamRuanganModel ruanganModel =
          await Services().getDetailRuanganAdmin(id: '$id');
      _ruangan = ruanganModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getDetailBarangAdmin({String? id}) async {
    try {
      PeminjamBarangModel barangModel =
          await Services().getDetailBarangAdmin(id: '$id');
      _barang = barangModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getDetailRiwayatBarang({String? id}) async {
    try {
      RiwayatBarangModel riwayatBarangModel =
          await Services().getDetailRiwayatBarang(id: '$id');
      _riwayatBarang = riwayatBarangModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getDetailRiwayatRuangan({String? id}) async {
    try {
      RiwayatRuanganModel riwayatRuanganModel =
          await Services().getDetailRiwayatRuangan(id: '$id');
      _riwayatRuangan = riwayatRuanganModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getDetailPeminjamanBarang({String? id}) async {
    try {
      PeminjamBarangModel peminjamanBarangModel =
          await Services().getDetailPeminjamanBarang(id: '$id');
      _peminjamanBarang = peminjamanBarangModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getDetailPeminjamanRuangan({String? id}) async {
    try {
      PeminjamRuanganModel peminjamanRuanganModel =
          await Services().getDetailPeminjamanRuangan(id: '$id');
      _peminjamanRuangan = peminjamanRuanganModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getDetailJurnalMengajarGuru({String? id}) async {
    try {
      DetailJurnalMengajarGuruModel jurnalMengajarguru =
          await Services().getDetailJurnalMengajarGuru(id: '$id');
      _detailJurnalMengajar = jurnalMengajarguru;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> isiJurnal(
      {required String id,
      required String pertemuan,
      required String deskripsi,
      filepath}) async {
    try {
      await Services().isiJurnal(
          id: id,
          pertemuan: pertemuan,
          deskripsi: deskripsi,
          filepath: filepath);
      return true;
    } catch (e) {
      print(e);
      errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> getDetailPresensiSiswa({String? id}) async {
    try {
      PresensiSiswaModel presensiSiswaModel =
          await Services().getDetailPresensiSiswa(id: '$id');
      _detailPresensiSiswa = presensiSiswaModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> presensiSiswa({
    required String id,
    required String keterangan,
    required String nis,
  }) async {
    try {
      print('cok');
      await Services().presensiSiswa(id: id, keterangan: keterangan, nis: nis);
      return true;
    } catch (e) {
      print(e);
      errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  // NOTE: Untuk mendapatkan list dari katalog yang user ambil

  // ? mengecek apakah buku sudah dipinjam oleh user yang sama
  bookExist(ListBukuModel buku) {
    // -1 menandakan bahwa data sudah ada dan tidak dapat dimasukkan kembali
    if (_listKatalog.indexWhere((element) => element.id == buku.id) == -1) {
      return false;
    } else {
      return true;
    }
  }

  // ? menambah barang kedalam list
  addBooks({required ListBukuModel buku}) {
    if (bookExist(buku)) {
      print('${buku.jUDUL} wes masuk');
    } else {
      print(buku.jUDUL);
      _listKatalog.add(buku);
      _idBuku.add(buku.id.toString());
    }
    notifyListeners();
  }

  deleteBooks({required int id}) {
    print(id);
    if (_listKatalog.length <= 1 && _listKatalog.isNotEmpty) {
      _listKatalog.removeAt(0);
      _idBuku.removeAt(0);
      print('object');
    } else {
      _listKatalog.removeAt(id);
      _idBuku.removeAt(id);
      print('masuk');
    }
    notifyListeners();
  }

  // ? mengecek apakah buku sudah dipinjam oleh user yang sama
  barangExist(KatalogBarangModel barang) {
    // -1 menandakan bahwa data sudah ada dan tidak dapat dimasukkan kembali
    if (_barangChart.indexWhere((element) => element.iD == barang.iD) == -1) {
      return false;
    } else {
      return true;
    }
  }

  // ? menambah buku kedalam list
  addBarang({required KatalogBarangModel barang}) {
    if (barangExist(barang)) {
      print('${barang.nAMA} wes masuk');
    } else {
      print(barang.nAMA);
      _barangChart.add(barang);
      _idBarang.add(barang.iD.toString());
    }
    notifyListeners();
  }

  deleteBarang({required int id}) {
    print(id);
    if (_barangChart.length <= 1 && _barangChart.isNotEmpty) {
      _barangChart.removeAt(0);
      _idBarang.removeAt(0);
      print('object');
    } else {
      _barangChart.removeAt(id);
      _idBarang.removeAt(id);
      print('masuk');
    }
    notifyListeners();
  }

  // ? mengecek apakah buku sudah dipinjam oleh user yang sama
  ruangExist(KatalogRuanganModel? ruang) {
    // -1 menandakan bahwa data sudah ada dan tidak dapat dimasukkan kembali
    if (_idRuang == ruang!.iD.toString()) {
      return false;
    } else {
      return true;
    }
  }

  // ? menambah buku kedalam list
  addRuang({required KatalogRuanganModel? ruang}) {
    if (ruangExist(ruang)) {
      print('${ruang!.nAMA} wes masuk');
      _ruangChart = ruang;
      _idRuang = ruang.iD.toString();
    } else {
      print(ruang!.nAMA);
      _ruangChart = ruang;
      _idRuang = ruang.iD.toString();
    }
    notifyListeners();
  }

  deleteRuang({required int id}) {
    print(id);
    _ruangChart = null;
    _idRuang = '';
    print('masuk');
    notifyListeners();
  }
}
