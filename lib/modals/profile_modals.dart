import 'dart:io';
import 'package:flutter/cupertino.dart';

class ProfileModal {
  bool profileVal;
  File userImage;
  TextEditingController userName;
  TextEditingController userBio;

  ProfileModal({
    required this.profileVal,
    required this.userImage,
    required this.userName,
    required this.userBio,
  });
}

