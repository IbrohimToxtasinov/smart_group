import 'package:flutter/material.dart';
import 'package:smart_group/view/screens/tab_box/cards_screen/cards_screen.dart';
import 'package:smart_group/view/screens/tab_box/countries_Screen/countries_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [
      CountriesScreen(),
      AllCardsScreen(),
      Container(),
    ];
    return Scaffold(
        body: pages[currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            currentPage = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.api), label: "Api"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card_sharp), label: "Cards"),
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: "File Downloader"),
          ],
        ),
    );
  }
}
