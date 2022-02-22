import 'package:assignment/core/extensions/buildcontext_extension.dart';
import 'package:assignment/product/constants/dummy_user_data.dart';
import 'package:assignment/product/constants/strings/texts.dart';
import 'package:assignment/product/view/home/profile_tab.dart';
import 'package:flutter/material.dart';

import 'albums_tab.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.photo_album_outlined), label: Texts.album),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline_rounded), label: Texts.profile),
  ];

  final List<Widget> tabs = [const AlbumTab(), const ProfileTab(user: kUser)];
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.screenPadding,
        child: tabs.elementAt(selectedTabIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex, onTap: _onItemTapped, items: items),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
