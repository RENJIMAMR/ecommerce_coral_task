import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/cart_screen/widget/cart_item_widget.dart';
import 'package:shopping_application/controller/cart_screen_controller.dart';
import 'package:shopping_application/dress_detailing_screen/dress_detailing_screen.dart';
import 'package:shopping_application/dress_listing_screen/dress_listing_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<CartScreenController>().getAllCartItems();
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Cart',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body:
            Consumer<CartScreenController>(builder: (context, cartProv, child) {
          final totalAmount = cartProv.calculateTotalAmount();
          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              final cartItem =
                                  cartProv.getCurrentItem(cartProv.keys[index]);
                              return CartItemWidget(
                                  onRemove: () {
                                    context
                                        .read<CartScreenController>()
                                        .removeItem(cartProv.keys[index]);
                                  },
                                  onDecrement: () {
                                    context
                                        .read<CartScreenController>()
                                        .decrementQty(cartProv.keys[index]);
                                  },
                                  onIncrement: () {
                                    context
                                        .read<CartScreenController>()
                                        .incrementQty(cartProv.keys[index]);
                                  },
                                  title: cartItem?.title ?? '',
                                  qty: cartItem?.qty.toString() ?? '',
                                  image: cartItem?.image ?? '',
                                  price: cartItem?.price ?? 0);
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10,
                                ),
                            itemCount: cartProv.keys.length))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.cyanAccent),
                  height: 100,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${totalAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.green,
                                  content: Text(
                                      'This image is already in the list.'),
                                ))
                                .closed
                                .then((_) {
                              // Navigate after the SnackBar closes
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListingScreen(),
                                ),
                              );
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Checkout',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }
}
