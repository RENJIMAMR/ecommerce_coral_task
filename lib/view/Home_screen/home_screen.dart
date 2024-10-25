import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_application/controller/homescreen_controller.dart';
import 'package:shopping_application/view/cart_screen/cart_screen.dart';
import 'package:shopping_application/view/detailing_screen/detailing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomescreenController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(HomescreenController());
    controller.getCategories();
    controller.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Discover',
            selectionColor: Colors.black,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CartScreen());
            },
            icon: Icon(
              Icons.shopping_bag,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: GetBuilder<HomescreenController>(
        builder: (controller) {
          // loading indicator for categories
          if (controller.isCategoriesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          // If categories are empty
          if (controller.categoriesList.isEmpty) {
            return Center(child: Text('No categories available'));
          }

          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(11),
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.withOpacity(.2),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.black, size: 29),
                            SizedBox(width: 10),
                            Text(
                              'Search anything',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 47,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                      child: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
             
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: List.generate(
                      controller.categoriesList.length,
                      (index) => Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.getCategoryIndex(index);
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == controller.selectedCategoryIndex
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              child: Text(
                                controller.categoriesList[index].toUpperCase(),
                                style: TextStyle(
                                  fontSize: 18,
                                  color:
                                      index == controller.selectedCategoryIndex
                                          ? Colors.white
                                          : Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: GridView.builder(
                  itemCount: controller.productList.length,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 300,
                  ),
                  itemBuilder: (context, index) {
                    var product = controller.productList[index];
                    return InkWell(
                      onTap: () {
                        Get.to(DetailingScreen(id: product.id!));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade400)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(product.image ?? ""),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              product.title ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '\$${product.price?.toStringAsFixed(2) ?? ""}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
