import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Coffee Shop!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[600],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We are passionate about bringing you the best coffee experience. Our team is dedicated to sourcing high-quality coffee beans and delivering exceptional service. Whether you are a coffee connoisseur or just looking for your daily cup of joe, we have something for everyone.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown[400],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[600],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Our mission is to provide a welcoming space where people can enjoy high-quality coffee, connect with others, and unwind from their busy lives. We strive to create a memorable coffee experience that goes beyond the cup.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown[400],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[600],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'If you have any questions or feedback, feel free to reach out to us at:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown[400],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Email: contact@coffeeshop.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
