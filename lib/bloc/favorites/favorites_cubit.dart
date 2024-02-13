import 'package:fakecommerce/bloc/favorites/favorites_states.dart';
import 'package:fakecommerce/data/helpers/database_helper.dart';
import 'package:fakecommerce/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitState());
  List<Product> favorites = [];
  List<int> ids = [];
  Future<void> getFavorites() async {
    emit(FavoritesLoadingState());
    List<Map<String, dynamic>> data =
        await DatabaseHelper.getDatafromDatabase(tableName: 'products');
    if (data.isEmpty) {
      emit(FavoritesEmptyState());
    } else {
      List<Product> favorites = [];
      List<int> ids = [];
      for (var element in data) {
        favorites.add(Product.fromDatabase(element));
        ids.add(element['id']);
      }
      favorites = favorites;
      ids = ids;
      emit(FavoritesUpdateState(favorites: favorites, ids: ids));
    }
  }

  Future<void> addFavorite({required Product product}) async {
    emit(FavoritesLoadingState());
    await DatabaseHelper.insertIntoDatabase(tableName: 'products', data: {
      'id': product.id,
      'title': product.title,
      'price': product.price,
      'description': product.description,
      'category': product.category,
      'image': product.image,
      'rating': product.rating
    });
    favorites.add(product);
    ids.add(product.id!);
    emit(FavoritesUpdateState(favorites: favorites, ids: ids));
  }

  Future<void> removeFavorite({required int id}) async {
    emit(FavoritesLoadingState());
    await DatabaseHelper.deletefromDatabase(id: id, tableName: 'products');
    favorites.removeWhere(
      (element) => element.id == id,
    );
    ids.removeWhere(
      (element) => element == id,
    );
    if (favorites.isEmpty) {
      emit(FavoritesEmptyState());
    } else {
      emit(FavoritesUpdateState(favorites: favorites, ids: ids));
    }
  }
}
