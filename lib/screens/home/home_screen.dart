import 'package:flutter/material.dart';
import 'package:movie/screens/home/tabs/browse_tab.dart';
import 'package:movie/screens/home/tabs/home_tab.dart';
import 'package:movie/screens/home/tabs/profile.dart';
import 'package:movie/screens/home/tabs/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            currentIndex=value;
            setState(() {

            });
          },
          selectedItemColor: Color(0xFFF6BD00),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xFF282A28),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              label: " ",
              icon: ImageIcon(AssetImage("assets/images/ic_home.png")),
            ),
            BottomNavigationBarItem(
              label: " ",
              icon: ImageIcon(AssetImage("assets/images/ic_search.png")),
            ),
            BottomNavigationBarItem(
              label: " ",
              icon: ImageIcon(AssetImage("assets/images/ic_browse.png")),
            ),
            BottomNavigationBarItem(
              label: " ",
              icon: ImageIcon(AssetImage("assets/images/ic_profile.png")),
            ),
          ],
        ),
        body: tabs[currentIndex],
      );
  }

  List<Widget>tabs=[
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    Profile()
  ];
}
