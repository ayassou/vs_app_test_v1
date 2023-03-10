import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// class DetailedScreen extends StatelessWidget {
//   int? itemIndex = 0;
//   DetailedScreen({this.itemIndex});

//   @override
//   Widget build(BuildContext context) {
//     return DetailedEstatesView();
//     // Container(
//     //   color: Colors.purple,
//     // );
//   }
// }

class DetailedEstatesView extends StatelessWidget {
  DetailedEstatesView({this.itemIndex = 0});
  int itemIndex;
  List<double> houseDetail = [1.146, 4, 2, 2, 8, 9];
  List<String> houseDetailInfo = [
    "Square foot",
    "Bedrooms",
    "Bathrooms",
    "Garage",
    "Toilet",
    "Kitchen"
  ];
  // late final bool enabled;
  @override
  Widget build(BuildContext context) {
    // final VoidCallback? onPressed = enabled ? () {} : null;
    final ColorScheme colors = Theme.of(context).colorScheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "The realestate app",
      // theme: ThemeData(useMaterial3: true),
      // home: test_detailed_screen(colors: colors, itemIndex: itemIndex),
      home: final_detailed_screen(
        colors: colors,
        houseDetail: houseDetail,
        houseDetailInfo: houseDetailInfo,
        itemIndex: itemIndex,
      ),
    );
  }
}

class final_detailed_screen extends StatelessWidget {
  const final_detailed_screen(
      {Key? key,
      required this.colors,
      required this.houseDetail,
      required this.houseDetailInfo,
      this.itemIndex})
      : super(key: key);

  final ColorScheme colors;
  final List<double> houseDetail;
  final List<String> houseDetailInfo;
  final itemIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orangeAccent,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            toolbarHeight: 70.0,
            expandedHeight: 300.0,
            pinned: true,
            leadingWidth: 86.0,
            leading: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 15.0),
              child: OutlinedButton(
                onPressed: (() {}),
                child: Icon(
                  Icons.arrow_back,
                  color: colors.onPrimary,
                  size: 22.0,
                ),
                style: IconButton.styleFrom(
                  // padding: EdgeInsets.zero,
                  focusColor: colors.onSecondary,
                  highlightColor: colors.onPrimary.withOpacity(0.5),
                  side: BorderSide(
                    width: 0.5,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15.0),
            //       border: Border.all(color: Colors.red)),
            //   // color: Colors.blue,
            //   margin: EdgeInsets.only(left: 25.0),
            //   child: IconButton(
            //     // constraints: BoxConstraints(minHeight: 45.0, minWidth: 45.0),
            //     style: IconButton.styleFrom(
            //         side: BorderSide(color: Colors.blue),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10.0))),
            //     splashRadius: 26.0,
            //     // alignment: Alignment.center,
            //     padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            //     icon: const Icon(Icons.favorite_border),
            //     tooltip: 'Open shopping cart',
            //     onPressed: () {
            //       // handle the press
            //     },
            //   ),
            // ),
            // Container(
            //   color: Colors.blue,
            //   margin: EdgeInsets.only(left: 20.0),
            //   child: IconButton(
            //     // constraints: BoxConstraints(minHeight: 45.0, minWidth: 45.0),
            //     style: IconButton.styleFrom(
            //       side: BorderSide(color: Colors.blue),
            //     ),
            //     splashRadius: 26.0,
            //     // alignment: Alignment.center,
            //     // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            //     icon: const Icon(Icons.favorite_border),
            //     tooltip: 'Open shopping cart',
            //     onPressed: () {
            //       // handle the press
            //     },
            //   ),
            // ),
            actions: [
              Container(
                width: 60.0,
                padding: EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
                margin: EdgeInsets.only(right: 13.0),
                child: OutlinedButton(
                  onPressed: (() {}),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: colors.onPrimary,
                    size: 22.0,
                  ),
                  style: IconButton.styleFrom(
                    // padding: EdgeInsets.all(15.0),
                    focusColor: colors.onSecondary,
                    highlightColor: colors.onPrimary.withOpacity(0.5),
                    side: BorderSide(
                      width: 0.5,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(right: 25.0),
              //   child: IconButton(
              //     // constraints: BoxConstraints(minHeight: 45.0, minWidth: 45.0),
              //     style: IconButton.styleFrom(
              //         side: BorderSide(color: Colors.blue),
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10.0))),
              //     splashRadius: 26.0,
              //     // alignment: Alignment.center,
              //     padding:
              //         EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
              //     icon: const Icon(Icons.favorite_border),
              //     tooltip: 'Open shopping cart',
              //     onPressed: () {
              //       // handle the press
              //     },
              //   ),
              // ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: CarousselView(
                itemIndex: itemIndex,
              ),
              //     CarouselSlider.builder(
              //   options: CarouselOptions(
              //     enableInfiniteScroll: true,
              //     autoPlay: true,
              //     viewportFraction: 6.0,
              //     aspectRatio: 1,
              //     // height: MediaQuery.of(context).size.height,
              //   ),
              //   itemCount: 6,
              //   itemBuilder: (BuildContext context, int itemIndex,
              //           int pageViewIndex) =>
              //       Container(
              //     child: Image.asset(
              //       "assets/image04.jpg",
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Container(
          //         color: index.isOdd ? Colors.white : Colors.black12,
          //         height: 100.0,
          //         child: Center(
          //           child: Text('$index', textScaleFactor: 5),
          //         ),
          //       );
          //     },
          //     childCount: 20,
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Detail_info_body(
                houseDetail: houseDetail, houseDetailInfo: houseDetailInfo),
          ),
        ],
      ),

      // body: SafeArea(
      //   child: Detail_info_body(houseDetail: houseDetail, houseDetailInfo: houseDetailInfo),
    );
  }
}

class Detail_info_body extends StatelessWidget {
  const Detail_info_body({
    Key? key,
    required this.houseDetail,
    required this.houseDetailInfo,
  }) : super(key: key);

  final List<double> houseDetail;
  final List<String> houseDetailInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        r"$200.000",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Jenison, Mi 49428, SF",
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Outlined_text(
                  houseDetail: "20 hours ago",
                  padding: EdgeInsets.all(11.0),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text("House information"),
            SizedBox(
              height: 35.0,
            ),
            SizedBox(
              height: 130.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: ((context, index) {
                  return Row(
                    children: [
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Outlined_text(houseDetail: houseDetail[index]),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text("${houseDetailInfo[index]}"),
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              child: Text(
                "INFO: la maison est constituée de 03 chambres. Elle est située au bord de la mer, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tellus molestie nunc non blandit massa enim nec. Nunc sed blandit libero volutpat. Egestas erat imperdiet sed euismod nisi porta lorem. Ullamcorper sit amet risus nullam eget felis. Aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque. Aliquet porttitor lacus luctus accumsan tortor posuere. Pellentesque habitant morbi tristique senectus et netus et malesuada. Et odio pellentesque diam volutpat commodo sed egestas. Faucibus in ornare quam viverra. Lacus vestibulum sed arcu non odio euismod lacinia. Fringilla ut morbi tincidunt augue interdum velit euismod. Eget nullam non nisi est sit amet facilisis magna. Euismod nisi porta lorem mollis aliquam. Accumsan sit amet nulla facilisi. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Consectetur adipiscing elit ut aliquam purus sit amet luctus. Lobortis elementum nibh tellus molestie nunc non blandit massa enim. Morbi tristique senectus et netus. Adipiscing elit duis tristique sollicitudin nibh sit. Nunc sed augue lacus viverra. In ornare quam viverra orci sagittis eu volutpat odio. At tellus at urna condimentum mattis pellentesque. Risus in hendrerit gravida rutrum quisque non tellus. Commodo elit at imperdiet dui accumsan sit amet nulla. Facilisi etiam dignissim diam quis enim. Enim eu turpis egestas pretium aenean pharetra magna. Dui id ornare arcu odio. Ipsum dolor sit amet consectetur. Varius sit amet mattis vulputate enim nulla aliquet porttitor lacus. Euismod lacinia at quis risus sed vulputate. Nec ultrices dui sapien eget mi. Risus viverra adipiscing at in tellus integer feugiat scelerisque varius. Sodales neque sodales ut etiam sit amet. Arcu cursus vitae congue mauris rhoncus aenean.",
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Outlined_text extends StatelessWidget {
  const Outlined_text({Key? key, required this.houseDetail, this.padding})
      : super(key: key);

  final houseDetail;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 15.0),
      padding: padding ?? EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border:
            Border.all(color: Color.fromARGB(255, 198, 199, 202), width: 1.5),
      ),
      child: Text("${houseDetail}"),
    );
  }
}

class CarousselView extends StatefulWidget {
  final int itemIndex;
  CarousselView({this.itemIndex = 0});

  @override
  State<CarousselView> createState() => _CarousselViewState();
}

class _CarousselViewState extends State<CarousselView>
    with SingleTickerProviderStateMixin {
  int _index = 0;

  TabController? controller;
  late PageController _controller;

  @override
  void initState() {
    controller = TabController(
      length: 6,
      vsync: this,
    );
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 100,
          controller: PageController(
            initialPage: 42 + widget.itemIndex,
            viewportFraction: 1,
          ),
          // controller: _controller,
          onPageChanged: (int index) => setState(() {
            // controller!.index = index % 6;
            // _index = index;
            print(index);
            index = index % 6;
            controller!.index = index;
          }),
          itemBuilder: (_, i) {
            // return Card(
            //   elevation: 6,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20)),
            //   child: Center(
            //     child: Text(
            //       "Card ${i}",
            //       style: TextStyle(fontSize: 32),
            //     ),
            //   ),
            // );
            return Image.asset(
              "assets/image0${i % 6}.jpg",
              fit: BoxFit.cover,
            );
          },
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: TabPageSelector(
            indicatorSize: 6.0,
            controller: controller,
            color: Colors.grey,
            selectedColor: Colors.white,
            borderStyle: BorderStyle.none,
          ),
        )
      ],
    );
  }
}

class test_detailed_screen extends StatelessWidget {
  const test_detailed_screen({
    Key? key,
    required this.colors,
    required this.itemIndex,
  }) : super(key: key);

  final ColorScheme colors;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        toolbarHeight: 300.0,
        leading: Container(
          alignment: Alignment.topLeft,
          // child: IconButton(
          //   icon: const Icon(Icons.filter_drama),
          //   onPressed: () {},
          //   style: IconButton.styleFrom(
          //     focusColor: colors.onSurfaceVariant.withOpacity(0.12),
          //     highlightColor: colors.onSurface.withOpacity(0.12),
          //     side: () {} == null
          //         ? BorderSide(
          //             color: Theme.of(context)
          //                 .colorScheme
          //                 .onSurface
          //                 .withOpacity(0.12))
          //         : BorderSide(color: colors.outline),
          //   ).copyWith(
          //     foregroundColor: MaterialStateProperty.resolveWith(
          //         (Set<MaterialState> states) {
          //       if (states.contains(MaterialState.pressed)) {
          //         return colors.onSurface;
          //       }
          //       return null;
          //     }),
          //   ),
          // ),
          child: OutlinedButton(
            onPressed: (() {}),
            child: Icon(
              Icons.arrow_back,
              color: colors.onPrimary,
            ),
            style: IconButton.styleFrom(
              padding: EdgeInsets.all(15.0),
              focusColor: colors.onSecondary,
              highlightColor: colors.onPrimary.withOpacity(0.10),
              side: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ),
        // child: IconButton(
        //   style: TextButton.styleFrom(
        //     side: BorderSide(color: Colors.white),
        //   ),
        //   // style: IconButton.styleFrom(
        //   //   shape: RoundedRectangleBorder(
        //   //     side: BorderSide(color: Colors.white),
        //   //     borderRadius: BorderRadius.circular(10.0),
        //   //   ),
        //   // ),
        //   // alignment: Alignment.center,
        //   // padding: EdgeInsets.all(10.0),
        //   icon: const Icon(Icons.arrow_back),
        //   tooltip: 'Open shopping cart',
        //   onPressed: () {
        //     // handle the press
        //   },
        // ),

        actions: [
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              icon: const Icon(Icons.favorite_border),
              tooltip: 'Open shopping cart',
              onPressed: () {
                // handle the press
              },
            ),
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: CarouselSlider.builder(
            options: CarouselOptions(
              enableInfiniteScroll: true,
              autoPlay: true,
              initialPage: itemIndex,
            ),
            itemCount: 6,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              child: Image.asset(
                "assets/image04.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // CarousselView(
          //   itemIndex: itemIndex,
          // ),

          // Image.asset(
          //   "assets/image04.jpg",
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
      body: Expanded(
        child: Container(
          color: Colors.brown,
        ),
      ),
    );
  }
}


//--The old carouselView used with the commented home ---

// class CarousselView extends StatefulWidget {
//   int itemIndex;
//   CarousselView({required this.itemIndex});

//   @override
//   State<CarousselView> createState() => _CarousselViewState();
// }

// class _CarousselViewState extends State<CarousselView>
//     with SingleTickerProviderStateMixin {
//   int _index = 1;
//   TabController? controller;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller = TabController(
//       length: 6,
//       vsync: this,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         PageView.builder(
//           itemCount: 6,
//           controller: PageController(
//               viewportFraction: 1, initialPage: widget.itemIndex),
//           onPageChanged: (int index) => setState(() {
//             _index = index;
//             controller!.index = index;
//           }),
//           itemBuilder: (_, i) {
//             return Transform.scale(
//               scale: i == _index ? 1 : 1,
//               child: Image.asset(
//                 "assets/image0${_index}.jpg",
//                 fit: BoxFit.fill,
//               ),
//               // child: Card(
//               //   elevation: 6,
//               //   shape: RoundedRectangleBorder(
//               //       borderRadius: BorderRadius.circular(20)),
//               //   child: Center(
//               //     child: Text(
//               //       "Card ${i + 1}",
//               //       style: TextStyle(fontSize: 32),
//               //     ),
//               //   ),
//               // ),
//             );
//           },
//         ),
//         Container(
//           alignment: Alignment.bottomCenter,
//           child: TabPageSelector(
//             indicatorSize: 6.0,
//             controller: controller,
//           ),
//         )
//       ],
//     );
//   }
// }
