import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                "TimeTrove Watches",
                style: GoogleFonts.abel(
                  textStyle: const TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: ListTile(
              leading: Icon(Icons.home, color: Colors.black),
              title: Text(
                "Home",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: Text(
                "About",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.black),
              title: Text(
                "Cart",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.black),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
