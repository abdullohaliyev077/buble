import 'package:bubble/components/home_screen_acccounts.dart';
import 'package:bubble/data/colors.dart';
import 'package:bubble/screens/friends_screen.dart';
import 'package:bubble/screens/home_page.dart';
import 'package:bubble/screens/messages_screen.dart';
import 'package:bubble/screens/settings_screen.dart';
import 'package:flutter/material.dart';

String? errorMessage;
String? Username = "Username";
String imageUser = "assets/avatars/first.png";
String? Email = "Examle@gmail.com";
int selectedIndex = 0;
double toolbarHeight = 0.0;
bool checkValueUp = false;
bool checkValueIn = false;
bool notifications = false;
bool usernameSet = false;
bool selectedAccount = false;
bool edit = false;
int accountIndex = 1;
dynamic valueclone = 12.0;
dynamic sliderValue = 14.0;
int passwordIndex = 0;
int account_screenindex = 0;
bool onOrOff = false;

TextStyle sendMessageStyle = const TextStyle(
  color: Colors.white,
  fontSize: 15,
);
TextStyle usernameStyle = const TextStyle(
  color: Colors.white,
  fontSize: 15,
);
TextStyle messageNumberStyle = const TextStyle(
  color: Colors.white,
  fontSize: 8,
);
TextStyle clockStyle = const TextStyle(
  color: Colors.white,
  fontSize: 10,
  fontWeight: FontWeight.w500,
);
TextStyle messageStyle = const TextStyle(
  color: bubbleColor,
  fontSize: 12,
);
TextStyle accountMessageStyle = TextStyle(
  color: Colors.white,
  fontSize: sliderValue,
  fontWeight: FontWeight.w400,
);
TextStyle settingsListStyle = const TextStyle(
  color: Colors.white,
  fontSize: 15,
);
TextStyle settingsUserStyle = const TextStyle(
  color: Colors.white,
  fontSize: 15,
);
TextStyle settingsEmailStyle = const TextStyle(
  color: Colors.white,
  fontSize: 12,
);
SearchController searchController = SearchController();
TextEditingController sendController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController numberController = TextEditingController();
TextEditingController signUpUsernameController = TextEditingController();
TextEditingController signUpEmailController = TextEditingController();
TextEditingController signUpPasswordController = TextEditingController();
TextEditingController signInEmailController = TextEditingController();
TextEditingController signInPasswordController = TextEditingController();
TextEditingController usernameChangeController = TextEditingController();
TextEditingController passwordController = TextEditingController();
//rasmlar listi
List images = [
  "assets/avatars/first.png",
  "assets/avatars/second.png",
  "assets/avatars/thirty.png",
  "assets/avatars/fourthy.png",
  "assets/avatars/fivethy.png",
  "assets/avatars/sixty.png",
  "assets/avatars/seventy.png",
  "assets/avatars/eighty.png",
  "assets/avatars/ninethy.png",
  "assets/avatars/ten.png",
  "assets/avatars/eleven.png",
];
List datas = [
  "salom",
  "qalesan",
  "yaxshi rahmat",
  "nima qilyapsan",
  "sen bilan bubble ilovasida yozishyapman",
  "Ha bubble ilovasi eng zo'r chat ilovasi😁shunday emasmi",
];
List<dynamic> password = [];
List safety = [
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "×",
];

List<IconData> listOfIcons = [
  Icons.home_rounded,
  Icons.group_rounded,
  Icons.message_rounded,
  Icons.settings_rounded,
];
List<String> listOfText = [
  "Home",
  "Friends",
  "Messages",
  "Settings",
];
List listOfScreens = [
  const HomePage(),
  const FriendsPage(),
  const MessagesPage(),
  const Settings(),
];

List HomeAccountTempleteList = [
  HomeAccounts(
      username: "Fasliddin Farhodjonov",
      message: "Salom qayerdasan 😀😀😀",
      image: "assets/avatars/first.png",
      messageNumber: 5,
      clock: "15:00"),
  HomeAccounts(
      username: "Abdulloh Aliyev",
      message: "Bugun meet qilamizmi?",
      image: "assets/avatars/second.png",
      messageNumber: 1,
      clock: "18:14"),
  HomeAccounts(
      username: "Esonov Sunnatillo",
      message: "qaleysiz!!!",
      image: "assets/avatars/thirty.png",
      messageNumber: 3,
      clock: "07:35"),
  HomeAccounts(
      username: "Alexandr",
      message: "Hello my friend",
      image: "assets/avatars/fourthy.png",
      messageNumber: 0,
      clock: "15:00"),
  HomeAccounts(
      username: "Elon Musk",
      message: "You are the best",
      image: "assets/avatars/fivethy.png",
      messageNumber: 1,
      clock: "12:14"),
  HomeAccounts(
      username: "Esonov Sunnatillo",
      message: "qaleysiz!!!",
      image: "assets/avatars/seventy.png",
      messageNumber: 3,
      clock: "07:35"),
  HomeAccounts(
      username: "Fasliddin Farhodjonov",
      message: "Salom qandaysan 😀😀😀",
      image: "assets/avatars/eighty.png",
      messageNumber: 2,
      clock: "15:00"),
  HomeAccounts(
      username: "Abdulloh Aliyev",
      message: "Bugun meet qilamizmi?",
      image: "assets/avatars/ninethy.png",
      messageNumber: 1,
      clock: "18:14"),
  HomeAccounts(
      username: "Esonov Sunnatillo",
      message: "qaleysiz!!!",
      image: "assets/avatars/ten.png",
      messageNumber: 3,
      clock: "07:35"),
  HomeAccounts(
      username: "Fasliddin Farhodjonov",
      message: "Salom qandaysan 😀😀😀",
      image: "assets/avatars/eleven.png",
      messageNumber: 2,
      clock: "15:00"),
  HomeAccounts(
      username: "Abdulloh Aliyev",
      message: "Bugun meet qilamizmi?",
      image: "assets/avatars/first.png",
      messageNumber: 1,
      clock: "18:14"),
  HomeAccounts(
      username: "Esonov Sunnatillo",
      message: "qaleysiz!!!",
      image: "assets/avatars/seventy.png",
      messageNumber: 3,
      clock: "07:35"),
];
List FriendsAccountTempleteList = [
  HomeAccounts(
      username: "Fasliddin Farhodjonov",
      message: "Salom qayerdasan 😀😀😀",
      image: "assets/avatars/first.png",
      messageNumber: 5,
      clock: "15:00"),
  HomeAccounts(
      username: "Abdulloh Aliyev",
      message: "Bugun meet qilamizmi?",
      image: "assets/avatars/second.png",
      messageNumber: 1,
      clock: "18:14"),
  HomeAccounts(
      username: "Esonov Sunnatillo",
      message: "qaleysiz!!!",
      image: "assets/avatars/thirty.png",
      messageNumber: 3,
      clock: "07:35"),
];
