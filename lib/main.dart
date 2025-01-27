import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_application/firebase_options.dart';
import 'package:shopping_application/view/splash_screen/splash_screen.dart';
import 'package:shopping_application/model/cart_screen/cart_model.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

  // Register your adapter here
  Hive.registerAdapter<CartModel>(CartModelAdapter());

  // Open the box
  await Hive.openBox<CartModel>('cartBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Your splash screen
    );
  }
}
