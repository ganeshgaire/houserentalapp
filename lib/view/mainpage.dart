import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/view/addhouse.dart';

import 'package:testapp/view/homepages.dart';
import 'package:testapp/view/notificationpage.dart';
import 'package:testapp/view/saveitem.dart';
import 'package:testapp/view/searchpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late String firstnames;
  String? lastname;
  String? phonenumber;
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePages(),
    const OwnSearchPage(),
    const NotificationPage(),
    const AddHouse(),
    const SavedIteam(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    userdataread();

    super.initState();
  }

  userdataread() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userData = prefs.getString('userData');

    final data = jsonDecode(userData!);
    setState(() {
      firstnames = data['first_name'];
    });

    //print(data['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 2),
        child: SizedBox(
          height: 60,
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(100),
            child: BottomNavigationBar(
                backgroundColor: const Color.fromARGB(255, 226, 219, 219),
                currentIndex: _selectedIndex,
                type: BottomNavigationBarType.fixed,
                onTap: _onItemTapped,
                unselectedFontSize: 0,
                selectedFontSize: 0,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.purple,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search_outlined,
                        color: Colors.purple,
                        size: 30,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.notification_add,
                        color: Colors.purple,
                        size: 30,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.chat,
                        color: Colors.purple,
                        size: 30,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.bookmark_add,
                        color: Colors.purple,
                        size: 30,
                      ),
                      label: ''),
                ]),
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
