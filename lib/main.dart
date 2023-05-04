import 'dart:io';
import 'package:new_program/Controllers/providers/profile_controllers.dart';
import 'package:new_program/Controllers/providers/switch_controllers.dart';
import 'package:new_program/modals/profile_modals.dart';
import 'package:new_program/modals/switch_modals.dart';
import 'package:new_program/modals/theme_modals.dart';
import 'package:new_program/utils/theme.dart';
import 'package:new_program/views/screeens/CupertinoApp/cupertino_app.dart';
import 'package:new_program/views/screeens/MaterialApp/material_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Controllers/providers/theme_controllers.dart';
import 'Controllers/providers/variable_controllers.dart';
import 'modals/variable_modals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool SwitchVal = prefs.getBool('SwitchVal') ?? false;
  bool isdark = prefs.getBool('isdark') ?? false;
  bool profileSwitch = prefs.getBool('profileSwitch') ?? false;

  String userImage = prefs.getString('userImage') ?? '';
  String userName = prefs.getString('userName') ?? '';
  String userBio = prefs.getString('userBio') ?? '';

  List<String> image = prefs.getStringList('image') ?? [];
  List<String> fullName = prefs.getStringList('fullName') ?? [];
  List<String> phoneNumber = prefs.getStringList('phoneNumber') ?? [];
  List<String> chatConversation = prefs.getStringList('chatConversation') ?? [];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(
            appModal: AppModal(
              switchVal: SwitchVal,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => themeProvider(
            thememodel: themeModel(
              isDark: isdark,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(
            profileModal: ProfileModal(
              profileVal: profileSwitch,
              userImage: File(userImage),
              userName: TextEditingController(text: userName),
              userBio: TextEditingController(text: userBio),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AddChatProvider(
            Variable: AddChatModel(
              fullName: fullName,
              phoneNumber: phoneNumber,
              chatConversation: chatConversation,
              image: image,
            ),
          ),
        ),
      ],
      builder: (context, _) {
        return (Provider.of<AppProvider>(context).appModal.switchVal == false)
            ? MaterialApp(
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                themeMode:
                    (Provider.of<themeProvider>(context).thememodel.isDark ==
                            false)
                        ? ThemeMode.light
                        : ThemeMode.dark,
                debugShowCheckedModeBanner: false,
                routes: {
                  '/': (context) => materialApp(),
                },
              )
            : CupertinoApp(
                theme: CupertinoThemeData(
                  brightness:
                      (Provider.of<themeProvider>(context).thememodel.isDark ==
                              false)
                          ? Brightness.light
                          : Brightness.dark,
                ),
                debugShowCheckedModeBanner: false,
                routes: {
                  '/': (context) => cupertinoApp(),
                },
              );
      },
    ),
  );
}
