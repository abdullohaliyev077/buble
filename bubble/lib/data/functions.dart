import 'package:bubble/data/variables.dart';

void selectBottom(value) {
  selectedIndex = value;
}

void datasadd() {
  if (sendController.text.isNotEmpty) {
    datas.add(sendController.text);
  } else {
    print("xato");
  }
  sendController.clear();
}

void adding() {
  if (sendController.text.isNotEmpty) {
    datas.add(sendController.text);
  } else {
    print("xato");
  }
  // sendController.clear();
}

void search(text) {
  text = searchController.text;
  if (text.isNotEmpty &&
      text == HomeAccountTempleteList[accountIndex].username) {
    print(searchController.text);
  }else{
    print("bajarilmadi");
  }
}
