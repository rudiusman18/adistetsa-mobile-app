import 'dart:convert';

import 'package:adistetsa/models/peminjambarang_model.dart';
import 'package:adistetsa/models/guru_model.dart';
import 'package:adistetsa/models/jenispelanggaran_model.dart';
import 'package:adistetsa/models/karyawan_model.dart';
import 'package:adistetsa/models/katalogbarang_model.dart';
import 'package:adistetsa/models/katalogbuku_model.dart';
import 'package:adistetsa/models/katalogruangan_model.dart';
import 'package:adistetsa/models/kompetensi_model.dart';
import 'package:adistetsa/models/laporankebaikan_model.dart';
import 'package:adistetsa/models/list_buku_model.dart';
import 'package:adistetsa/models/pelangaran_model.dart';
import 'package:adistetsa/models/pengajuanpeminjaman_model.dart';
import 'package:adistetsa/models/riwayatbarang_model.dart';
import 'package:adistetsa/models/riwayatpeminjaman_model.dart';
import 'package:adistetsa/models/riwayatruangan_model.dart';
import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/models/peminjamruangan_model.dart';
import 'package:adistetsa/models/siswa_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Services extends ChangeNotifier {
  String baseUrl = 'https://adistetsa.pythonanywhere.com';

  getRoles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('$baseUrl/daftar_role');
    var token = prefs.getString("token").toString();
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<RolesModel> roles =
          data.map((item) => RolesModel.fromJson(item)).toList();
      return roles;
    } else {
      throw Exception('Gagal Mendapatkan roles');
    }
  }

  getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('$baseUrl/profile');
    var token = prefs.getString("token").toString();
    var role = prefs.getString('role');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (role == 'Guru') {
        GuruModel guruModel = GuruModel.fromJson(data);
        return guruModel;
      } else if (role == 'Staf Perpustakaan') {
        GuruModel stafPerpustakaan = GuruModel.fromJson(data);
        return stafPerpustakaan;
      } else if (role == 'Staf Sarpras') {
        GuruModel stafSarpras = GuruModel.fromJson(data);
        return stafSarpras;
      } else if (role == 'Karyawan') {
        KaryawanModel karyawanModel = KaryawanModel.fromJson(data);
        return karyawanModel;
      } else if (role == 'Siswa') {
        SiswaModel siswaModel = SiswaModel.fromJson(data);
        return siswaModel;
      } else {
        throw Exception('Gagal Mendapatkan Data');
      }
    }
  }

  getKompetensiGuru() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('$baseUrl/data_guru_kompetensi');
    var token = prefs.getString("token").toString();
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<KompetensiModel> roles =
          data.map((item) => KompetensiModel.fromJson(item)).toList();
      return roles;
    } else {
      throw Exception('Gagal Login');
    }
  }

  getKatalogBuku({String? search}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('$baseUrl/perpustakaan/katalog_buku?$search');
    var token = prefs.getString("token").toString();
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<KatalogBukuModel> katalogBuku =
          data.map((item) => KatalogBukuModel.fromJson(item)).toList();
      return katalogBuku;
    } else {
      throw Exception('Gagal Mendapatkan Katalog Buku');
    }
  }

  getDetailKatalogBuku({String? register}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('$baseUrl/perpustakaan/katalog_buku/$register');
    var token = prefs.getString("token").toString();
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      KatalogBukuModel detailKatalogBukuModel = KatalogBukuModel.fromJson(data);
      return detailKatalogBukuModel;
    } else {
      throw Exception('Gagal Mendapatkan Katalog Buku');
    }
  }

  getListBuku({String? search}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('$baseUrl/perpustakaan/katalog_buku_tersedia?$search');
    var token = prefs.getString("token").toString();
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<ListBukuModel> katalogBuku =
          data.map((item) => ListBukuModel.fromJson(item)).toList();
      return katalogBuku;
    } else {
      throw Exception('Gagal Mendapatkan list Buku');
    }
  }

  getPengajuanPeminjaman({String? search}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var role = prefs.getString("role").toString();
    var url;
    if (role == 'Siswa') {
      url = Uri.parse('$baseUrl/perpustakaan/pengajuan_peminjaman_siswa');
    } else if (role == 'Guru') {
      url = Uri.parse('$baseUrl/perpustakaan/pengajuan_peminjaman_guru');
    } else if (role == 'Staf Perpustakaan') {
      url = Uri.parse('$baseUrl/perpustakaan/pengajuan_peminjaman_guru_admin');
    }
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PengajuanPeminjamanModel> pengajuaPeminjaman =
          data.map((item) => PengajuanPeminjamanModel.fromJson(item)).toList();
      return pengajuaPeminjaman;
    } else {
      throw Exception('Gagal Mendapatkan list Buku');
    }
  }

  getDetailPengajuanPeminjaman({String? id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var role = prefs.getString("role").toString();
    var adminUser = prefs.getString("user").toString();
    var url;
    if (role == 'Siswa') {
      url = Uri.parse('$baseUrl/perpustakaan/pengajuan_peminjaman_siswa/$id');
    } else if (role == 'Guru') {
      url = Uri.parse('$baseUrl/perpustakaan/pengajuan_peminjaman_guru/$id');
    } else if (adminUser == 'Admin Siswa') {
      url = Uri.parse(
          '$baseUrl/perpustakaan/pengajuan_peminjaman_siswa_admin/$id');
    } else if (adminUser == 'Admin Guru') {
      url = Uri.parse(
          '$baseUrl/perpustakaan/pengajuan_peminjaman_guru_admin/$id');
    }
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      PengajuanPeminjamanModel pengajuanPeminjamanModel =
          PengajuanPeminjamanModel.fromJson(data);
      return pengajuanPeminjamanModel;
    } else {
      throw Exception('Gagal Mendapatkan Katalog Buku');
    }
  }

  getPengajuanPeminjamanSiswaAdmin({String? search}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url =
        Uri.parse('$baseUrl/perpustakaan/pengajuan_peminjaman_siswa_admin');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PengajuanPeminjamanModel> pengajuaPeminjaman =
          data.map((item) => PengajuanPeminjamanModel.fromJson(item)).toList();
      return pengajuaPeminjaman;
    } else {
      throw Exception('Gagal Mendapatkan list Buku');
    }
  }

  getPengajuanPeminjamanGuruAdmin({String? search}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url =
        Uri.parse('$baseUrl/perpustakaan/pengajuan_peminjaman_guru_admin');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PengajuanPeminjamanModel> pengajuaPeminjaman =
          data.map((item) => PengajuanPeminjamanModel.fromJson(item)).toList();

      return pengajuaPeminjaman;
    } else {
      throw Exception('Gagal Mendapatkan list Buku');
    }
  }

  getRiwayatPeminjaman({String? search}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var role = prefs.getString("role").toString();
    var url;
    if (role == 'Siswa') {
      url = Uri.parse('$baseUrl/perpustakaan/riwayat_peminjaman_siswa');
    } else if (role == 'Guru') {
      url = Uri.parse('$baseUrl/perpustakaan/riwayat_peminjaman_guru');
    }
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<RiwayatPeminjamanModel> riwayatPeminjam =
          data.map((item) => RiwayatPeminjamanModel.fromJson(item)).toList();
      return riwayatPeminjam;
    } else {
      throw Exception('Gagal Mendapatkan list Buku');
    }
  }

  Future<List<RiwayatPeminjamanModel>> getRiwayatPeminjamanSiswaAdmin(
      {String? search}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url1 =
        Uri.parse('$baseUrl/perpustakaan/riwayat_peminjaman_siswa_admin');
    var url2 = Uri.parse('$baseUrl/perpustakaan/riwayat_peminjaman_guru_admin');
    var headers = {"Content-type": "application/json", "authorization": token};
    var responses = await Future.wait([
      http.get(url1, headers: headers),
      http.get(url2, headers: headers),
    ]);
    return <RiwayatPeminjamanModel>[
      ..._getRiwayat(responses[0]),
      ..._getRiwayat(responses[1]),
    ];
  }

  List<RiwayatPeminjamanModel> _getRiwayat(http.Response response) {
    return [
      if (response.statusCode == 200)
        for (var i in json.decode(response.body)['results'])
          RiwayatPeminjamanModel.fromJson(i),
    ];
  }

  getDetailRiwayatPeminjam({String? id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var role = prefs.getString("role").toString();
    var url;
    if (role == 'Siswa') {
      url = Uri.parse('$baseUrl/perpustakaan/riwayat_peminjaman_siswa/$id');
    } else if (role == 'Guru') {
      url = Uri.parse('$baseUrl/perpustakaan/riwayat_peminjaman_guru/$id');
    }
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      RiwayatPeminjamanModel riwayatPeminjamanModel =
          RiwayatPeminjamanModel.fromJson(data);
      return riwayatPeminjamanModel;
    } else {
      throw Exception('Gagal Mendapatkan Katalog Buku');
    }
  }

  setPengajuanBuku(
      {required List<String> buku,
      required String tanggalPengajuan,
      required String jangkaPeminjaman,
      String? urlTtd,
      filepath}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var role = prefs.getString('role').toString();
    var token = prefs.getString("token").toString();
    var url;
    if (role == 'Siswa') {
      url = Uri.parse('$baseUrl/perpustakaan/pengajuan_peminjaman_siswa');
    } else if (role == 'Guru') {
      url = Uri.parse('$baseUrl/perpustakaan/pengajuan_peminjaman_guru');
    }
    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = token;
    request.fields['BUKU'] = buku
        .map((e) => e)
        .toList()
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '');
    request.fields['TANGGAL_PENGAJUAN'] = tanggalPengajuan.toString();
    request.fields['JANGKA_PEMINJAMAN'] = jangkaPeminjaman.toString();
    if (filepath != null) {
      request.files.add(
          await http.MultipartFile.fromPath('FILE_TTD_PENGAJUAN', filepath));
      var response = await request.send();
      final res = await http.Response.fromStream(response);
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } else {
      var response = await request.send();
      final res = await http.Response.fromStream(response);
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    }
  }

  terimaPengajuanPerpustakaan(
      {required String id, required String user}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url;
    if (user == 'Admin Siswa') {
      url =
          Uri.parse('$baseUrl/perpustakaan/acc_pengajuan_peminjaman_siswa/$id');
    } else if (user == 'Admin Guru') {
      url =
          Uri.parse('$baseUrl/perpustakaan/acc_pengajuan_peminjaman_guru/$id');
    }
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Tidak Masuk');
      return false;
    }
  }

  tolakPengajuanPerpustakaan({required String id, required String user}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url;
    if (user == 'Admin Siswa') {
      url = Uri.parse(
          '$baseUrl/perpustakaan/tolak_pengajuan_peminjaman_siswa/$id');
    } else if (user == 'Admin Guru') {
      url = Uri.parse(
          '$baseUrl/perpustakaan/tolak_pengajuan_peminjaman_guru/$id');
    }
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Tidak Masuk');
      return false;
    }
  }

  getDetailRiwayatPeminjamanAdmin(
      {String? nis, String? dataGuru, String? id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url;
    dataGuru != 'null'
        ? url =
            Uri.parse('$baseUrl/perpustakaan/riwayat_peminjaman_guru_admin/$id')
        : url = Uri.parse(
            '$baseUrl/perpustakaan/riwayat_peminjaman_siswa_admin/$id');

    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      RiwayatPeminjamanModel riwayatPeminjamanModel =
          RiwayatPeminjamanModel.fromJson(data);
      return riwayatPeminjamanModel;
    } else {
      throw Exception('Gagal Mendapatkan Katalog Buku');
    }
  }

  getDataSiswaKesiswaan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/daftar_siswa');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<SiswaModel> dataSiswaKesiswaan =
          data.map((item) => SiswaModel.fromJson(item)).toList();
      return dataSiswaKesiswaan;
    } else {
      throw Exception('Gagal Mendapatkan Data Siswa');
    }
  }

  getJenisPelanggaran() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/data_pelanggaran');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<JenisPelanggaranModel> jenisPelanggaranModel =
          data.map((item) => JenisPelanggaranModel.fromJson(item)).toList();
      return jenisPelanggaranModel;
    } else {
      throw Exception('Gagal Mendapatkan Data Siswa');
    }
  }

  laporanPelanggaran(
      {required String dataSiswa,
      required String jenisPelanggaran,
      filepath}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/pengajuan_laporan_pelanggaran');
    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = token;
    request.fields['DATA_SISWA'] = dataSiswa;
    request.fields['JENIS_PELANGGARAN'] = jenisPelanggaran;
    if (filepath != null) {
      request.files.add(
          await http.MultipartFile.fromPath('BUKTI_PELANGGARAN', filepath));
      var response = await request.send();
      final res = await http.Response.fromStream(response);
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } else {
      var response = await request.send();
      final res = await http.Response.fromStream(response);
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    }
  }

  getJenisProgramKebaikan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/data_kebaikan');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var jenisProgramKebaikan = jsonDecode(response.body);
      return jenisProgramKebaikan['results'];
    } else {
      print('GAGAL');
    }
  }

  programKebaikan({required String jenisProgramKebaikan, filepath}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/pengajuan_program_kebaikan');
    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = token;
    request.fields['JENIS_PROGRAM_KEBAIKAN'] = jenisProgramKebaikan;
    if (filepath != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'BUKTI_PROGRAM_KEBAIKAN', filepath));
      var response = await request.send();
      final res = await http.Response.fromStream(response);
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } else {
      var response = await request.send();
      final res = await http.Response.fromStream(response);
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    }
  }

  getPelanggaran() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/pelanggaran_saya');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PelanggaranModel> pelanggaranModel =
          data.map((item) => PelanggaranModel.fromJson(item)).toList();
      return pelanggaranModel;
    } else {
      throw Exception('Gagal Mendapatkan Pelanggaran');
    }
  }

  getLaporaKebaikan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/pengajuan_program_kebaikan');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<LaporanKebaikanModel> laporanKebaikan =
          data.map((item) => LaporanKebaikanModel.fromJson(item)).toList();
      return laporanKebaikan;
    } else {
      throw Exception('Gagal Mendapatkan Laporan Kebaikan');
    }
  }

  getKatalogBarang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/katalog_sarana');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<KatalogBarangModel> katalogBarang =
          data.map((item) => KatalogBarangModel.fromJson(item)).toList();
      return katalogBarang;
    } else {
      throw Exception('Gagal Mendapatkan Katalog Barang');
    }
  }

  getKatalogRuangan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/katalog_ruangan');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<KatalogRuanganModel> katalogRuangan =
          data.map((item) => KatalogRuanganModel.fromJson(item)).toList();
      return katalogRuangan;
    } else {
      throw Exception('Gagal Mendapatkan Katalog Ruangan');
    }
  }

  getRuanganAdmin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/pengajuan_peminjaman_ruangan_admin');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PeminjamRuanganModel> ruangan =
          data.map((item) => PeminjamRuanganModel.fromJson(item)).toList();
      return ruangan;
    } else {
      throw Exception('Gagal Mendapatkan Ruangan Admin');
    }
  }

  getDetailRuanganAdmin({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url =
        Uri.parse('$baseUrl/sarpras/pengajuan_peminjaman_ruangan_admin/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      PeminjamRuanganModel ruangan = PeminjamRuanganModel.fromJson(data);
      return ruangan;
    } else {
      throw Exception('Gagal Mendapatkan Ruangan Admin');
    }
  }

  terimaPengajuanRuanganSarpas({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url =
        Uri.parse('$baseUrl/sarpras/acc_pengajuan_peminjaman_ruangan/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Tidak Masuk');
      return false;
    }
  }

  tolakPengajuanRuanganSarpas({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url =
        Uri.parse('$baseUrl/sarpras/tolak_pengajuan_peminjaman_ruangan/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Tidak Masuk');
      return false;
    }
  }

  getBarangAdmin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/pengajuan_peminjaman_barang_admin');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PeminjamBarangModel> barang =
          data.map((item) => PeminjamBarangModel.fromJson(item)).toList();
      return barang;
    } else {
      throw Exception('Gagal Mendapatkan Barang Admin');
    }
  }

  getDetailBarangAdmin({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url =
        Uri.parse('$baseUrl/sarpras/pengajuan_peminjaman_barang_admin/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      PeminjamBarangModel ruangan = PeminjamBarangModel.fromJson(data);
      return ruangan;
    } else {
      throw Exception('Gagal Mendapatkan Barang Admin');
    }
  }

  terimaPengajuanBarangSarpas({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/acc_pengajuan_peminjaman_barang/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Tidak Masuk');
      return false;
    }
  }

  tolakPengajuanBarangSarpas({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url =
        Uri.parse('$baseUrl/sarpras/tolak_pengajuan_peminjaman_barang/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Tidak Masuk');
      return false;
    }
  }

  pengajuanPeminjamanBarang(
      {required String nama,
      required String noTelp,
      required List<String> barang,
      required String kegiatan,
      required String tanggal,
      required String keterangan,
      filepath}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/pengajuan_peminjaman_barang');
    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = token;
    request.fields['ALAT'] = barang
        .map((e) => e)
        .toList()
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '');
    request.fields['NAMA_PEMINJAM'] = nama;
    request.fields['NO_TELEPON'] = noTelp;
    request.fields['KEGIATAN'] = kegiatan;
    request.fields['TANGGAL_PENGGUNAAN'] = tanggal;
    request.fields['TANGGAL_PENGEMBALIAN'] = tanggal;
    request.fields['KETERANGAN'] = keterangan;
    request.files
        .add(await http.MultipartFile.fromPath('TANDA_TANGAN', filepath));
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    print(res.statusCode);
    print(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  pengajuanPeminjamanRuang(
      {required String nama,
      required String noTelp,
      required String ruang,
      required String kegiatan,
      required String tanggalPenggunaan,
      required String tanggalPengembalian,
      required String jamPenggunaan,
      required String jamBerakhir,
      required String kategori,
      required String keterangan,
      filepath}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/pengajuan_peminjaman_ruangan');
    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = token;
    request.fields['RUANGAN'] = ruang;
    request.fields['PENGGUNA'] = nama;
    request.fields['NO_HP'] = noTelp;
    request.fields['KEGIATAN'] = kegiatan;
    request.fields['TANGGAL_PEMAKAIAN'] = tanggalPenggunaan;
    if (kategori == 'Jangka Pendek') {
      request.fields['TANGGAL_BERAKHIR'] = tanggalPenggunaan;
    } else {
      request.fields['TANGGAL_BERAKHIR'] = tanggalPengembalian;
    }
    request.fields['JAM_PENGGUNAAN'] = jamPenggunaan;
    request.fields['JAM_BERAKHIR'] = jamBerakhir;
    request.fields['JENIS_PEMINJAMAN'] = kategori;
    request.fields['KETERANGAN'] = keterangan;
    request.files
        .add(await http.MultipartFile.fromPath('TANDA_TANGAN', filepath));
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else if (res.statusCode == 400) {
      throw Exception('Ruangan Sedang Dipinjam');
    } else {
      return false;
    }
  }

  getRiwayatRuangan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/riwayat_peminjaman_ruangan');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<RiwayatRuanganModel> ruangan =
          data.map((item) => RiwayatRuanganModel.fromJson(item)).toList();
      return ruangan;
    } else {
      throw Exception('Gagal Mendapatkan Ruangan Admin');
    }
  }

  getDetailRiwayatRuangan({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/riwayat_peminjaman_ruangan/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      RiwayatRuanganModel ruangan = RiwayatRuanganModel.fromJson(data);
      return ruangan;
    } else {
      throw Exception('Gagal Mendapatkan Ruangan Admin');
    }
  }

  getRiwayatBarang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/riwayat_peminjaman_barang');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<RiwayatBarangModel> barang =
          data.map((item) => RiwayatBarangModel.fromJson(item)).toList();
      return barang;
    } else {
      throw Exception('Gagal Mendapatkan Barang');
    }
  }

  getDetailRiwayatBarang({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/riwayat_peminjaman_barang/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      RiwayatBarangModel ruangan = RiwayatBarangModel.fromJson(data);
      return ruangan;
    } else {
      throw Exception('Gagal Mendapatkan Barang');
    }
  }

  getPeminjamanBarang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/pengajuan_peminjaman_barang');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PeminjamBarangModel> barang =
          data.map((item) => PeminjamBarangModel.fromJson(item)).toList();
      return barang;
    } else {
      throw Exception('Gagal Mendapatkan Barang Admin');
    }
  }

  getDetailPeminjamanBarang({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/pengajuan_peminjaman_barang/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      PeminjamBarangModel ruangan = PeminjamBarangModel.fromJson(data);
      return ruangan;
    } else {
      throw Exception('Gagal Mendapatkan Barang Admin');
    }
  }

  getPeminjamanRuangan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/pengajuan_peminjaman_ruangan');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PeminjamRuanganModel> barang =
          data.map((item) => PeminjamRuanganModel.fromJson(item)).toList();
      return barang;
    } else {
      throw Exception('Gagal Mendapatkan Barang Admin');
    }
  }

  getDetailPeminjamanRuangan({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/pengajuan_peminjaman_ruangan/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      PeminjamRuanganModel ruangan = PeminjamRuanganModel.fromJson(data);
      return ruangan;
    } else {
      throw Exception('Gagal Mendapatkan Barang Admin');
    }
  }
}
