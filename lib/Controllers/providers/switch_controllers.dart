import 'package:new_program/modals/switch_modals.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  AppModal appModal;

  AppProvider({required this.appModal});

  void changeApp() async {

    appModal.switchVal = !appModal.switchVal;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('SwitchVal', appModal.switchVal);

    notifyListeners();
  }
}

