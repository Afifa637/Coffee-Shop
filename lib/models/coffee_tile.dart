import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final void Function()? onPressed;
  final Icon icon;

  CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 13),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
      ),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text('Price: ${'\$' + coffee.price}'), // Displaying price with a dollar sign
        leading: Image.asset(coffee.imagePath), // Ensure image path is valid
        trailing: IconButton(
          onPressed: onPressed,
          icon: icon,
          color: Colors.brown[900],
        ),
      ),
    );
  }
}
