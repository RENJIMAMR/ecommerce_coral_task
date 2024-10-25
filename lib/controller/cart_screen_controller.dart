import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shopping_application/model/cart_screen/cart_model.dart';
import 'package:flutter/material.dart';

class CartScreenController extends GetxController {
 
  Box<CartModel>?
      cartBox; 

  @override
  void onInit() {
    super.onInit();
    // Initialize the Hive box
    initializeBox();
  }

  Future<void> initializeBox() async {
    try {
      print('Opening cartBox...');
      cartBox = await Hive.openBox<CartModel>('cartBox');
      print('cartBox opened successfully');
      update(); 
    } catch (e) {
      print('Error opening cartBox: $e');
    }
  }

  // List to hold the items in the cart
  List<CartModel> get cartItems {
    // Ensure that the box is initialized before accessing it
    if (cartBox != null) {
      return cartBox!.values.toList();
    } else {
      return []; // Return an empty list if box is not initialized
    }
  }

  // Method to add an item to the cart
  void addToCart({
    required String title,
    required num price,
    required BuildContext context,
    required String description,
    required num id,
    required String image,
  }) {
    if (cartBox == null) {
      print('Cart box is not initialized. Cannot add item.');
      return; // Prevent adding if the box is not initialized
    }

    CartModel newItem = CartModel(
      title: title,
      price: price,
      des: description,
      id: id.toInt(),
      image: image,
      qty: 1, // Default quantity
    );

    cartBox!.put(id, newItem); // Store the item using its ID as the key
    update();
  }

  // Increment quantity of an item in the cart
  void incrementQty(int id) {
    if (cartBox == null) {
      print('Cart box is not initialized. Cannot increment quantity.');
      return; // Prevent incrementing if the box is not initialized
    }

    final currentItem = cartBox!.get(id);
    if (currentItem != null) {
      currentItem.qty += 1; // Increment quantity
      cartBox!.put(id, currentItem); // Update the item in the box
      update();
    }
  }

  // Decrement quantity of an item in the cart
  void decrementQty(int id) {
    if (cartBox == null) {
      print('Cart box is not initialized. Cannot decrement quantity.');
      return; // Prevent decrementing if the box is not initialized
    }

    final currentItem = cartBox!.get(id);
    if (currentItem != null && currentItem.qty > 1) {//the minimum quantity will always 1
      currentItem.qty -= 1; // Decrement quantity
      cartBox!.put(id, currentItem); // Update the item in the box
      update();
    }
  }

  // Method to remove an item from the cart by its ID
  void removeFromCart(int id) {
    if (cartBox == null) {
      print('Cart box is not initialized. Cannot remove item.');
      return; // Prevent removing if the box is not initialized
    }

    cartBox!.delete(id); // Remove the item using its ID as the key
    update(); 
    print('Item with ID: $id removed from cart.');
  }

  // Method to get total price of items in the cart
  num getTotalPrice() {
    if (cartBox == null) {
      print('Cart box is not initialized. Cannot calculate total price.');
      return 0; // Return 0 if the box is not initialized
    }

    return cartBox!.values
        .fold<num>(0, (sum, item) => sum + item.price * item.qty);
  }

// Method to delete all items from the cart
  void clearCart() {
    if (cartBox == null) {
      print('Cart box is not initialized. Cannot clear cart.');
      return; // Prevent clearing if the box is not initialized
    }

    cartBox!.clear(); // Clear all items from the box
    update(); 
    print('All items removed from the cart.');
  }
}
