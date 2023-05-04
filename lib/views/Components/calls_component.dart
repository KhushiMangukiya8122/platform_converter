import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_program/Controllers/providers/variable_controllers.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../Controllers/providers/switch_controllers.dart';
import 'package:url_launcher/url_launcher.dart';

class CallsComponent extends StatefulWidget {
  const CallsComponent({Key? key}) : super(key: key);

  @override
  State<CallsComponent> createState() => _CallsComponentState();
}

class _CallsComponentState extends State<CallsComponent> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<AppProvider>(context).appModal.switchVal == false)
        ? (Provider.of<AddChatProvider>(context)
                .Variable
                .phoneNumber
                .isNotEmpty)
            ? ListView.builder(
                itemBuilder: (context, i) => ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  horizontalTitleGap: 10,
                  leading: CircleAvatar(
                    radius: 30,
                    foregroundImage: FileImage(
                      File(
                        Provider.of<AddChatProvider>(context).Variable.image[i],
                      ),
                    ),
                  ),
                  title: Text(
                    Provider.of<AddChatProvider>(context).Variable.fullName[i],
                  ),
                  subtitle: Text(
                    Provider.of<AddChatProvider>(context)
                        .Variable
                        .chatConversation[i],
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      Uri uri = Uri.parse(
                          "tel:+91${Provider.of<AddChatProvider>(context, listen: false).Variable.phoneNumber[i]}");

                      try {
                        await launchUrl(uri);
                      } catch (e) {
                        print("Exception : $e");
                      }
                    },
                    icon: Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                  ),
                ),
                itemCount: Provider.of<AddChatProvider>(context)
                    .Variable
                    .fullName
                    .length,
              )
            : Center(
                child: Text("No Any Calls Yet..."),
              )
        : (Provider.of<AddChatProvider>(context)
                .Variable
                .phoneNumber
                .isNotEmpty)
            ? CupertinoListSection(
                children: List.generate(
                  Provider.of<AddChatProvider>(context)
                      .Variable
                      .fullName
                      .length,
                  (i) => CupertinoListTile(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    leadingToTitle: 5,
                    leadingSize: 70,
                    leading: CircleAvatar(
                      radius: 30,
                      foregroundImage: FileImage(
                        File(
                          Provider.of<AddChatProvider>(context)
                              .Variable
                              .image[i],
                        ),
                      ),
                    ),
                    title: Text(
                      Provider.of<AddChatProvider>(context)
                          .Variable
                          .fullName[i],
                    ),
                    subtitle: Text(
                      Provider.of<AddChatProvider>(context)
                          .Variable
                          .chatConversation[i],
                    ),
                    trailing: CupertinoButton(
                      onPressed: () async {
                        Uri uri = Uri.parse(
                            "tel:+91${Provider.of<AddChatProvider>(context, listen: false).Variable.phoneNumber[i]}");

                        try {
                          await launchUrl(uri);
                        } catch (e) {
                          print("Exception : $e");
                        }
                      },
                      child: Icon(
                        CupertinoIcons.phone,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              )
            : Center(
                heightFactor: 40,
                child: Text("No Any Calls Yet..."),
              );
  }
}
