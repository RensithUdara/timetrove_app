import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/Getxstate/favoritestate.dart';
import 'package:ecommerce_app/Model/datamodel1.dart';
import 'package:ecommerce_app/Model/slidermodel.dart';
import 'package:ecommerce_app/Widgets/quanititywidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen(
      {super.key, required this.model, required this.initialIndex});

  final Datamodel1 model;
  final int initialIndex;

  @override
  _DetailscreenState createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  final List<Slidermodel> productlist = [
    Slidermodel(imageurl: [
      "assets/images/watch 11.png",
      "assets/images/10.png",
      "assets/images/12.png",
      "assets/images/13.png",
    ], name: "product1"),
    Slidermodel(imageurl: [
      "assets/images/watch 22.png",
      "assets/images/21.png",
      "assets/images/22.png",
      "assets/images/23.png"
    ], name: "Product2"),
    Slidermodel(imageurl: [
      "assets/images/watch 33.png",
      "assets/images/31.png",
      "assets/images/32.png",
      "assets/images/33.png"
    ], name: "product3"),
    Slidermodel(imageurl: [
      "assets/images/watch 44.png",
      "assets/images/41.png",
      "assets/images/42.png",
      "assets/images/43.png"
    ], name: "product4"),
    Slidermodel(imageurl: [
      "assets/images/watch 55.png",
      "assets/images/51.png",
      "assets/images/52.png",
      "assets/images/53.png"
    ], name: "product5"),
    Slidermodel(imageurl: [
      "assets/images/watch 66.png",
      "assets/images/61.png",
      "assets/images/62.png",
    ], name: "product6"),
    Slidermodel(imageurl: [
      "assets/images/watch 77.png",
      "assets/images/81.png",
      "assets/images/82.png",
      "assets/images/83.jpg",
    ], name: "product7"),
  ];

  @override
  Widget build(BuildContext context) {
    final String item =
        widget.model.title; // Assuming 'item' is the title of the model

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(widget.model.title),
        ),
        actions: [
          IconButton(
            onPressed: () {
              favoriteController.toggleFavorite(item);
              if (favoriteController.isFavorite(item)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Added to favorites"),
                  ),
                );
              }
            },
            icon: Obx(() {
              return Icon(
                favoriteController.isFavorite(item)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: favoriteController.isFavorite(item)
                    ? Colors.red
                    : Colors.grey,
              );
            }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image slider section
            Container(
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: CarouselSlider.builder(
                itemCount: productlist.length,
                itemBuilder: (context, productIndex, _) {
                  final product = productlist[productIndex];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      CarouselSlider.builder(
                        itemCount: product.imageurl.length,
                        itemBuilder: (context, imageIndex, _) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Hero(
                              tag: product.imageurl[imageIndex],
                              child: Image.asset(
                                product.imageurl[imageIndex],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 350,
                          viewportFraction: 0.8,
                          enlargeCenterPage: true,
                          autoPlay: true,
                        ),
                      ),
                    ],
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  viewportFraction: 1.1,
                  enlargeCenterPage: true,
                  initialPage: widget.initialIndex,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Description section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Description",
                      style: GoogleFonts.abel(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 32, // Adjusted for better readability
                        ),
                      ),
                    ),
                  ),
                  QuantityWidget(),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Description text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "The TimeTrove Watch seamlessly blends timeless elegance with modern functionality. Featuring a sleek, minimalist design, this watch boasts a high-quality stainless steel case and a durable leather strap for both style and comfort. The scratch-resistant sapphire crystal protects the refined watch face, while the precise quartz movement ensures accurate timekeeping. With a date function and luminous hands, it’s both practical and sophisticated.",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 30),

            // Pricing and Add to Cart Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Rs. ${widget.model.pricing}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                      width: 10), // Adjust spacing for better alignment
                  Flexible(
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        label: const Text(
                          "Add To Cart",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        icon: const Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30), // Space at the end for better scrolling
          ],
        ),
      ),
    );
  }
}
