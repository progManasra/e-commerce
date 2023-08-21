import 'package:e_course/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String count;
  final String price;
  const PriceAndCountItems(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(bottom: 2),
              width: 50,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text(
                count,
                style: TextStyle(fontSize: 20, height: 1.1),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
          ],
        ),
        Spacer(),
        Text(
          "$price \$",
          style: TextStyle(
              color: AppColor.primaryColor, fontSize: 30, height: 1.1),
        ),
      ],
    );
  }
}
