import 'package:bubble/components/add_account.dart';
import 'package:bubble/data/colors.dart';
import 'package:bubble/data/variables.dart';
import 'package:bubble/screens/account_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                constraints: const BoxConstraints.expand(),
                showDragHandle: false,
                backgroundColor: background,
                builder: (context) => const AddAccount());
          });
        },
        backgroundColor: bubbleColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          weight: 10,
        ),
      ),
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
                              title:const Text(
                                  "Foydalanuvchini haqiqatdan ham o'chirmoqchimisiz?"),
                              titleTextStyle:const TextStyle(
                                fontSize: 18,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedAccount = false;
                                      HomeAccountTempleteList.removeAt(
                                          accountIndex);
                                      toolbarHeight = 0.0;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Text(
                                    "Ha",
                                    style: TextStyle(color: bubbleColor),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedAccount = false;
                                      toolbarHeight = 0.0;
                                    });

                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Yo'q",
                                    style: TextStyle(color: bubbleColor),
                                  ),
                                ),
                              ],
                            ));
                  });
                },
                icon:const Icon(
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
                    toolbarHeight = 0.0;
                  });
                },
                icon:const Icon(
                  Icons.arrow_drop_down_rounded,
                  color: bubbleColor,
                ),
              ),
            ),
          ],
          toolbarHeight: toolbarHeight,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: HomeAccountTempleteList.length,
            itemBuilder: (context, index) => Builder(builder: (context) {
              return GestureDetector(
                onLongPress: () {
                  setState(() {
                    if (selectedAccount == false) {
                      setState(() {
                        toolbarHeight = 40.0;
                        accountIndex = index;
                        selectedAccount = !selectedAccount;
                      });
                    } else {
                      toolbarHeight = 0.0;
                      selectedAccount = !selectedAccount;
                    }
                  });
                },
                child: ListTile(
                  selected: true,
                  tileColor: bubbleColor,
                  onTap: () {
                    accountIndex = index;
                    setState(() {
                      HomeAccountTempleteList[index].messageNumber = 0;
                    });
                    sliderValue=valueclone;
                    print(sliderValue);
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
