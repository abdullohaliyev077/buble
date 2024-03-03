import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble/data/colors.dart';
import 'package:bubble/data/variables.dart';
import 'package:bubble/screens/home_screen.dart';

class AcessCodePage extends StatefulWidget {
  const AcessCodePage({Key? key}) : super(key: key);

  @override
  State<AcessCodePage> createState() => _AcessCodePageState();
}

class _AcessCodePageState extends State<AcessCodePage> {
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 35,
          color: bubbleColor,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                builder: (context) => Home(),
              ),
              (route) => false,
            );
          },
          icon: Icon(Icons.chevron_left_rounded),
        ),
        backgroundColor: background,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width,
            height: size.height / 5.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kirish kodini yaratish",
                  style: TextStyle(
                    color: bubbleColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Kirish kodini yaratish uchun istalgan 4 xonali raqamni kiriting.",
                  style: TextStyle(
                    color: bubbleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.height / 5.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "0000",
                  hintStyle: TextStyle(
                    color: bubbleColor,
                    fontSize: 46,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 8,
                  ),
                ),
                textAlign: TextAlign.center,
                controller: passwordController,
                style: TextStyle(
                  color: bubbleColor,
                  fontSize: 46,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 8,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: size.width - 10,
                height: size.height / 2.6,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GridView.builder(
                    itemCount: safety.length,
                    addAutomaticKeepAlives: true,
                    addSemanticIndexes: true,
                    primary: true,
                    clipBehavior: Clip.hardEdge,
                    physics: BouncingScrollPhysics(),
                    addRepaintBoundaries: true,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 10 / 5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            print(index);
                            if (index == 10 &&
                                passwordController.text.isNotEmpty) {
                              passwordController.text = passwordController.text
                                  .substring(
                                      0, passwordController.text.length - 1);
                            } else if (passwordController.text.length < 4) {
                              passwordController.text += safety[index];
                            }
                            if (passwordController.text.length == 4) {
                              showAlertDialog(context);
                            }
                          });
                        },
                        child: Container(
                          width: size.width / 8,
                          height: size.height / 8,
                          decoration: BoxDecoration(
                            color: bottomNavigationColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: bubbleColor.withOpacity(0.10),
                              width: 0.50,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              safety[index].toString(),
                              style: TextStyle(
                                color: bubbleColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("4 ta tugma bosildi!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
