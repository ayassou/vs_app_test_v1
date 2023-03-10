import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  static const List<String> textSuggestions = [
    r"<$220.000",
    "For sale",
    "3-4 beds",
    "Los Angeles",
    "Studio",
    "Small house",
    "45ft^2"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: RawMaterialButton(
                  constraints: BoxConstraints(minHeight: 45.0, minWidth: 45.0),
                  onPressed: (() {}),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black54, width: 0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    size: 30.0,
                    Icons.sort,
                    color: Colors.blueGrey,
                  ),
                ),
                trailing: RoundedButton(
                  icon: Icons.search,
                  // iconColor: Colors.blue,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "City",
                  style: TextStyle(color: Colors.black54, fontSize: 10),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                height: 46.0,
                child: Text("San Francisco",
                    style: TextStyle(fontSize: 30), textAlign: TextAlign.left),
              ),
              Divider(
                color: Colors.black12,
              ),
              SizedBox(
                height: 25.0,
              ),
              SizedBox(
                height: 40.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: ((context, index) {
                    return Row(
                      children: [
                        // RoundedButton(
                        //   textSuggestions: textSuggestions[index],
                        // ),
                        Chip(
                          label: Text(textSuggestions[index]),
                          padding: const EdgeInsets.all(12.0),
                          backgroundColor: Colors.black12,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                // height: 200.0,
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return RealCard(itemIndex: index + 1);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final Color? iconColor;
  final Function? onPressed;
  final IconData? icon;
  final Color? fillColor;
  final String? textSuggestions;
  RoundedButton(
      {this.icon,
      this.onPressed,
      this.iconColor,
      this.fillColor,
      this.textSuggestions});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: fillColor,
      constraints: BoxConstraints(minHeight: 45.0, minWidth: 45.0),
      onPressed: (() {}),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black54, width: 0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: icon != null
          ? Icon(
              icon,
              size: 20,
              color: iconColor ?? Colors.black,
            )
          : textSuggestions != null
              ? Text(
                  textSuggestions!,
                )
              : null,
    );
  }
}

class RealCard extends StatelessWidget {
  final int itemIndex;
  RealCard({required this.itemIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              // alignment: Alignment.center,
              // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: 500,
              height: 200,
              child: Card(
                elevation: 0.0,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset(
                  "assets/image0$itemIndex.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RoundedButton(
                icon: Icons.favorite_border_rounded,
                fillColor: Colors.white,
              ),
            )
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            Text(
              r"$200.000",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'Jenison, MI 49423, SF',
              style: TextStyle(fontSize: 15.0, color: Colors.black54),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          '4 bedrooms/2 bathrooms/1416 ft^2 exampleeeee',
          style: TextStyle(fontSize: 15.0),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}
