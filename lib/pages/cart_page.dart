import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_cart_tile.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Remove item from cart
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, coffeeShop, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Text(
                "Your Cart",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.brown[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: coffeeShop.getUserCart().length,
                  itemBuilder: (context, index) {
                    // Get individual cart items
                    Coffee eachCoffee = coffeeShop.getUserCart()[index];
                    // Calculate total price
                    double totalPrice = eachCoffee.quantity * double.parse(eachCoffee.price);

                    // Return CoffeeCartTile with total price
                    return CoffeeCartTile(
                      coffee: eachCoffee,
                      totalPrice: totalPrice,
                      onDelete: () => removeFromCart(eachCoffee),
                    );
                  },
                ),
              ),
              
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Center(
                    child: Text(
                      "Pay Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.brown[500],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
