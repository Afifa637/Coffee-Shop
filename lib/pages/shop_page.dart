import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:coffee_shop/models/coffee_tile.dart';
import 'package:coffee_shop/pages/quantity_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String searchQuery = ''; // Variable to store the search query

  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Successfully added! Check your cart"),
        backgroundColor: Colors.brown[500],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, coffeeShop, child) {
        // Filter the coffee list based on the search query
        List<Coffee> filteredList = coffeeShop.getCoffeeList().where((coffee) {
          return coffee.name.toLowerCase().contains(searchQuery.toLowerCase());
        }).toList();

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // Search Bar
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.search, color: Colors.grey),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value; // Update search query
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  "How would you like your coffee?",
                  style: TextStyle(color: Colors.brown, fontSize: 20,
                  fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 10),

                // Display filtered coffee list
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      Coffee eachCoffee = filteredList[index];
                      return CoffeeTile(
                        coffee: eachCoffee,
                        icon: Icon(Icons.arrow_right_sharp),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuantityPage(coffee: eachCoffee),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
