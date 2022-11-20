import 'package:flutter/material.dart';
import 'package:homework2/exercise2/graduated_project/tinEm/update_account.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'account_page.dart';
import 'newPassword.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int currentIndex = 0;
  final pages = <Widget>[];

  @override
  void initState() {
    pages.addAll([
      AccountPage(),
      UpdateAccount(),
      ChangePasswordPage(),
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // body: pages[currentIndex],
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    final items = getItems();
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      selectedItemColor: Colors.red,
      // type: BottomNavigationBarType.shifting,
      showUnselectedLabels: false,
    );
  }

  List<BottomNavigationBarItem> getItems() {
    return [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/foxIcons.png',
          width: 50,
          height: 42,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.account_circle,
          size: 37,
        ),
        label: 'Account',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.wifi_protected_setup,
          size: 37,
        ),
        label: 'Password',
      ),
    ];
  }
}
