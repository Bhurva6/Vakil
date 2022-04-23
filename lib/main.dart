import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'package:vakil/page/new_message_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vakil Help',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  FloatingActionButtonLocation location = FloatingActionButtonLocation.endFloat;

  final locations = [
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.startDocked,
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
        floatingActionButton: buildActionButton(),
        floatingActionButtonLocation: location,
      );

  Widget buildActionButton() {
    switch (index) {
      default:
        return buildMessageButton();
    }
  }

  Widget buildNavigateButton() => FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.yellow,
        onPressed: () {
          print('Pressed');
        },
      );

  Widget buildMessageButton() => FloatingActionButton(
      foregroundColor: Colors.white,
      backgroundColor: Colors.orange,
      child: Icon(Icons.message),
      onPressed: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => MessagePage()));
      });
}
