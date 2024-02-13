import 'package:fakecommerce/data/models/product.dart';

abstract class FavoritesState {
  List<Product> favorites;
  List<int> ids;
  FavoritesState({required this.favorites, required this.ids});
}

class FavoritesInitState extends FavoritesState {
  FavoritesInitState() : super(favorites: [], ids: []);
}

class FavoritesLoadingState extends FavoritesState {
  FavoritesLoadingState() : super(favorites: [], ids: []);
}

class FavoritesEmptyState extends FavoritesState {
  FavoritesEmptyState() : super(favorites: [], ids: []);
}

class FavoritesErrorState extends FavoritesState {
  String errorMessage;
  FavoritesErrorState({required this.errorMessage})
      : super(favorites: [], ids: []);
}

class FavoritesUpdateState extends FavoritesState {
  FavoritesUpdateState({required super.favorites, required super.ids});
}
