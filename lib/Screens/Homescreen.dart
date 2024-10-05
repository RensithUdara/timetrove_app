import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/Model/datamodel1.dart';
import 'package:ecommerce_app/Screens/detailscreen.dart';
import 'package:ecommerce_app/Screens/favoritescreen.dart';
import 'package:ecommerce_app/Widgets/Drawer.dart';
import 'package:ecommerce_app/Widgets/Sliderwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentIndex = 0;

  final List<Widget> _screens = [
    const HomeContentScreen(),
    const Favoritescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag,
              color: Colors.black,
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        title: Center(
          child: Text(
            "TimeTrove Watches",
            style: GoogleFonts.abel(
              textStyle: TextStyle(
                fontSize: screenWidth * 0.08,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: _screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        key: GlobalKey<CurvedNavigationBarState>(),
        items: const <Widget>[
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.favorite, color: Colors.white),
        ],
        color: Colors.black,
        backgroundColor: Colors.white,
        animationCurve: Curves.bounceInOut,
        animationDuration: const Duration(milliseconds: 600),
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        letIndexChange: (value) => true,
      ),
      drawer: const CustomDrawer(),
    );
  }
}

class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({super.key});

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<HomeContentScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animationController.forward();
  }

  List<Datamodel1> watchlist = [
    Datamodel1(
        imageurl: "assets/images/watch 11.png",
        pricing: "199.25",
        title: "Tangente"),
    Datamodel1(
        imageurl: "assets/images/watch 22.png",
        pricing: "285.95",
        title: "Tangente 33 duo"),
    Datamodel1(
        imageurl: "assets/images/watch 33.png",
        pricing: "250.00",
        title: "Tangente 33"),
    Datamodel1(
        imageurl: "assets/images/watch 44.png",
        pricing: "290.75",
        title: "Tangente 33 gray"),
    Datamodel1(
        imageurl: "assets/images/watch 55.png",
        pricing: "350.95",
        title: "Tangente 33 karat"),
    Datamodel1(
        imageurl: "assets/images/watch 66.png",
        pricing: "400.25",
        title: "Tangente 38 date"),
    Datamodel1(
        imageurl: "assets/images/watch 77.png",
        pricing: "499.99",
        title: "Tangente midnight blue"),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOutQuad,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.02, right: screenWidth * 0.6),
              child: Text(
                "Explore",
                style: GoogleFonts.abhayaLibre(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: screenWidth * 0.1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.2),
              child: Text(
                "Top Brand Watches",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: screenWidth * 0.08,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Sliderwidget(),
            ),
            SizedBox(height: screenHeight * 0.05),
            CarouselSlider(
              options: CarouselOptions(
                height: screenHeight * 0.5,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              items: watchlist.map((watch) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(Detailscreen(
                            model: watch,
                            initialIndex: watchlist.indexOf(watch)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              bottom: -screenHeight * 0.05,
                              left: 0,
                              right: 0,
                              child: Hero(
                                tag: watch.imageurl,
                                child: Image.asset(
                                  watch.imageurl,
                                  height: screenHeight * 0.5,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              top: screenHeight * 0.02,
                              left: screenWidth * 0.05,
                              child: Text(
                                watch.title,
                                style: GoogleFonts.abel(
                                  fontSize: screenWidth * 0.07,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Positioned(
                              top: screenHeight * 0.07,
                              left: screenWidth * 0.05,
                              child: Text(
                                "Rs. ${watch.pricing}",
                                style: GoogleFonts.abel(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
