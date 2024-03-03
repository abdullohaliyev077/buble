import 'package:bubble/data/colors.dart';
import 'package:bubble/data/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatSettings extends StatefulWidget {
  const ChatSettings({super.key});

  @override
  State<ChatSettings> createState() => _ChatSettingsState();
}

class _ChatSettingsState extends State<ChatSettings> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 35,
          color: bubbleColor,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              sliderValue = valueclone;
            });
          },
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        backgroundColor: background,
      ),
      body: Column(
        children: [
          SizedBox(
            width: size.width,
            height: size.height / 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "      Xabarlar matni o'lchami",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width - 50,
                        child: Slider(
                          min: 12,
                          max: 30,
                          thumbColor: bubbleColor,
                          activeColor: bottomNavigationColor,
                          inactiveColor: bubbleColor.withOpacity(0.50),
                          value: sliderValue.toDouble(),
                          onChanged: (value) => setState(() {
                            valueclone = value;
                            sliderValue=valueclone;
                          }),
                        ),
                      ),
                      Text(
                        sliderValue.toInt().toString(),
                        style: usernameStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: bottomNavigationColor,
            width: size.width,
            height: size.height / 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ChatBubble(
                    margin: const EdgeInsets.only(top: 5),
                    backGroundColor: background,
                    elevation: 0,
                    clipper: ChatBubbleClipper4(
                      type: BubbleType.receiverBubble,
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      child: Text(
                        "Salom qandaysan",
                        textAlign: TextAlign.start,
                        style: accountMessageStyle,
                      ),
                    ),
                  ),
                  ChatBubble(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(top: 5),
                    backGroundColor: bubbleColor,
                    elevation: 0,
                    clipper: ChatBubbleClipper4(
                      type: BubbleType.sendBubble,
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      child: Text(
                        "Yaxshi rahmat",
                        textAlign: TextAlign.start,
                        style: accountMessageStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void slider(double value) {
    return setState(() {
      sliderValue = value;
    });
  }
}
