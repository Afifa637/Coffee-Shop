import 'package:coffee_shop/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Image.asset(
                'lib/images/logoc.png',
                height: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Brew Day",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[700],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'How do you like your coffee?',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              const SizedBox(
                height: 60,
              ),

              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.brown,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  child: Center(
                    child: Text(
                      "Shop Now!",
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
      ),
    );
  }
}
