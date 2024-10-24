import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_application/model/cart_screen/cart_model.dart';

class CartScreenController with ChangeNotifier {
  final cartBox = Hive.box<CartModel>('cartBox');
  List keys = [];
  Future<void> addToCart(
      {required String title,
      String? des,
      num? id,
      int qnty = 1,
      String? img,
      BuildContext? context,
      required num price}) async {
    bool alreadyInCart = false;
    //to check whether the item already in cart
    for (int i = 0; i < keys.length; i++) {
      var itemInHive = cartBox.get(keys[i]);
      if (itemInHive?.id == id) {
        alreadyInCart = true;
      }
    }
    if (alreadyInCart == false) {
      await cartBox.add(CartModel(
          price: price, title: title, des: des, id: id, image: img, qty: qnty));
    } else {
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text('Item Already Added')));
    }
    notifyListeners();
  }

  getAllCartItems() {
    keys = cartBox.keys.toList();
    notifyListeners();
  }

//for getting the current item
  CartModel? getCurrentItem(var key) {
    final currentItem = cartBox.get(key);
    return currentItem;
  }

  removeItem(var key) async {
    await cartBox.delete(key);
    keys = cartBox.keys.toList();
    notifyListeners();
  }

  incrementQty(var key) {
    final currentItem = cartBox.get(key);
    cartBox.put(
        key,
        CartModel(
            price: currentItem!.price,
            title: currentItem.title,
            des: currentItem.des,
            id: currentItem.id,
            image: currentItem.image,
            qty: ++currentItem.qty));
    notifyListeners();
  }

  decrementQty(var key) {
    final currentItem = cartBox.get(key);
    if (currentItem!.qty >= 2) {
      cartBox.put(
          key,
          CartModel(
              price: currentItem!.price,
              title: currentItem.title,
              des: currentItem.des,
              id: currentItem.id,
              image: currentItem.image,
              qty: --currentItem.qty));
    }
    notifyListeners();
  }

  calculateTotalAmount() {
    double total = 0.0;
    //iterate over each key in the keyList
    for (var key in keys) {
      //retrieve the item from box
      final item = cartBox.get(key);
      //check if the item is not null
      if (item != null) {
        total += item.qty * item.price;
      }
    }
    return total;
  }
}
