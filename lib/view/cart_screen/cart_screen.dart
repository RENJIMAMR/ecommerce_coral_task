import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_application/controller/cart_screen_controller.dart';
import 'package:shopping_application/view/home_screen/home_screen.dart';
import 'package:shopping_application/view/cart_screen/widget/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartScreenController controller = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<CartScreenController>(
        builder: (controller) {
          final totalAmount = controller.getTotalPrice();

          return Column(
            children: [
              Expanded(
                child: controller.cartItems.isEmpty
                    ? Center(
                        child: Text("Cart is Empty"),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          final cartItem = controller.cartItems[index];
                          return CartItemWidget(
                            onRemove: () {
                              controller.removeFromCart(cartItem.id!);
                            },
                            onDecrement: () {
                              controller.decrementQty(cartItem.id!);
                            },
                            onIncrement: () {
                              controller.incrementQty(cartItem.id!);
                            },
                            title: cartItem.title,
                            qty: cartItem.qty.toString(),
                            image: cartItem.image,
                            price: cartItem.price,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: controller.cartItems.length,
                      ),
              ),
              controller.cartItems.isEmpty
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.withOpacity(.5),
                        ),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${totalAmount.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.green,
                                    content: Text(
                                        'Cart cleared. Proceeding to checkout...'),
                                  ),
                                );

                                Get.offAll(HomeScreen());
                                controller.clearCart();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  'Checkout',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
