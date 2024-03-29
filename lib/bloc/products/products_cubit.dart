import 'dart:io';
import 'package:fakecommerce/bloc/products/products_state.dart';
import 'package:fakecommerce/data/models/product.dart';
import 'package:fakecommerce/data/repositories/products.dart';
import 'package:fakecommerce/utilities/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitState(products: []));

  final _repo = ProductsReporsitory();
  bool isInit = false;
  Future<void> _fetchProducts(
      Future<List<Product>> Function() fetchFunction) async {
    emit(ProductsLoadingState());
    try {
      final data = await fetchFunction();
      isInit = true;
      emit(ProductsUpdateState(products: data));
    } on SocketException catch (_) {
      emit(ProductsErrorState(errorMessage: 'Connection Error'));
    } on HTTPException catch (e) {
      emit(ProductsErrorState(errorMessage: e.message));
    } catch (e) {
      emit(ProductsErrorState(errorMessage: 'Unknown Error'));
    }
  }

  Future<void> getProductsInCategory({required String category}) async {
    await _fetchProducts(() => _repo.getProductsInCategory(category: category));
  }
}
