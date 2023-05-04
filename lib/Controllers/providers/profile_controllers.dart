import 'package:image_picker/image_picker.dart';
import 'package:new_program/modals/profile_modals.dart';
import 'package:flutter/material.dart';
import 'package:new_program/modals/variable_modals.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileModal profileModal;

  ProfileProvider({required this.profileModal});

  void openProfile() async {
    profileModal.profileVal = !profileModal.profileVal;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('profileVal', profileModal.profileVal);

    notifyListeners();
  }

  pickImage() async {
    ImagePicker pick = ImagePicker();
    XFile? img = await pick.pickImage(source: ImageSource.camera);

    profileModal.userImage = File(img!.path);
    notifyListeners();
  }

  saveDetails() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userImage', profileModal.userImage.path);
    prefs.setString('userName', profileModal.userName.text);
    prefs.setString('userBio', profileModal.userBio.text);

    notifyListeners();
  }

  clearDetails() async {
    profileModal.userName.clear();
    profileModal.userBio.clear();
    profileModal.userImage = File('');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userImage', profileModal.userImage.path);
    prefs.setString('userName', profileModal.userName.text);
    prefs.setString('userBio', profileModal.userBio.text);

    notifyListeners();
  }

}

