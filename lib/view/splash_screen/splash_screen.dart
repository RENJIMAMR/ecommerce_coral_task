import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/view/home_screen/home_screen.dart';
import 'package:shopping_application/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then(
      (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(
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
    );
  }
}
