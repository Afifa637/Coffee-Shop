import 'package:coffee_shop/components/bottom_nav_bar.dart';
import 'package:coffee_shop/const.dart';
import 'package:coffee_shop/pages/about_us_page.dart';
import 'package:coffee_shop/pages/profile_page.dart';
import 'package:coffee_shop/pages/cart_page.dart';
import 'package:coffee_shop/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void NavigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> Pages = [
    const ShopPage(),
    const CartPage(),
    const profilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.brown[800]), // Ensures the drawer icon is visible
        elevation: 0, 
        // Remove shadow for transparency
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => NavigateBottomBar(index),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    child: Image.asset(
                      'lib/images/logoc.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: Colors.grey[600],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.brown,
                    ),
                    title: const Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.brown,
                    ),
                    title: const Text(
                      "About Us",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder:(context) => AboutUsPage(),),);
                      // Implement About navigation here
                    },
                  ),
                ],
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.brown,
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Handle logout here
                },
              ),
            ],
          ),
        ),
      ),
      body: Pages[selectedIndex],
    );
  }
}
