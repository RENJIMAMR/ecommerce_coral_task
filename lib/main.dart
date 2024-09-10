import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';
import 'package:shopping_application/controller/cart_screen_controller.dart';
import 'package:shopping_application/controller/homescreen_controller.dart';
import 'package:shopping_application/home_screen/home_screen.dart';
import 'package:shopping_application/model/cart_screen/cart_model.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<CartModel>(CartModelAdapter());
  var box = await Hive.openBox<CartModel>('cartBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomescreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
