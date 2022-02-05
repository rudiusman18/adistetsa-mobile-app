import 'package:adistetsa/models/role_model.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  late RolesModel _role;

  RolesModel get role => _role;

  set roles(RolesModel role) {
    _role = role;
    notifyListeners();
  }
}
