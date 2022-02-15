import 'dart:convert';

import 'package:adistetsa/models/guru_model.dart';
import 'package:adistetsa/models/katalogbuku_model.dart';
import 'package:adistetsa/models/kompetensi_model.dart';
import 'package:adistetsa/models/role_model.dart';
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
        GuruModel guruModel = GuruModel.fromJson(data);
        return guruModel;
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

  getKatalogBuku() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('$baseUrl/perpustakaan/katalog_buku');
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
}
