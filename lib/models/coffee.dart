class Coffee {
  final String name;
  final String price;
  final String imagePath;
  int quantity;
  String size;

  Coffee({
    required this.name,
    required this.price,
    required this.imagePath,
    this.quantity = 1, // Default quantity
    this.size = 'M', 
  });
}
