import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_program/Controllers/providers/profile_controllers.dart';
import 'package:new_program/Controllers/providers/theme_controllers.dart';
import 'package:provider/provider.dart';
import '../../Controllers/providers/switch_controllers.dart';

class SettingsComponent extends StatefulWidget {
  const SettingsComponent({Key? key}) : super(key: key);

  @override
  State<SettingsComponent> createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<AppProvider>(context).appModal.switchVal == false)
        ? Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                  subtitle: Text("Update Profile Data"),
                  trailing: Switch(
                    value: (Provider.of<ProfileProvider>(context)
                        .profileModal
                        .profileVal),
                    onChanged: (val) {
                      Provider.of<ProfileProvider>(context, listen: false)
                          .openProfile();
                    },
                  ),
                ),
                (Provider.of<ProfileProvider>(context, listen: false)
                            .profileModal
                            .profileVal ==
                        false)
                    ? Container()
                    : Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<ProfileProvider>(context,
                                            listen: false)
                                        .pickImage();
                                  },
                                  child: CircleAvatar(
                                    radius: 60,
                                    foregroundImage: FileImage(
                                        Provider.of<ProfileProvider>(context)
                                            .profileModal
                                            .userImage),
                                    child: const Icon(
                                      Icons.add_a_photo_outlined,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: Provider.of<ProfileProvider>(context)
                                  .profileModal
                                  .userName,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Enter Your Name...",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            TextFormField(
                              controller: Provider.of<ProfileProvider>(context)
                                  .profileModal
                                  .userBio,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Enter Your Bio...",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Provider.of<ProfileProvider>(context,
                                            listen: false)
                                        .saveDetails();
                                  },
                                  child: Text("SAVE"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Provider.of<ProfileProvider>(context,
                                            listen: false)
                                        .clearDetails();
                                  },
                                  child: Text("CLEAR"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.sunny_snowing),
                  title: Text("Theme"),
                  subtitle: Text("Change Theme"),
                  trailing: Switch(
                    value:
                        (Provider.of<themeProvider>(context).thememodel.isDark),
                    onChanged: (val) {
                      Provider.of<themeProvider>(context, listen: false)
                          .changetheme();
                    },
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CupertinoListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                  subtitle: Text("Update Profile Data"),
                  trailing: CupertinoSwitch(
                    value: (Provider.of<ProfileProvider>(context)
                        .profileModal
                        .profileVal),
                    onChanged: (val) {
                      Provider.of<ProfileProvider>(context, listen: false)
                          .openProfile();
                    },
                  ),
                ),
                (Provider.of<ProfileProvider>(context, listen: false)
                            .profileModal
                            .profileVal ==
                        false)
                    ? Container()
                    : Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<ProfileProvider>(context,
                                        listen: false)
                                        .pickImage();
                                  },
                                  child: CircleAvatar(
                                    radius: 60,
                                    foregroundImage: FileImage(
                                        Provider.of<ProfileProvider>(context)
                                            .profileModal
                                            .userImage),
                                    child: const Icon(
                                      CupertinoIcons.photo_camera,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CupertinoTextFormFieldRow(
                              controller:
                              Provider.of<ProfileProvider>(context)
                                  .profileModal
                                  .userName,
                              textAlign: TextAlign.center,
                              placeholder: "Enter your Name...",
                            ),
                            CupertinoTextFormFieldRow(
                              controller:
                              Provider.of<ProfileProvider>(context)
                                  .profileModal
                                  .userBio,
                              textAlign: TextAlign.center,
                              placeholder: "Enter your Bio...",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CupertinoButton(
                                  onPressed: () {
                                    Provider.of<ProfileProvider>(context,
                                        listen: false)
                                        .saveDetails();
                                  },
                                  child: Text("SAVE"),
                                ),
                                CupertinoButton(
                                  onPressed: () {
                                    Provider.of<ProfileProvider>(context,
                                        listen: false)
                                        .clearDetails();
                                  },
                                  child: Text("CLEAR"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.black,
                  height: 3,
                ),
                SizedBox(
                  height: 10,
                ),
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.sun_max),
                  title: Text("Theme"),
                  subtitle: Text("Change Theme"),
                  trailing: CupertinoSwitch(
                    value:
                        (Provider.of<themeProvider>(context).thememodel.isDark),
                    onChanged: (val) {
                      Provider.of<themeProvider>(context, listen: false)
                          .changetheme();
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
