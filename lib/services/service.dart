import 'dart:convert';

import 'package:adistetsa/models/guru_model.dart';
import 'package:adistetsa/models/karyawan_model.dart';
import 'package:adistetsa/models/katalogbuku_model.dart';
import 'package:adistetsa/models/kompetensi_model.dart';
import 'package:adistetsa/models/list_buku_model.dart';
import 'package:adistetsa/models/pengajuanpeminjaman_model.dart';
import 'package:adistetsa/models/riwayatpeminjaman_model.dart';
import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/models/siswa_model.dart';
import 'package:flutter/cupertino.dart';
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

  getDetailPengajuanPeminjaman({String? id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token").toString();
    var role = prefs.getString("role").toString();
    var url;
    if (role == 'Siswa') {
      url = Uri.parse('$baseUrl/perpustakaan/pengajuan_peminjaman_siswa/$id');
    } else if (role == 'Guru') {
      url = Uri.parse('$baseUrl/perpustakaan/pengajuan_peminjaman_guru/$id');
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
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    }
  }
}
