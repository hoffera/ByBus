import 'package:bybus/enum/enum.dart';
import 'package:bybus/view/add_funds_page.dart';
import 'package:bybus/view/config_page.dart';
import 'package:bybus/view/map_page.dart';
import 'package:bybus/view/user_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavPage extends StatefulWidget {
  final User user;
  const NavPage({Key? key, required this.user}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  late int _selectedIndex = 0;
  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      MapPage(user: widget.user),
      AddFundsPage(user: widget.user),
      UserPage(user: widget.user),
      const ConfigPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: AppColors.primary,
        color: AppColors.primary,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.directions_bus, size: 26, color: Colors.white),
          Icon(Icons.shopping_cart, size: 26, color: Colors.white),
          Icon(Icons.person, size: 26, color: Colors.white),
          Icon(Icons.settings, size: 26, color: Colors.white),
        ],
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
