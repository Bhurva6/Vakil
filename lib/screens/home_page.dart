import 'package:flutter/material.dart';
import 'package:vakil/widget/bottom_bar.dart';
import 'package:vakil/widget/carousel.dart';
import 'package:vakil/widget/featured_heading.dart';
import 'package:vakil/widget/featured_tiles.dart';
import 'package:vakil/widget/floating_quick_access_bar.dart';
import 'package:vakil/widget/main_heading.dart';
import 'package:vakil/widget/menu_drawer.dart';
import 'package:vakil/widget/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: screenSize.width < 800
          ? AppBar(
              iconTheme: IconThemeData(color: Colors.blue),
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(_opacity),
              title: Text(
                'Vakil Help',
                style: TextStyle(
                  color: Color(0xFF077bd7),
                  fontSize: 26,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height * 0.65,
                    width: screenSize.width,
                    child: Image.asset(
                      'assets/images/background.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize),
                    FeaturedHeading(screenSize: screenSize),
                    FeaturedTiles(screenSize: screenSize),
                    MainHeading(screenSize: screenSize),
                    MainCarousel(),
                    SizedBox(height: screenSize.height / 10),
                    BottomBar(),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
