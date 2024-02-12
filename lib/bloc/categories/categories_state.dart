abstract class CategoriesState {
  List<String> categories = [];
  CategoriesState({required this.categories});
}

class CategoriesInitState extends CategoriesState {
  CategoriesInitState() : super(categories: []);
}

class CategoriesErrorState extends CategoriesState {
  final String errorMessage;
  CategoriesErrorState({required this.errorMessage}) : super(categories: []);
}

class CategoriesLoadingState extends CategoriesState {
  CategoriesLoadingState() : super(categories: []);
}

class CategoriesUpdateState extends CategoriesState {
  CategoriesUpdateState({required super.categories});
}
