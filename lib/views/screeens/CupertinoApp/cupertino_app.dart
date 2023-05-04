import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/providers/switch_controllers.dart';
import '../../Components/add_component.dart';
import '../../Components/calls_component.dart';
import '../../Components/chat_component.dart';
import '../../Components/settings_component.dart';

class cupertinoApp extends StatefulWidget {
  const cupertinoApp({Key? key}) : super(key: key);

  @override
  State<cupertinoApp> createState() => _cupertinoAppState();
}

class _cupertinoAppState extends State<cupertinoApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_add,),label: "PERSON"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2,),label: "CHATS"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone,),label: "CALLS"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings,),label: "SETTINGS"),
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text("Flutter App"),
                trailing: CupertinoSwitch(
                  value: (Provider.of<AppProvider>(context).appModal.switchVal),
                  onChanged: (val) {
                    Provider.of<AppProvider>(context, listen: false).changeApp();
                  },
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    IndexedStack(
                      index: i,
                      children: [
                        AddComponent(),
                        ChatComponent(),
                        CallsComponent(),
                        SettingsComponent(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}


