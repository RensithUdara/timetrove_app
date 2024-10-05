import 'package:ecommerce_app/Getxstate/favoritestate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favoritescreen extends StatelessWidget {
  const Favoritescreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize FavoriteController
    final FavoriteController favoritesController = Get.put(FavoriteController());

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Obx(() {
        // Check if there are any favorites
        if (favoritesController.favorites.isEmpty) {
          // Display a message when no favorites are available
          return Center(
            child: Text(
              'No favorites added yet.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        // If there are favorites, display them in a list
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: favoritesController.favorites.length,
                itemBuilder: (context, index) {
                  final favoriteItem = favoritesController.favorites[index];
                  return ListTile(
                    title: Text(favoriteItem),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {
                        // Remove the item from the favorites
                        favoritesController.toggleFavorite(favoriteItem);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
