import 'package:flutter/material.dart';

class Sliderwidget extends StatefulWidget {
  const Sliderwidget({super.key});

  @override
  State<Sliderwidget> createState() => _SliderwidgetState();
}

class _SliderwidgetState extends State<Sliderwidget> {
  List<String> optionlist = [
    "Featured",
        "Editor's Pick",
        "Top Rated",
        "Hot Deals",
        "Limited Edition",
        "Must Have",
        "Exclusive",
        "Just In",
        "Fan Favorites",
        "Top Seller",
        "Recommended",
        "New Arrivals",
        "Bestselling",
        "On Sale",
        "Most Popular",
        "Staff Pick",
        "Limited Time",
        "Top Choice",
        "Seasonal Picks",
        "Exclusive Offer",
  ];
  int selectedindex = -1;
  @override
  Widget build(BuildContext context) {
    
    return  Row(
        children: optionlist.asMap().entries.map((watches) {
          int entry = watches.key;
          String catagory = watches.value;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedindex = entry;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedindex == entry ? Colors.black : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                catagory,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        selectedindex == entry ? Colors.white : Colors.white, fontSize: 20),
              ),
            ),
          );
        }).toList(),
      );
    
  }
}
