import 'package:flutter/material.dart';
import 'package:shopping_application/dress_detailing_screen/dress_detailing_screen.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List dresspic = [
      'https://images.pexels.com/photos/794062/pexels-photo-794062.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/2235071/pexels-photo-2235071.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/833185/pexels-photo-833185.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1936854/pexels-photo-1936854.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1375849/pexels-photo-1375849.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'https://images.pexels.com/photos/206395/pexels-photo-206395.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/839011/pexels-photo-839011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'https://images.pexels.com/photos/868113/pexels-photo-868113.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1183266/pexels-photo-1183266.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1416736/pexels-photo-1416736.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/459957/pexels-photo-459957.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/459976/pexels-photo-459976.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/969373/pexels-photo-969373.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1648377/pexels-photo-1648377.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1166473/pexels-photo-1166473.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1619801/pexels-photo-1619801.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/36039/baby-twins-brother-and-sister-one-hundred-days.jpg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1068209/pexels-photo-1068209.jpeg?auto=compress&cs=tinysrgb&w=600',
    ];
    List brand = [
      'Zaara ',
      'RRDHI ',
      'Max ',
      'Zudio',
      'Trends',
      'Max',
      'Zudio',
      'Address',
      'Address',
      'Trends',
      'Trends',
      'First Cry',
      'Trends',
      'First Cry',
      'First Cry',
      'Trends',
      'Trends',
      'Trends',
      'Trends',
    ];
    List price = [
      '5500/-',
      '3999/-',
      '2678/-',
      '3000/-',
      '1600/-',
      '4999/-',
      '1999/-',
      '2999/-',
      '7889/-',
      ' 799/- ',
      '1099/-',
      '399/-',
      '699/-',
      '2099/-',
      '1854/-',
      '2765/-',
      '489/-',
      '599/-',
      '799/-',
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
          Padding(
            padding: const EdgeInsets.all(19),
            child: Stack(children: [
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
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: Text(
                    '  All  ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 40,
                  // width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Text(
                    '   Men  ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 40,
                  // width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Text(
                    '  Women  ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 40,
                  // width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Text(
                    '  Kids  ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 40,
                  // width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Text(
                    '  New Born  ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailingScreen()));
                print('ontapped to detailing  screen');
              },
              onDoubleTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailingScreen()));
                print('on double tapped to detailing  screen');
              },
              onLongPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailingScreen()));
                print('on long pressed to detailing  screen');
              },
              child: GridView.builder(
                  itemCount: dresspic.length,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 260),
                  itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(dresspic[index]),
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
                                    borderRadius: BorderRadius.circular(6),
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
                            brand[index],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            price[index],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
