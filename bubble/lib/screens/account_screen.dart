import 'dart:math';

import 'package:bubble/components/home_screen_acccounts.dart';
import 'package:bubble/data/colors.dart';
import 'package:bubble/data/functions.dart';
import 'package:bubble/data/variables.dart';
import 'package:bubble/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key});
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          Duration(
            seconds: 2,
          ),
        );
      },
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopupMenuButton(
                  color: bottomNavigationColor,
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                HomeAccountTempleteList.removeAt(accountIndex);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                    (route) => false);
                              });
                            },
                            leading: const Icon(
                              Icons.delete_rounded,
                              color: bubbleColor,
                            ),
                            title: Text(
                              "Delete chat",
                              style: usernameStyle,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                datas.clear();
                                Navigator.pop(context);
                              });
                            },
                            leading: const Icon(
                              Icons.cleaning_services_rounded,
                              color: bubbleColor,
                            ),
                            title: Text(
                              "Clear history",
                              style: usernameStyle,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                FriendsAccountTempleteList.add(
                                  HomeAccounts(
                                      username:
                                          HomeAccountTempleteList[accountIndex]
                                              .username,
                                      message:
                                          HomeAccountTempleteList[accountIndex]
                                              .message,
                                      image:
                                          HomeAccountTempleteList[accountIndex]
                                              .image,
                                      messageNumber:
                                          HomeAccountTempleteList[accountIndex]
                                              .messageNumber,
                                      clock: "07:35"),
                                );
                              });
                              Navigator.pop(context);
                            },
                            leading: const Icon(
                              Icons.star_border_rounded,
                              color: bubbleColor,
                            ),
                            title: Text(
                              "Add to favorites",
                              style: usernameStyle,
                            ),
                          ),
                        ),
                      ],
                  icon: const Icon(
                    Icons.more_horiz_rounded,
                    size: 30,
                    color: Colors.white,
                  )),
            ),
          ],
          leadingWidth: 25,
          leading: Center(
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.chevron_left_rounded,
                  size: 35,
                )),
          ),
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: bubbleColor),
          backgroundColor: background,
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: bubbleColor,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: bottomNavigationColor,
                      backgroundImage: AssetImage(
                          HomeAccountTempleteList[accountIndex].image),
                    ),
                  ),
                ),
                Text(
                  HomeAccountTempleteList[accountIndex].username,
                  style: usernameStyle,
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                child: ListView.builder(
                  itemCount: datas.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            backgroundColor: background,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            children: [
                              ListTile(
                                onTap: () {
                                  setState(() {
                                    edit = true;
                                    account_screenindex = index;
                                    sendController.text = datas[index];
                                    Navigator.pop(context);
                                  });
                                },
                                title: Text(
                                  "Tahrirlash",
                                  style: settingsListStyle,
                                ),
                                leading: const Icon(
                                  Icons.edit_rounded,
                                  color: bubbleColor,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  setState(() {
                                    Clipboard.setData(
                                      ClipboardData(
                                        text: datas[index],
                                      ),
                                    );
                                    Navigator.pop(context);
                                  });
                                },
                                title: Text(
                                  "Nusxalash",
                                  style: settingsListStyle,
                                ),
                                leading: const Icon(
                                  Icons.copy_rounded,
                                  color: bubbleColor,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  setState(() {
                                    datas.removeAt(index);
                                    Navigator.pop(context);
                                  });
                                },
                                title: Text(
                                  "O'chirish",
                                  style: settingsListStyle,
                                ),
                                leading: const Icon(
                                  Icons.delete_rounded,
                                  color: bubbleColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: ChatBubble(
                        margin: const EdgeInsets.only(top: 5),
                        clipper: ChatBubbleClipper4(
                            type: index % 2 == 0
                                ? BubbleType.receiverBubble
                                : BubbleType.sendBubble),
                        elevation: 1,
                        shadowColor: bottomNavigationColor.withOpacity(0.50),
                        alignment: index % 2 != 0
                            ? Alignment.topRight
                            : Alignment.topLeft,
                        backGroundColor: index % 2 != 0
                            ? bubbleColor
                            : bottomNavigationColor,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          child: Text(
                            datas[index],
                            textAlign: TextAlign.start,
                            style: accountMessageStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: size.width,
              height: 65,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SearchBar(
                  textStyle: MaterialStatePropertyAll(sendMessageStyle),
                  controller: sendController,
                  elevation: const MaterialStatePropertyAll(2),
                  onSubmitted: (value) {
                    setState(() {
                      if (edit == true) {
                        if (sendController.text.isNotEmpty) {
                          datas[account_screenindex] = sendController.text;
                        }
                        sendController.clear();
                        edit = false;
                      } else {
                        adding();
                        sendController.clear();
                      }
                    });
                  },
                  trailing: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (sendController.text.isNotEmpty) {
                            datas[account_screenindex] = sendController.text;
                          }
                          sendController.clear();
                        });
                      },
                      icon: const Icon(
                        Icons.mic_none_rounded,
                        color: bubbleColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (edit == true) {
                            if (sendController.text.isNotEmpty) {
                              datas[account_screenindex] = sendController.text;
                            }
                            sendController.clear();
                            edit = false;
                          } else {
                            adding();
                            sendController.clear();
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.send_rounded,
                        color: bubbleColor,
                      ),
                    ),
                  ],
                  hintText: "Type a message",
                  hintStyle: const MaterialStatePropertyAll(TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  )),
                  backgroundColor: const MaterialStatePropertyAll(
                    bottomNavigationColor,
                  ),
                  leading: Transform.rotate(
                    angle: 180 / pi,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.attach_file_rounded,
                        color: bubbleColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
