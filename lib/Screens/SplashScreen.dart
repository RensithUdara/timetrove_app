import 'package:ecommerce_app/Screens/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _splashAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _splashAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_splashAnimation);

    _splashAnimation.forward();
  }

  @override
  void dispose() {
    _splashAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _splashAnimation,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: child,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01),
              child: Center(
                child: Text(
                  "TimeTrove Watches",
                  style: GoogleFonts.abel(
                    textStyle: TextStyle(
                      fontSize: screenWidth * 0.1, // Responsive font size
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(
              width: screenWidth * 0.8,
              height: screenHeight * 0.5,
              child: Image.asset(
                "assets/images/splas.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08,
              ),
              child: const Text(
                "Top Brand Watches For The Real Gentleman",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35, // Adjust if needed for smaller screens
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(
              width: screenWidth * 0.8,
              height: screenHeight * 0.08,
              child: TextButton.icon(
                style: TextButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homescreen(),
                      ));
                },
                icon: const SizedBox.shrink(), // Placeholder for icon
                label: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
