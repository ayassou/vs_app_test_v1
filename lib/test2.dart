import 'package:flutter/material.dart';
import 'package:vs_app_test_v1/test3.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(new MyApp());
}

// This test is about how to use argument on route to pass data between screens

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.brown,
      ),
      // initialRoute: "home",
      // routes: {
      //   "home": (context) => MyHomePage(),
      //   SecondScreen.routeName: (context) => SecondScreen()
      // },

      onGenerateRoute: (settings) {
        if (settings.name == SecondScreen.routeName) {
          final args = settings.arguments as ScreenArgument;
          return _createRoute(
            SecondScreen(title: args.title, message: args.message),
          );
          // Instaed of the _createRoute as above, the default is the following. If you want to check, just comment the above 'return _createRoute' and uncomment the 'return MaterialPageRoute...'

          // return MaterialPageRoute(builder: (context) {0
          //   return SecondScreen(
          //     title: args.title,
          //     message: args.message,
          //   );
          // });
        }
      },

      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel in vertical scrollable'),
      ),
      body: Container(
        child: OutlinedButton(
            onPressed: (() {
              Navigator.pushNamed(context, SecondScreen.routeName,
                  arguments: ScreenArgument("Papa est bon", "2"));
            }),
            child: Text("Click me")),
      ),
    );
  }
}

class ScreenArgument {
  final String title;
  final String message;
  ScreenArgument(this.message, this.title);
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 400),
    reverseTransitionDuration: Duration(milliseconds: 285),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset(0.0, 0.0);
      const curve = Curves.easeOutSine;
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

// This is the second screen

class SecondScreen extends StatefulWidget {
  final String title;
  final String message;
  const SecondScreen({super.key, required this.title, required this.message});
  static const routeName = '/SecondScreen';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as ScreenArgument;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Navigator passing data test"),
      ),
      body: Container(
        child: Column(
          children: [Text(widget.title), Text(widget.message)],
        ),
      ),
    );
  }
}
