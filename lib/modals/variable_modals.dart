import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddChatModel {
  List<String> fullName;
  List<String> phoneNumber;
  List<String> chatConversation;
  List<String> image;
  File? img;

  AddChatModel({
    required this.image,
    required this.fullName,
    required this.phoneNumber,
    required this.chatConversation,
    this.img,
  });
}


class Variables {
  static TextEditingController name = TextEditingController();
  static TextEditingController phone = TextEditingController();
  static TextEditingController chat = TextEditingController();
}


