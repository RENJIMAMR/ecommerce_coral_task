import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_application/dress_listing_screen/dress_listing_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              height: 700,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/15253594/pexels-photo-15253594/free-photo-of-man-in-pink-suit-and-sunglasses.jpeg?auto=compress&cs=tinysrgb&w=600'),
                      fit: BoxFit.cover)),
              child: Text(
                'Define yourself in a unique way. ',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 122, 36, 36),
                    wordSpacing: 1),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ListingScreen()));
                print('ontapped to listing screen');
              },
              onDoubleTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ListingScreen()));
                print('on double tapped to listing screen');
              },
              onLongPress: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ListingScreen()));
                print('on long pressed to listing screen');
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 25,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
