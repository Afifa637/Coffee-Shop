import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:coffee_shop/models/coffee_shop.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      onTabChange: (value) => onTabChange!(value),
      color: Colors.grey[600],
      activeColor: Colors.brown,
      tabBackgroundColor: Colors.brown.shade100,
      tabBorderRadius: 20,
      tabActiveBorder: Border.all(
        color: Colors.white,
        width: 2,
      ),
      mainAxisAlignment: MainAxisAlignment.center,
      tabs: [
        GButton(
          icon: Icons.home,
          text: "Shop",
        ),
        GButton(
          icon: Icons.shopping_bag_rounded,
          text: "Cart",
          leading: Consumer<CoffeeShop>(
            builder: (context, cart, child) {
              int cartItemCount = cart.getUserCart().length;
              return badges.Badge(
                showBadge: cartItemCount > 0,
                badgeContent: Text(
                  '$cartItemCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                position: badges.BadgePosition.topEnd(top: -12, end: -12),
                child: Icon(Icons.shopping_bag_rounded),
              );
            },
          ),
        ),
        GButton(
          icon: Icons.person,
          text: "Profile",
        ),
      ],
    );
  }
}
