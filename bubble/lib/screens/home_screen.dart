import 'package:bubble/components/add_account.dart';
import 'package:bubble/data/colors.dart';
import 'package:bubble/data/functions.dart';
import 'package:bubble/data/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 10,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    constraints: const BoxConstraints.expand(),
                    showDragHandle: false,
                    backgroundColor: background,
                    builder: (context) => const AddAccount(),
                  );
                });
              },
              icon: const Icon(
                Icons.add_rounded,
                color: Colors.white,
              )),
        ],
        toolbarHeight: 60,
        backgroundColor: background,
        title: SizedBox(
          width: double.infinity / 2.5,
          height: 38,
          child: SearchBar(
            controller: searchController,
            onSubmitted: (value) {},
            textStyle: const MaterialStatePropertyAll(
              TextStyle(
                color: Colors.white,
              ),
            ),
            hintText: "Search",
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    search(context);
                  });
                },
                child: SvgPicture.asset(
                  "assets/icons/search.svg",
                ),
              ),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            side: MaterialStatePropertyAll(
              BorderSide(
                color: searchBarColor.withOpacity(0.80),
              ),
            ),
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: const MaterialStatePropertyAll(
              searchBarColor,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            backgroundColor: bottomNavigationColor,
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedIconTheme: const IconThemeData(
              color: bubbleColor,
            ),
            selectedLabelStyle: const TextStyle(
              color: Color.fromRGBO(82, 186, 140, 1),
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400),
            unselectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            currentIndex: selectedIndex,
            onTap: (value) {
              setState(
                () {
                  selectedIndex = value;
                  print(selectedIndex);
                },
              );
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "Asosiy",
                backgroundColor: bottomNavigationColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group_rounded),
                label: "Sevimlilar",
                backgroundColor: bottomNavigationColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded),
                label: "Xabarlar",
                backgroundColor: bottomNavigationColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded),
                label: "Sozlamalar",
                backgroundColor: bottomNavigationColor,
              ),
            ],
          ),
        ),
      ),
      body: listOfScreens.elementAt(selectedIndex),
    );
  }
}
