import 'package:bubble/data/colors.dart';
import 'package:bubble/data/variables.dart';
import 'package:bubble/screens/account_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAccount = false;
        });
      },
      child: Scaffold(
        backgroundColor: background,
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Visibility(
              visible: selectedAccount,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: background,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Text(
                                  "Foydalanuvchini haqiqatdan ham o'chirmoqchimisiz?"),
                              titleTextStyle: TextStyle(
                                fontSize: 18,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedAccount = false;
                                      HomeAccountTempleteList.removeAt(
                                          accountIndex);
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    "Ha",
                                    style: TextStyle(color: bubbleColor),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedAccount = false;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Yo'q",
                                    style: TextStyle(color: bubbleColor),
                                  ),
                                ),
                              ],
                            ));
                  });
                },
                icon: Icon(
                  Icons.delete_rounded,
                  color: bubbleColor,
                ),
              ),
            ),
            Visibility(
              visible: selectedAccount,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    selectedAccount = false;
                  });
                },
                icon: Icon(
                  Icons.arrow_drop_down_rounded,
                  color: bubbleColor,
                ),
              ),
            ),
          ],
          toolbarHeight: 40,
          backgroundColor: Colors.transparent,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Messages",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: HomeAccountTempleteList.length,
            itemBuilder: (context, index) => Builder(builder: (context) {
              return GestureDetector(
                onLongPress: () {
                  setState(() {
                    accountIndex = index;
                    selectedAccount = !selectedAccount;
                  });
                },
                child: ListTile(
                  selected: true,
                  tileColor: bubbleColor,
                  onTap: () {
                    accountIndex = index;
                    setState(() {
                      selectedAccount = false;
                    });
                    setState(() {
                      HomeAccountTempleteList[index].messageNumber = 0;
                    });
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const AccountPage(),
                      ),
                    );
                  },
                  title: Text(
                    HomeAccountTempleteList[index].username,
                    style: usernameStyle,
                  ),
                  subtitle: Text(
                    HomeAccountTempleteList[index].message,
                    style: messageStyle,
                    softWrap: false,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: bubbleColor,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: bottomNavigationColor,
                        backgroundImage:
                            AssetImage(HomeAccountTempleteList[index].image),
                      ),
                    ),
                  ),
                  isThreeLine: false,
                  trailing: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          HomeAccountTempleteList[index].clock.toString(),
                          style: clockStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Visibility(
                        visible:
                            HomeAccountTempleteList[index].messageNumber > 0
                                ? true
                                : false,
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: bubbleColor,
                            child: Center(
                              child: Text(
                                HomeAccountTempleteList[index]
                                    .messageNumber
                                    .toString(),
                                style: messageNumberStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
