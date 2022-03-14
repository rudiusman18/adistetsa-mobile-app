import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  String baseUrl = 'https://adistetsa.pythonanywhere.com';

  Future login({
    String? username,
    String? password,
  }) async {
    print(username);
    print(password);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('$baseUrl/login/');
    var body = jsonEncode({'username': username, 'password': password});
    var headers = {'Content-Type': 'application/json'};
    var response = await http.post(url, headers: headers, body: body);

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      prefs.setString('token', 'Bearer ' + data['access']);
      return true;
    } else {
      return false;
    }
  }
}
