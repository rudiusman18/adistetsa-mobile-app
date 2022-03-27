import 'dart:convert';

import 'package:adistetsa/models/daftaranggotaekskul_model.dart';
import 'package:adistetsa/models/detailjurnalmengajarguru_model.dart';
import 'package:adistetsa/models/jadwalekskul_model.dart';
import 'package:adistetsa/models/jadwalmengajarguru_model.dart';
import 'package:adistetsa/models/jurnalpertemuanekskul_model.dart';
import 'package:adistetsa/models/katalogekskul_model.dart';
import 'package:adistetsa/models/konselor_model.dart';
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
import 'package:adistetsa/models/pengajuanekskul_model.dart';
import 'package:adistetsa/models/pengajuanpeminjaman_model.dart';
import 'package:adistetsa/models/presensisiswa_model.dart';
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

  //NOTE: Mendapatkan Role User
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

  //NOTE: Mendapatkan Profile User
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
      } else if (role == 'Staf BK') {
        GuruModel stafBK = GuruModel.fromJson(data);
        return stafBK;
      } else if (role == 'Staf Humas') {
        GuruModel stafHumas = GuruModel.fromJson(data);
        return stafHumas;
      } else {
        throw Exception('Gagal Mendapatkan Data');
      }
    }
  }

  //NOTE: Mendapatkan Kompetensi Guru
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
      throw Exception('Gagal Mendapatkan Kompetensi Guru');
    }
  }

  //NOTE: Mendapatkan Katalog Buku
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

  //NOTE: Mendapatkan detail setiap katalog buku
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
      throw Exception('Gagal Mendapatkan Detail Katalog Buku');
    }
  }

  //NOTE: Mendapatkan list buku
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

  //NOTE: Mendapatkan pengajuan peminjaman sesuai role
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
      throw Exception('Gagal Mendapatkan list Pengajuan Peminjaman');
    }
  }

  //NOTE: Mendapatkan detail setiap pengajuan peminjaman sesuai role
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
      throw Exception('Gagal Mendapatkan Detail Pengajuan Peminjaman');
    }
  }

  //NOTE: Mendapatkan pengajuan peminjaman siswa untuk admin/staf perpustakaan
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
      throw Exception('Gagal Mendapatkan Pengajuan Peminjaman Siswa');
    }
  }

  //NOTE: Mendapatkan pengajuan peminjaman guru untuk admin/staf perpustakaan
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
      throw Exception('Gagal Mendapatkan Pengajuan Peminjaman Guru');
    }
  }

  //NOTE: Mendapatkan riwayat pinjaman sesuai dengan role
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
      throw Exception('Gagal Mendapatkan Riwayat Peminjaman');
    }
  }

  //NOTE: Menggabungkan 2 tipe list yang berdeba agar dapat dipanggil menjadi 1 (Concate)
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

  //NOTE: Memanggil 2 list yang sudah digabung untuk Future Builder
  List<RiwayatPeminjamanModel> _getRiwayat(http.Response response) {
    return [
      if (response.statusCode == 200)
        for (var i in json.decode(response.body)['results'])
          RiwayatPeminjamanModel.fromJson(i),
    ];
  }

  //NOTE: Mendapatkan detail riwayat peminjam per user
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

  //NOTE: User Melakukan pengajuan peminjaman buku
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

  //NOTE: Admin menerima pengajuan peminjaman
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

  //NOTE: Admin menolak pengajuan peminjaman
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

  //NOTE: Mendapatkan riwayat peminjaman untuk admin
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

  //NOTE: Mendapatkan data siswa pada kesiswaan
  getDataSiswaKesiswaan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/daftar_siswa');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<SiswaModel> dataSiswaKesiswaan =
          data.map((item) => SiswaModel.fromJson(item)).toList();
      return dataSiswaKesiswaan;
    } else {
      throw Exception('Gagal Mendapatkan Data Siswa');
    }
  }

  //NOTE: Mendapatkan list data pelanggaran
  getJenisPelanggaran() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/data_pelanggaran');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<JenisPelanggaranModel> jenisPelanggaranModel =
          data.map((item) => JenisPelanggaranModel.fromJson(item)).toList();
      return jenisPelanggaranModel;
    } else {
      throw Exception('Gagal Mendapatkan List Jenis Pelanggaran');
    }
  }

  //NOTE: Melakukan laporan pelanggaran
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

  //NOTE: Mendapatkan list jenis program kebaikan
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

  //NOTE: Mengirimkan program kebaikan
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

  //NOTE: Mendapatkan list pelanggaran diri sendiri
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

  //NOTE: Mendapatkan list laporan program kebaikan
  getLaporaKebaikan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/riwayat_program_kebaikan');
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

  //NOTE: Mendapatkan list katalog barang
  getKatalogBarang({String? urlSearch}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/katalog_sarana?search=$urlSearch');
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

  //NOTE: Mendapatkan list katalog ruangan
  getKatalogRuangan({String? urlSearch}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/katalog_ruangan?search=$urlSearch');
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

  //NOTE: Mendapatkan list pengajuan peminjaman ruangan untuk admin/staf
  getRuanganAdmin({String? urlSearch}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse(
        '$baseUrl/sarpras/pengajuan_peminjaman_ruangan_admin?search=$urlSearch');
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

  //NOTE: Mendapatkan detail pengajuan peminjaman ruangan untuk admin/staf
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
      throw Exception('Gagal Mendapatkan Detail Ruangan Admin');
    }
  }

  //NOTE: Menerima pengajuan ruangan
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

  //NOTE: Menolak pengajuan ruangan
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

  //NOTE: Mendapatkan list pengajuan peminjaman barang untuk admin/staf
  getBarangAdmin({String? urlSearch}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse(
        '$baseUrl/sarpras/pengajuan_peminjaman_barang_admin?search=$urlSearch');
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

  //NOTE: Mendapatkan detail pengajuan peminjaman barang untuk admin/staf
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
      throw Exception('Gagal Mendapatkan Detail Barang Admin');
    }
  }

  //NOTE: Menerima pengajuan barang
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

  //NOTE: Menolak pengajuan barang
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

  //NOTE: Melakukan pengajuan peminjaman barang
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

  //NOTE: Melakukan pengajuan peminjaman ruangan
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

  //NOTE: Mendapatkan riwayat pengajuan peminjaman ruangan
  getRiwayatRuangan({String? urlSearch}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse(
        '$baseUrl/sarpras/riwayat_peminjaman_ruangan?search=$urlSearch');
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

  //NOTE: Mendapatkan detail riwayat pengajuan peminjaman ruangan
  getDetailRiwayatRuangan({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/sarpras/riwayat_peminjaman_ruangan/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      RiwayatRuanganModel ruangan = RiwayatRuanganModel.fromJson(data);
      return ruangan;
    } else {
      throw Exception(response.body);
    }
  }

  //NOTE: Mendapatkan riwayat pengajuan peminjaman barang
  getRiwayatBarang({String? urlSearch}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse(
        '$baseUrl/sarpras/riwayat_peminjaman_barang?search=$urlSearch');
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

  //NOTE: Mendapatkan detail riwayat pengajuan peminjaman barang
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

  //NOTE: Mendapatkan pengajuan peminjaman barang
  getPeminjamanBarang({String? urlSearch}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse(
        '$baseUrl/sarpras/pengajuan_peminjaman_barang?search=$urlSearch');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PeminjamBarangModel> barang =
          data.map((item) => PeminjamBarangModel.fromJson(item)).toList();
      return barang;
    } else {
      throw Exception('Gagal Mendapatkan Barang');
    }
  }

  //NOTE: Mendapatkan detail pengajuan peminjaman barang
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
      throw Exception('Gagal Mendapatkan Detail Barang');
    }
  }

  //NOTE: Mendapatkan pengajuan peminjaman ruangan
  getPeminjamanRuangan({String? urlSearch}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse(
        '$baseUrl/sarpras/pengajuan_peminjaman_ruangan?search=$urlSearch');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PeminjamRuanganModel> barang =
          data.map((item) => PeminjamRuanganModel.fromJson(item)).toList();
      return barang;
    } else {
      throw Exception('Gagal Mendapatkan Ruangan');
    }
  }

  //NOTE: Mendapatkan detail pengajuan peminjaman ruangan
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
      throw Exception('Gagal Mendapatkan Detail Ruangan');
    }
  }

  //NOTE: Mendapatkan jadwal mengajar guru
  getJadwalMengajarGuru(
      {String? search, String? filterTahunAjaran, String? filterKelas}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse(
        '$baseUrl/kurikulum/jadwal_mengajar_guru?search=$search&$filterTahunAjaran');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<JadwalMengajarGuruModel> jadwalMengajarGuru =
          data.map((item) => JadwalMengajarGuruModel.fromJson(item)).toList();
      return jadwalMengajarGuru;
    } else {
      throw Exception('Gagal Mendapatkan Barang Admin');
    }
  }

  //NOTE: Mendapatkan jurnal belajar dan mengajar guru
  getJurnalBelajarMengajarGuru(
      {String? search, String? filterTahunAjaran, String? filterHari}) async {
    print(filterTahunAjaran);
    print(filterHari);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse(
        '$baseUrl/kurikulum/jurnal_belajar_mengajar?search=$search&$filterTahunAjaran');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<JadwalMengajarGuruModel> jadwalMengajarGuru =
          data.map((item) => JadwalMengajarGuruModel.fromJson(item)).toList();
      return jadwalMengajarGuru;
    } else {
      throw Exception('Gagal Mendapatkan Barang Admin');
    }
  }

  //NOTE: Mendapatkan detail jurnal belajar dan mengajar guru
  getDetailJurnalMengajarGuru({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kurikulum/jurnal_belajar_pertemuan/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<DetailJurnalMengajarGuruModel> jurnal = data
          .map((item) => DetailJurnalMengajarGuruModel.fromJson(item))
          .toList();
      return jurnal;
    } else {
      throw Exception(response.body);
    }
  }

  //NOTE: Melakukan pengisian jurnal belajar dan mengajar guru
  isiJurnal(
      {required String id,
      required String pertemuan,
      required String deskripsi,
      filepath}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kurikulum/jurnal_belajar_pertemuan/$id');
    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = token;
    request.fields['PERTEMUAN'] = pertemuan;
    request.fields['DESKRIPSI_MATERI'] = deskripsi;
    request.files
        .add(await http.MultipartFile.fromPath('FILE_DOKUMENTASI', filepath));
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    print(res.statusCode);
    print(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else if (res.statusCode == 400) {
      throw Exception(jsonDecode(res.body));
    } else {
      return false;
    }
  }

  //NOTE: Mendapatkan data siswa sesuai presensi
  getPresensiSiswa({String? id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kurikulum/presensi_siswa/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PresensiSiswaModel> presensiSiswa =
          data.map((item) => PresensiSiswaModel.fromJson(item)).toList();
      return presensiSiswa;
    } else {
      throw Exception('Gagal Mendapatkan Barang Admin');
    }
  }

  //NOTE: Mendapatkan detail data siswa sesuai presensi
  getDetailPresensiSiswa({String? id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kurikulum/detail_presensi_siswa/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      PresensiSiswaModel presensiSiswa = PresensiSiswaModel.fromJson(data);
      return presensiSiswa;
    } else {
      throw Exception('Gagal Mendapatkan Barang Admin');
    }
  }

  //NOTE: Melakukan presensi siswa
  presensiSiswa(
      {required String id,
      required String keterangan,
      required String nis}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kurikulum/detail_presensi_siswa/$id');
    var headers = {"Accept": "application/json", "authorization": token};
    var body = {'KETERANGAN': keterangan, 'NIS': nis};
    var response = await http.patch(url, headers: headers, body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(response.body);
    }
  }

  //NOTE: Mendapatkan list tahun ajaran filter
  getTahunAjaranFilter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kurikulum/tahun_ajaran');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var jenisProgramKebaikan = jsonDecode(response.body);
      return jenisProgramKebaikan['results'];
    } else {
      print('GAGAL');
    }
  }

  //NOTE: Mendapatkan pengajuan ekskul
  getPengajuanEkskul({String? urlSerach}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url =
        Uri.parse('$baseUrl/kesiswaan/pengajuan_ekskul?search=$urlSerach');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PengajuanEkskulModel> pengajuanEkskul =
          data.map((item) => PengajuanEkskulModel.fromJson(item)).toList();
      return pengajuanEkskul;
    } else {
      throw Exception(response.body);
    }
  }

  //NOTE: Mendapatkan detail pengajuan ekskul
  getDetailPengajuanEkskul({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/pengajuan_ekskul/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      PengajuanEkskulModel pengajuanEkskul =
          PengajuanEkskulModel.fromJson(data);
      return pengajuanEkskul;
    } else {
      throw Exception('Gagal Mendapatkan Detail Pengajuan Ekskul');
    }
  }

  //NOTE: Menerima pengajuan ekskul
  terimaPengajuanEkskul({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/acc_pengajuan_ekskul/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Menerima Ekskul');
    }
  }

  //NOTE: Menolak pengajuan ekskul
  tolakPengajuanEkskul({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/pengajuan_ekskul/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.delete(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 204) {
      return true;
    } else {
      throw Exception('Gagal Menolak Ekskul');
    }
  }

  //NOTE: Mendapatkan jadwal ekskul
  getJadwalEkskul({String filter = ''}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/jadwal_ekskul$filter');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<JadwalEkskulModel> jadwalEkskulModel =
          data.map((item) => JadwalEkskulModel.fromJson(item)).toList();
      return jadwalEkskulModel;
    } else {
      throw Exception('Gagal Mendapatkan Jadwal Admin');
    }
  }

  //NOTE: Mendapatkan daftar anggota ekskul
  getDaftarAnggotaEkskul({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/daftar_anggota/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<DaftarAnggotaEkskulModel> daftarAnggota =
          data.map((item) => DaftarAnggotaEkskulModel.fromJson(item)).toList();
      return daftarAnggota;
    } else {
      throw Exception(response.body);
    }
  }

  //NOTE: Mendapatkan detail setiap anggota ekskul
  getDetailAnggotaEkskul({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/detail_anggota/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      DaftarAnggotaEkskulModel daftarAnggota =
          DaftarAnggotaEkskulModel.fromJson(data);
      return daftarAnggota;
    } else {
      throw Exception('Gagal Mendapatkan Detail Pengajuan Ekskul');
    }
  }

  //NOTE: Menerima daftar anggota ekskul
  terimaDaftarAnggota({required String id, required String status}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/detail_anggota/$id');
    var headers = {"Accept": "application/json", "authorization": token};
    var body = {'STATUS': status};
    var response = await http.patch(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(response.body);
    }
  }

  //NOTE: Mendapatkan jurnal pertemuan ekskul
  getJurnalEkskulPertemuan({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/jurnal_ekskul_pertemuan/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<JurnalEkskulPertemuanModel> jurnalEkskul = data
          .map((item) => JurnalEkskulPertemuanModel.fromJson(item))
          .toList();
      return jurnalEkskul;
    } else {
      throw Exception(response.body);
    }
  }

  //NOTE: Mendapatkan daftar siswa sesuai dengan presensi ekskul
  getPresensiSiswaEkskul({String? id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/presensi_ekskul/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PresensiSiswaModel> presensiSiswa =
          data.map((item) => PresensiSiswaModel.fromJson(item)).toList();
      return presensiSiswa;
    } else {
      throw Exception('Gagal Mendapatkan Barang Admin');
    }
  }

  //NOTE: Mendapatkan detail setiap siswa sesuai dengan presensi ekskul
  getDetailPresensiSiswaEkskul({String? id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/detail_presensi_ekskul/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      PresensiSiswaModel presensiSiswa = PresensiSiswaModel.fromJson(data);
      return presensiSiswa;
    } else {
      throw Exception('Gagal Mendapatkan Barang Admin');
    }
  }

  //NOTE: Melakukan presesnsi siswa ekskul
  presensiSiswaEkskul(
      {required String id,
      required String keterangan,
      required String nis}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    print(nis);
    print(id);
    var url = Uri.parse('$baseUrl/kesiswaan/detail_presensi_ekskul/$id');
    var headers = {"Accept": "application/json", "authorization": token};
    var body = {'KETERANGAN': keterangan, 'NIS': nis};
    var response = await http.patch(url, headers: headers, body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(response.body);
    }
  }

  //NOTE: Melakukan pengisian jurnal ekskul
  isiJurnalEkskul(
      {required String id,
      required String pertemuan,
      required String deskripsi,
      required String tanggalMelatih,
      filepath}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/isi_jurnal_ekskul/$id');
    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = token;
    request.fields['PERTEMUAN'] = pertemuan;
    request.fields['DESKRIPSI_KEGIATAN'] = deskripsi;
    request.fields['TANGGAL_MELATIH'] = tanggalMelatih;
    request.files
        .add(await http.MultipartFile.fromPath('FILE_DOKUMENTASI', filepath));
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    print(res.statusCode);
    print(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else if (res.statusCode == 400) {
      throw Exception(jsonDecode(res.body));
    } else {
      return false;
    }
  }

  //NOTE: Mendapatkan katalog ekskul
  getKatalogEkskul({String? urlSearch}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/katalog_ekskul?search=$urlSearch');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<KatalogEkskulModel> katalogEkskul =
          data.map((item) => KatalogEkskulModel.fromJson(item)).toList();
      return katalogEkskul;
    } else {
      throw Exception('Gagal Mendapatkan Katalog Ekskul');
    }
  }

  //NOTE: Mendapatkan detail katalog ekskul
  getDetailKatalogEkskul({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/katalog_ekskul/$id');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      KatalogEkskulModel katalogEkskul = KatalogEkskulModel.fromJson(data);
      return katalogEkskul;
    } else {
      throw Exception('Gagal Mendapatkan Katalog Ekskul');
    }
  }

  //NOTE: Melakukan daftar ekstrakurikuler
  daftarEkstrakurikuler(
      {required String id, required String tanggalPengajuan}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/ajukan_ekskul/$id');
    var headers = {"Accept": "application/json", "authorization": token};
    var body = {'TANGGAL_PENGAJUAN': tanggalPengajuan};
    var response = await http.post(url, headers: headers, body: body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception(response.body);
    }
  }

  //NOTE: Mendapatkan ekskul masing-masing user
  getEkskulSaya() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url = Uri.parse('$baseUrl/kesiswaan/ekskul_saya');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<KatalogEkskulModel> katalogEkskul =
          data.map((item) => KatalogEkskulModel.fromJson(item)).toList();
      return katalogEkskul;
    } else {
      throw Exception('Gagal Mendapatkan Katalog Ekskul');
    }
  }

  // NOTE: Digunakan untuk mengambil list daftar konselor di fitur BK
  getKonselorBK({String? search}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var url =
        Uri.parse('$baseUrl/bimbingan_konseling/katalog_konselor?$search');
    var headers = {"Content-type": "application/json", "authorization": token};
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<KonselorModel> konselorModel =
          data.map((item) => KonselorModel.fromJson(item)).toList();
      return konselorModel;
    } else {
      throw Exception('Gagal Mendapatkan data Konselor');
    }
  }
}
