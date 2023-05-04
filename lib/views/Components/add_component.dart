import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_program/Controllers/providers/switch_controllers.dart';
import 'package:new_program/modals/variable_modals.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../Controllers/providers/variable_controllers.dart';

class AddComponent extends StatefulWidget {
  const AddComponent({Key? key}) : super(key: key);

  @override
  State<AddComponent> createState() => _AddComponentState();
}

class _AddComponentState extends State<AddComponent> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime initialDate = DateTime.now();
  DateTime initialTime = DateTime.now();
  TimeOfDay initialTime1 = TimeOfDay.now();

  DateTime? pickedDate;
  DateTime? pickedTime;
  late String periodName;

  @override
  void initState() {
    super.initState();
    initialTime = DateTime.now();

    if (initialTime.hour >= 12) {
      periodName = "pm";
    } else {
      periodName = "am";
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Provider.of<AppProvider>(context).appModal.switchVal == false)
        ? Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        (Provider.of<AddChatProvider>(context).Variable.img !=
                                null)
                            ? GestureDetector(
                                onTap: () {
                                  Provider.of<AddChatProvider>(context,
                                          listen: false)
                                      .pickImage();
                                },
                                child: CircleAvatar(
                                  radius: 80,
                                  foregroundImage: FileImage(
                                      Provider.of<AddChatProvider>(context)
                                          .Variable
                                          .img!),
                                  child: Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 40,
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  Provider.of<AddChatProvider>(context,
                                          listen: false)
                                      .pickImage();
                                },
                                child: CircleAvatar(
                                  radius: 80,
                                  child: Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 40,
                                  ),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: Variables.name,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Full Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: Variables.phone,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Phone Number";
                        } else if (val.length != 10) {
                          return "Not Valid Number";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.call),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: Variables.chat,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Message";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.chat),
                        hintText: "Chat Conversation",
                        hintStyle: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: initialDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2099),
                            );

                            setState(() {
                              if (date != pickedDate && date != null) {
                                pickedDate = date;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            size: 30,
                          ),
                        ),
                        (pickedDate != null)
                            ? Text(
                                "${pickedDate?.day} - ${pickedDate?.month} - ${pickedDate?.year}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            : Text(
                                "Pick Date",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: initialTime1,
                            );

                            setState(() {
                              if (pickedTime != pickedDate &&
                                  pickedTime != initialTime) {
                                initialTime1 = pickedTime!;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.watch_later_outlined,
                            size: 30,
                          ),
                        ),
                        (initialTime != null)
                            ? (initialTime1.periodOffset == 0)
                                ? Text(
                                    "${initialTime.hour} : ${initialTime.minute}  ${initialTime1.period.name}",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                : Text(
                                    "${initialTime.hour - 12} ${initialTime.minute} ${initialTime1.period.name}",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                            : Text(
                                "Pick Time",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() &&
                            Provider.of<AddChatProvider>(context, listen: false)
                                    .Variable
                                    .img !=
                                null) {
                          Provider.of<AddChatProvider>(context, listen: false)
                              .saveChat();
                        }
                      },
                      child: Text("SAVE"),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        (Provider.of<AddChatProvider>(context).Variable.img !=
                                null)
                            ? GestureDetector(
                                onTap: () {
                                  Provider.of<AddChatProvider>(context,
                                          listen: false)
                                      .pickImage();
                                },
                                child: CircleAvatar(
                                  radius: 80,
                                  foregroundImage: FileImage(
                                      Provider.of<AddChatProvider>(context)
                                          .Variable
                                          .img!),
                                  child: Icon(
                                    CupertinoIcons.photo_camera,
                                    size: 40,
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  Provider.of<AddChatProvider>(context,
                                          listen: false)
                                      .pickImage();
                                },
                                child: CircleAvatar(
                                  radius: 80,
                                  child: Icon(
                                    CupertinoIcons.photo_camera,
                                    size: 40,
                                  ),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CupertinoTextFormFieldRow(
                      controller: Variables.name,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Full Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      placeholder: "Full Name",
                      prefix: Icon(
                        CupertinoIcons.person,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CupertinoTextFormFieldRow(
                      controller: Variables.phone,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Phone Number";
                        } else if (val.length != 10) {
                          return "Not Valid Number";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      placeholder: "Phone Number",
                      prefix: Icon(
                        CupertinoIcons.phone,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CupertinoTextFormFieldRow(
                      controller: Variables.chat,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Any Message";
                        } else {
                          return null;
                        }
                      },
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      placeholder: "Chat Conversation",
                      prefix: Icon(
                        CupertinoIcons.chat_bubble_text,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                              height: 340,
                              color: Colors.white,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                minimumYear: 2000,
                                maximumYear: 2099,
                                onDateTimeChanged: (val) {
                                  setState(() {
                                    initialDate = val;
                                  });
                                },
                                initialDateTime: initialDate,
                              )),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.calendar,
                            size: 30,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          (pickedDate != null)
                              ? Text(
                                  "${initialDate.day} - ${initialDate.month} - ${initialDate.year}")
                              : Text(
                                  "Pick Date",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            height: 340,
                            color: Colors.white,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              maximumYear: 2099,
                              minimumYear: 2000,
                              onDateTimeChanged: (val) {
                                setState(() {
                                  initialTime = val;
                                });
                              },
                              use24hFormat: false,
                              initialDateTime: initialTime,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.time,
                            size: 30,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          (pickedTime != null)
                              ? (periodName == 'am')
                                  ? Text(
                                      "${initialTime.hour} : ${initialTime.minute}  $periodName",
                                    )
                                  : (initialTime.hour > 12)
                                      ? Text(
                                          "${initialTime.hour - 12} : ${initialTime.minute}  $periodName")
                                      : Text(
                                          "${initialTime.hour} :${initialTime.minute}  $periodName")
                              : Text(
                                  "Pick Time",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CupertinoButton.filled(
                      onPressed: () {},
                      child: Text("SAVE"),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
