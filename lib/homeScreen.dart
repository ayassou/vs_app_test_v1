import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'detailScreen.dart';

import 'package:vs_app_test_v1/detailScreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const List<String> textSuggestions = [
    r"<$220.000",
    "For sale",
    "3-4 beds",
    "Los Angeles",
    "Studio",
    "Small house",
    "45ft^2"
  ];
//  var controller = ScrollController();
  List<bool?> state = [false, false, false, false, false, false];
  //  state.length = 6;
  @override
  Widget build(BuildContext context) {
    // false, false, true, false, false, false

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: ListTile(
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
                color: Colors.black,
              ),
            ),
            trailing: RoundedButton(
              icon: Icons.search,
              // iconColor: Colors.blue,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(secondary: Color.fromARGB(255, 166, 156, 156))),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  toolbarHeight: 70.0,
                  flexibleSpace: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "City",
                          style: TextStyle(color: Colors.black54, fontSize: 10),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "San Francisco",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // SizedBox(
                      //   height: 8.0,
                      // )
                    ],
                  ),
                ),
                // expandedHeight: 30,
                // collapsedHeight: 150,
                SliverAppBar(
                  // expandedHeight: 20.0,
                  // collapsedHeight: 100.0,
                  pinned: true,
                  toolbarHeight: 73.0,
                  backgroundColor: Colors.white,
                  flexibleSpace: Column(
                    children: [
                      Divider(
                        color: Colors.black12,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 40.0,
                        child: ListView.builder(
                          // padding: EdgeInsets.all(8.0),
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                InkWell(
                                  child: FilterChip(
                                    // onSelected: null,
                                    pressElevation: 15.0,
                                    onSelected: (value) {
                                      setState(() {
                                        state[index] = value;
                                        // print(state);
                                      });
                                    },
                                    selected: state[index] ?? false,
                                    disabledColor: Colors.blue,
                                    selectedColor: Colors.amber,
                                    label: Text(textSuggestions[index]),
                                    padding: const EdgeInsets.all(12.0),
                                    backgroundColor: Color(0xFFf6f7fc),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  // toolbarHeight: 25.0,
                  // backgroundColor: Colors.white,
                  // flexibleSpace:
                  child: SizedBox(
                    height: 25.0,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return RealCard(itemIndex: index + 1);
                    },
                    childCount: 5, // 1000 list items
                  ),
                ),
              ],
            ),
          ),
        ));
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
                child: Ink.image(
                  image: AssetImage("assets/image0$itemIndex.jpg"),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: (() {
                      // print("Card $itemIndex");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return DetailedEstatesView(itemIndex: itemIndex);
                        }),
                      );
                    }),
                  ),
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
