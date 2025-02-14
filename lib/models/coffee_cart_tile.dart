import 'package:flutter/material.dart';
import 'package:coffee_shop/models/coffee.dart';

class CoffeeCartTile extends StatelessWidget {
  final Coffee coffee;
  final void Function()? onDelete; // Callback for delete action
  final double totalPrice;

  CoffeeCartTile({
    super.key,
    required this.coffee,
    required this.onDelete,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(coffee.name), // Unique key for each tile
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        // Background color when swiping
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        if (onDelete != null) {
          onDelete!(); // Call the delete callback
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 13),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 2),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        child: ListTile(
          leading: Image.asset(coffee.imagePath),
          title: Text('${coffee.name} (${coffee.size})'),
          subtitle: Text('Quantity: ${coffee.quantity}'),
          trailing: Text(
            '\$${totalPrice.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20,
            ),
          ), // Display total price
        ),
      ),
    );
  }
}
