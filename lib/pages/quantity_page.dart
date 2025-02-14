import 'package:flutter/material.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:provider/provider.dart';

class QuantityPage extends StatefulWidget {
  final Coffee coffee;

  const QuantityPage({Key? key, required this.coffee}) : super(key: key);

  @override
  _QuantityPageState createState() => _QuantityPageState();
}

class _QuantityPageState extends State<QuantityPage> {
  int quantity = 1;
  String selectedSize = 'M';

  double get totalPrice => quantity * double.parse(widget.coffee.price);


  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  void addToCart() {
    final coffeeWithDetails = Coffee(
      name: widget.coffee.name,
      imagePath: widget.coffee.imagePath,
      price: widget.coffee.price,
      quantity: quantity,
      size: selectedSize,
    );

    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffeeWithDetails);
    Navigator.pop(context); // Close the QuantityPage after adding to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.brown[400],
        title: const Text(
          "Successfully added!",
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          "$quantity x ${widget.coffee.name} ($selectedSize) added to your cart.",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            // Coffee Image
            Image.asset(widget.coffee.imagePath, height: 200),

            const SizedBox(height: 20),

            // Quantity Selector
            Text(
              "Q U A N T I T Y",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: decrementQuantity,
                  icon: const Icon(Icons.remove, color: Colors.brown),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    quantity.toString(),
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: incrementQuantity,
                  icon: const Icon(Icons.add, color: Colors.brown),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Size Selector
            Text(
              "S I Z E",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ['S', 'M', 'L'].map((size) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    onPressed: () => selectSize(size),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedSize == size
                          ? Colors.brown[500]
                          : Colors.white,
                    ),
                    child: Text(
                      size,
                      style: TextStyle(color: selectedSize == size ? Colors.white : Colors.brown),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            // Display Total Price
            Text(
              "Total: \$${totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),

            const SizedBox(height: 20),

            // Add to Cart Button
            GestureDetector(
              onTap: addToCart,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.brown,
                ),
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                child: const Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
