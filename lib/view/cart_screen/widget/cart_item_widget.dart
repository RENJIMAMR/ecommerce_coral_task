import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {super.key,
      required this.title,
      required this.qty,
      required this.price,
      this.image,
      this.onIncrement,
      this.onDecrement,
      this.onRemove});
  final String title, qty;
  final num price;
  final String? image;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueGrey.withOpacity(.2)),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              height: 120,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(image!)),
                  color: Colors.blueGrey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Text(
                  title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  price.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      
                      children: [
                        SizedBox(
                          height: 30,
                          width: 55,
                          child: ElevatedButton(
                              onPressed: onDecrement,
                              child: Center(
                                  child: Text(
                                '-',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          qty,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        SizedBox(
                          height: 30,
                          width: 55,
                          child: ElevatedButton(
                              onPressed: onIncrement,
                              child: Center(
                                  child: Text(
                                '+',
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.bold),
                              ))),
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: onRemove,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
