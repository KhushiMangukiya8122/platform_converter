import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../Controllers/providers/switch_controllers.dart';
import '../../Controllers/providers/variable_controllers.dart';

class ChatComponent extends StatefulWidget {
  const ChatComponent({Key? key}) : super(key: key);

  @override
  State<ChatComponent> createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  DateTime initialDate = DateTime.now();
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return (Provider
        .of<AppProvider>(context)
        .appModal
        .switchVal == false)
        ? (Provider
        .of<AddChatProvider>(context)
        .Variable
        .fullName
        .isNotEmpty)
        ? ListView.builder(
      itemCount: Provider
          .of<AddChatProvider>(context)
          .Variable
          .fullName
          .length,
      itemBuilder: (context, i) =>
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            horizontalTitleGap: 10,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) =>
                    Container(
                      height: 350,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 70,
                            foregroundImage: FileImage(
                              File(
                                Provider
                                    .of<AddChatProvider>(context)
                                    .Variable
                                    .image[i],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            Provider
                                .of<AddChatProvider>(context)
                                .Variable
                                .fullName[i],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Provider
                                .of<AddChatProvider>(context)
                                .Variable
                                .chatConversation[i],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cancel"),
                          ),
                        ],
                      ),
                    ),
              );
            },
            leading: CircleAvatar(
              radius: 30,
              foregroundImage: FileImage(
                File(
                  Provider
                      .of<AddChatProvider>(context)
                      .Variable
                      .image[i],
                ),
              ),
            ),
            title: Text(
              Provider
                  .of<AddChatProvider>(context)
                  .Variable
                  .fullName[i],
            ),
            subtitle: Text(
              Provider
                  .of<AddChatProvider>(context)
                  .Variable
                  .chatConversation[i],
            ),
            trailing: Text(
              "${pickedDate?.day} - ${pickedDate?.month} - ${pickedDate?.year}",
            ),
          ),
    )
        : const Center(
      child: Text("No any chat yet..."),
    )
        : CupertinoListSection(
        children: List.generate(
          Provider
              .of<AddChatProvider>(context)
              .Variable
              .fullName
              .length,

              (i) =>
              CupertinoListTile(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                leadingToTitle: 5,
                leadingSize: 70,
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) =>
                        Container(
                          height: 350,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 70,
                                foregroundImage: FileImage(
                                  File(
                                    Provider
                                        .of<AddChatProvider>(context)
                                        .Variable
                                        .image[i],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                Provider
                                    .of<AddChatProvider>(context)
                                    .Variable
                                    .fullName[i],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                Provider
                                    .of<AddChatProvider>(context)
                                    .Variable
                                    .chatConversation[i],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  CupertinoButton(
                                    onPressed: () {},
                                    child: Icon(CupertinoIcons.pen),
                                  ),
                                  CupertinoButton(
                                    onPressed: () {},
                                    child: const Icon(CupertinoIcons.delete),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CupertinoButton.filled(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cancel"),
                              ),
                            ],
                          ),
                        ),
                  );
                },
                leading: CircleAvatar(
                  radius: 30,
                  foregroundImage: FileImage(
                    File(
                      Provider
                          .of<AddChatProvider>(context)
                          .Variable
                          .image[i],
                    ),
                  ),
                ),
                title: Text(
                  Provider
                      .of<AddChatProvider>(context)
                      .Variable
                      .fullName[i],
                ),
                subtitle: Text(
                  Provider
                      .of<AddChatProvider>(context)
                      .Variable
                      .chatConversation[i],
                ),
                trailing: Text(
                  "${pickedDate?.day} - ${pickedDate?.month} - ${pickedDate
                      ?.year}",
                ),
              ),
        )
    );
  }
}
