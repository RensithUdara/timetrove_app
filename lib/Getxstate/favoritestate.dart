import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favorites = <String>[].obs;

  void toggleFavorite(String item) {
    if (favorites.contains(item)) {
      favorites.remove(item);   
    } else {
      favorites.add(item);
    }
  }
   bool isFavorite(String item) {
    return  favorites.contains(item);
  }
}




 
