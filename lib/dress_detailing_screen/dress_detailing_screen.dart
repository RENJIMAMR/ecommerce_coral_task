import 'package:flutter/material.dart';
import 'package:shopping_application/dress_listing_screen/dress_listing_screen.dart';

class DetailingScreen extends StatelessWidget {
  const DetailingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => ListingScreen()));
            print('ontapped to listing screen');
          },
          onDoubleTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListingScreen()));
            print('on double tapped to listing screen');
          },
          onLongPress: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListingScreen()));
            print('on long pressed to listing screen');
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
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
              Icon(
                Icons.notifications_none,
                size: 30,
                color: Colors.black,
              ),
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
              )
            ]),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Container(
                        height: 350,
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(66, 138, 117, 117),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/794062/pexels-photo-794062.jpeg?auto=compress&cs=tinysrgb&w=600'),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            size: 30,
                          ),
                        ),
                      ),
                    ]),
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Casual Office Wears - Zaara',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 25,
                          color: Colors.amber,
                        ),
                        Text(
                          '4.5/5',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          ' (100 reviews)',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(.6)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      ' (The name says it all,trending casual wear collection from Zaara.Which includes an Overcoat, Full sleeved,high necked top with embroided Rose flower and a checked mini skirt )',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 14, color: Colors.black.withOpacity(.6)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Choose Size',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.black.withOpacity(.2), width: 2),
                          ),
                          child: Center(
                            child: Text(
                              'S',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.black.withOpacity(.2), width: 2),
                          ),
                          child: Center(
                            child: Text(
                              'M',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.black.withOpacity(.2), width: 2),
                          ),
                          child: Center(
                            child: Text(
                              'L',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.black.withOpacity(.2), width: 2),
                          ),
                          child: Center(
                            child: Text(
                              'XL',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 20),
            height: 100,
            width: 400,
            decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Colors.black.withOpacity(.2)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      blurRadius: 7,
                      offset: Offset(0, 3))
                ]),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'INR 5500/-',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 45,
                  width: 189,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color.fromARGB(255, 12, 11, 11),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 23,
                      ),
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
