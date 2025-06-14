

import 'dart:convert';

import 'package:get/get.dart';
import 'package:grocify/data/repositories.authentication/product/product_repository.dart';
import 'package:grocify/features/shop/models/product_model.dart';
import 'package:grocify/utils/local_storage/storage_utility.dart';
import 'package:grocify/utils/popups/loaders.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();


// variable
final favourites = <String, bool> {}.obs;


  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }


  void initFavourites()  {
    final json = TLocalStorage.instance().readData('favourites');
    if(json != null){
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourites(String productId){
    return favourites[productId] ?? false;
  }


  void toggleFavouriteProduct(String productId) {

    if(!favourites.containsKey(productId)){
      favourites[productId] = true;
      saveFavouritesToStorage();
      TLoaders.customToast(message: 'Product has been added to the Wishlist');
    }else{
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
    }
  }


  void  saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().writeData('favourites', encodedFavourites);
  }


  Future<List<ProductModel>> favouriteProducts() async{
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }


}