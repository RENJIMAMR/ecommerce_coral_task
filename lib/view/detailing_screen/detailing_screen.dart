import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_application/controller/cart_screen_controller.dart';
import 'package:shopping_application/controller/product_detailing_screen_controller.dart';
import 'package:shopping_application/view/home_screen/home_screen.dart';
import 'package:shopping_application/view/cart_screen/cart_screen.dart';

class DetailingScreen extends StatefulWidget {
  const DetailingScreen({Key? key, required this.id}) : super(key: key);
  final num id;

  @override
  State<DetailingScreen> createState() => _DetailingScreenState();
}

class _DetailingScreenState extends State<DetailingScreen> {
  final ProductdetailScreenController controller =
      Get.put(ProductdetailScreenController());
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        controller.getProductDetails(id: widget.id.toString());
        Get.put(CartScreenController()); // to create
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Details',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Stack(children: [
              Icon(Icons.notifications_none, size: 30, color: Colors.black),
              Positioned(
                top: 5.5,
                right: 5,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.black,
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                          fontSize: 5,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
      body: GetBuilder<ProductdetailScreenController>(
        builder: (controller) => controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              Center(
                                child: Container(
                                  height: 350,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(66, 138, 117, 117),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          controller.productDetailObj?.image ??
                                              ''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(height: 15),
                            Text(
                              controller.productDetailObj?.title ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, size: 25, color: Colors.amber),
                                Text(
                                  (controller.productDetailObj?.rating?.rate ??
                                          0.0)
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Text(
                              controller.productDetailObj?.description ?? '',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(.6)),
                            ),
                            SizedBox(height: 25),
                            Text(
                              'Choose Size',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: ['S', 'M', 'L', 'XL']
                                  .map(
                                    (size) => Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.black.withOpacity(.2),
                                            width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                          size,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(
                        top: 20, left: 20, bottom: 10, right: 20),
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Colors.black.withOpacity(.2)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(.5),
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Price", style: TextStyle(fontSize: 15)),
                            Text(
                              " ₹ ${controller.productDetailObj?.price}",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        SizedBox(width: 100),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              CartScreenController cartController =
                                  Get.find<CartScreenController>();

                              // Check if the product already exists in the cart
                              bool exists = cartController.cartItems.any(
                                  (item) =>
                                      item.id ==
                                      controller.productDetailObj?.id);

                              if (exists) {
                                // Show Snackbar if the item is already in the cart
                                Get.snackbar(
                                  backgroundColor: Colors.black,
                                  colorText: Colors.white,
                                  'Item Already in Cart',
                                  'You’ve already added this product to your cart.',
                                  snackPosition: SnackPosition.TOP,
                                );
                              } else {
                                // Add the item to the cart if it doesn't exist
                                cartController.addToCart(
                                  title:
                                      controller.productDetailObj?.title ?? '',
                                  price:
                                      controller.productDetailObj?.price ?? 0,
                                  context: context,
                                  description: controller
                                          .productDetailObj?.description ??
                                      '',
                                  id: controller.productDetailObj?.id ?? 0,
                                  image:
                                      controller.productDetailObj?.image ?? '',
                                );

                                Get.to(() => CartScreen());
                              }
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: const Color.fromARGB(255, 12, 11, 11),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.local_mall_outlined,
                                      color: Colors.white, size: 23),
                                  Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
