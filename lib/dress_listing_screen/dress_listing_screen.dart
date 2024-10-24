import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/cart_screen/cart_screen.dart';
import 'package:shopping_application/controller/homescreen_controller.dart';
import 'package:shopping_application/dress_detailing_screen/dress_detailing_screen.dart';

class ListingScreen extends StatefulWidget {
  const ListingScreen({super.key});

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomescreenController>(context, listen: false).getCategories();
      Provider.of<HomescreenController>(context, listen: false)
          .getAllProducts();
    });
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
          Stack(children: [
            Icon(
              Icons.notifications_none_sharp,
              size: 30,
              color: Colors.black,
            ),
            Positioned(
              right: 5,
              top: 5,
              child: CircleAvatar(
                radius: 6,
                backgroundColor: Colors.black,
                child: Text(
                  '1',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ]),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
              icon: Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ))
        ],
      ),
      body: Consumer<HomescreenController>(
        builder: (context, homeProv, child) => homeProv.isCategoriesLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13),
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
                                Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 29,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Search anything',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
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
                  //api integrtn

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: List.generate(
                          homeProv.categoriesList.length,
                          (index) => Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  context
                                      .read<HomescreenController>()
                                      .getCategoryindex(index);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        index == homeProv.selectedCategoryIndex
                                            ? Colors.black
                                            : Colors.grey,
                                  ),
                                  child: Text(
                                    homeProv.categoriesList[index]
                                        .toString()
                                        .toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: index ==
                                                homeProv.selectedCategoryIndex
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: homeProv.isProductLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            itemCount: homeProv.productList.length,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 300),
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailingScreen(
                                                  id: homeProv
                                                      .productList[index].id!,
                                                )));
                                    print('ontapped to detailing  screen');
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(.3),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(homeProv
                                                          .productList[index]
                                                          .image
                                                          .toString() ??
                                                      ''),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 10,
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Icon(
                                                Icons.favorite_border,
                                                size: 25,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        maxLines: 1,
                                        homeProv.productList[index].title
                                                .toString() ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text(
                                        " ₹ ${homeProv.productList[index].price ?? 0}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                  ),
                ],
              ),
      ),
    );
  }
}
