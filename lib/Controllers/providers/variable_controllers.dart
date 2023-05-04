import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_program/modals/variable_modals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddChatProvider extends ChangeNotifier {
  AddChatModel Variable;

  AddChatProvider({required this.Variable});

  pickImage() async {
    ImagePicker pick = ImagePicker();
    XFile? img = await pick.pickImage(source: ImageSource.camera);

    Variable.img = File(img!.path);
    notifyListeners();
  }

  saveChat() async {
    Variable.image.add(Variable.img!.path);
    Variable.fullName.add(Variables.name.text);
    Variable.phoneNumber.add(Variables.phone.text);
    Variable.chatConversation.add(Variables.chat.text);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList('image', Variable.image);
    prefs.setStringList('fullName', Variable.fullName);
    prefs.setStringList('phoneNumber', Variable.phoneNumber);
    prefs.setStringList('chatConversation', Variable.chatConversation);

    Variable.img = null;
    Variables.name.clear();
    Variables.phone.clear();
    Variables.chat.clear();

    notifyListeners();
  }
}
