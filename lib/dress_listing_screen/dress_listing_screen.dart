import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/cart_screen/cart_screen.dart';
import 'package:shopping_application/controller/homescreen_controller.dart';
import 'package:shopping_application/dress_detailing_screen/dress_detailing_screen.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> itemdetails = [
      {
        'url':
            'https://images.pexels.com/photos/794062/pexels-photo-794062.jpeg?auto=compress&cs=tinysrgb&w=600',
        'brand': 'Zaara ',
        "price": 'INR 5500/-',
        "rating": '4.9/5',
        'review': '(130 reviews)',
        'description':
            ' (The name says it all,trending casual wear collection from Zaara.Which includes an Overcoat, Full sleeved,high necked top with embroided Rose flower and a checked mini skirt )'
      },
      {
        'url':
            'https://images.pexels.com/photos/2235071/pexels-photo-2235071.jpeg?auto=compress&cs=tinysrgb&w=600',
        "brand": 'RRDHI ',
        'price': 'INR 3999/-',
        "rating": '4.5/5',
        'review': '(100 reviews)',
        'description':
            ' (trending casual wear collection from Zaara.Which includes an Overcoat, Full sleeved,high necked top with embroided Rose flower and a checked mini skirt )'
      },
      {
        'url':
            'https://images.pexels.com/photos/833185/pexels-photo-833185.jpeg?auto=compress&cs=tinysrgb&w=600',
        'brand': 'Max ',
        'price': 'INR 2678/-',
        "rating": '4/5',
        'review': '(10 reviews)',
        'description':
            ' (trending casual wear collection from Max.Which includes an Overcoat, Full sleeved,high necked top with embroided Rose flower and a checked mini skirt )'
      },
      {
        'url':
            'https://images.pexels.com/photos/1936854/pexels-photo-1936854.jpeg?auto=compress&cs=tinysrgb&w=600',
        'brand': 'Zudio',
        'price': 'INR 3000/-',
        "rating": '3.9/5',
        'review': '(23 reviews)',
        'description':
            ' (trending casual wear collection from Zudio.Which includes an Overcoat, Full sleeved,high necked top with embroided Rose flower and a checked mini skirt )'
      },
      {
        'url':
            'https://images.pexels.com/photos/1375849/pexels-photo-1375849.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        'brand': 'Trends',
        'price': 'INR 1600/-',
        "rating": '4.5/5',
        'review': '(1000 reviews)',
        'description':
            ' (trending casual wear collection from Trends.Which includes an Overcoat, Full sleeved,high necked top with embroided Rose flower and a checked mini skirt )'
      },
      {
        'url':
            'https://images.pexels.com/photos/206395/pexels-photo-206395.jpeg?auto=compress&cs=tinysrgb&w=600',
        'brand': 'Max',
        'price': 'INR 4999/-',
        "rating": '2.8/5',
        'review': '(56 reviews)',
        'description':
            ' (trending casual wear collection from Max.Which includes an Overcoat, Full sleeved,high necked top with embroided Rose flower and a checked mini skirt )'
      },
      {
        'url':
            'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=600',
        'brand': 'Zudio',
        'price': 'INR 1999/-',
        "rating": '4.5/5',
        'review': '(97 reviews)',
        'description':
            ' (trending casual wear collection from Zudio.Which includes an Overcoat, Full sleeved,high necked top with embroided Rose flower and a checked mini skirt )'
      },
      {
        'url':
            'https://images.pexels.com/photos/839011/pexels-photo-839011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        'brand': 'Address',
        'price': 'INR 2999/-',
        "rating": '4.9/5',
        'review': '(40k reviews)',
        'description':
            ' (trending casual wear collection from Address.Which includes an Overcoat, Full sleeved,high necked top with embroided Rose flower and a checked mini skirt )'
      },
      // {
      //   'url':
      //       'https://images.pexels.com/photos/868113/pexels-photo-868113.jpeg?auto=compress&cs=tinysrgb&w=600',
      //   'brand': 'Address',
      //   'price': 'INR 7889/-',
      // },
      // {
      //   'url':
      //       'https://images.pexels.com/photos/1183266/pexels-photo-1183266.jpeg?auto=compress&cs=tinysrgb&w=600',
      //   'brand': 'Trends',
      //   'price': 'INR 799/- ',
      // },
      // {
      //   'url':
      //       'https://images.pexels.com/photos/1416736/pexels-photo-1416736.jpeg?auto=compress&cs=tinysrgb&w=600',
      //   'brand': 'Trends',
      //   'price': 'INR 1099/-',
      // },
      // {
      //   'url':
      //       'https://images.pexels.com/photos/459957/pexels-photo-459957.jpeg?auto=compress&cs=tinysrgb&w=600',
      //   'brand': 'First Cry',
      //   'price': 'INR 399/-',
      // },
      // {
      //   'url':
      //       'https://images.pexels.com/photos/459976/pexels-photo-459976.jpeg?auto=compress&cs=tinysrgb&w=600',
      //   'brand': 'Trends',
      //   'price': 'INR 699/-',
      // },
      // {
      //   'url':
      //       'https://images.pexels.com/photos/969373/pexels-photo-969373.jpeg?auto=compress&cs=tinysrgb&w=600',
      //   'brand': 'First Cry',
      //   'price': 'INR 2099/-',
      // },
      // {
      //   'url':
      //       'https://images.pexels.com/photos/1648377/pexels-photo-1648377.jpeg?auto=compress&cs=tinysrgb&w=600',
      //   'brand': 'Trends',
      //   'price': 'INR 1854/-',
      // },
      // {
      //   'url':
      //       'https://images.pexels.com/photos/1166473/pexels-photo-1166473.jpeg?auto=compress&cs=tinysrgb&w=600',
      //   'brand': 'Trends',
      //   'price': 'INR 2765/-',
      // },
      // {
      //   'url':
      //       'https://images.pexels.com/photos/1619801/pexels-photo-1619801.jpeg?auto=compress&cs=tinysrgb&w=600',
      //   'brand': 'Trends',
      //   'price': 'INR 489/-',
      // },
      // {
      //   'url':
      //       'https://images.pexels.com/photos/36039/baby-twins-brother-and-sister-one-hundred-days.jpg?auto=compress&cs=tinysrgb&w=600',
      //   'brand': 'Trends',
      //   'price': 'INR 599/-',
      // },
      // {
      //   'url':
      //       'https://images.pexels.com/photos/1068209/pexels-photo-1068209.jpeg?auto=compress&cs=tinysrgb&w=600',
      //   'brand': 'Trends',
      //   'price': 'INR 799/-',
      // }
    ];

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
                            itemCount: itemdetails.length,
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
                                                  url: homeProv
                                                          .productList[index]
                                                          .image
                                                          .toString() ??
                                                      '',
                                                  brand: homeProv
                                                          .productList[index]
                                                          .title
                                                          .toString() ??
                                                      '',
                                                  price:
                                                      '₹${homeProv.productList[index].price.toString()}' ??
                                                          '',
                                                  rating: homeProv
                                                          .productList[index]
                                                          .rating
                                                          .toString() ??
                                                      '',
                                                  review: '',
                                                  description: homeProv
                                                          .productList[index]
                                                          .description
                                                          .toString() ??
                                                      '',
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
