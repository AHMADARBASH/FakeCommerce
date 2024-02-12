import 'dart:io';
import 'package:fakecommerce/bloc/products/products_state.dart';
import 'package:fakecommerce/bloc/topProducts/topProducts_state.dart';
import 'package:fakecommerce/data/models/product.dart';
import 'package:fakecommerce/data/repositories/products.dart';
import 'package:fakecommerce/utilities/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopProductsCubit extends Cubit<TopProductsState> {
  TopProductsCubit() : super(TopProductsInitState(products: []));

  final _repo = ProductsReporsitory();
  bool isInit = false;
  Future<void> _fetchProducts(
      Future<List<Product>> Function() fetchFunction) async {
    emit(TopProductsLoadingState());
    try {
      final data = await fetchFunction();
      isInit = true;
      emit(TopProductsUpdateState(products: data));
    } on SocketException catch (_) {
      emit(TopProductsErrorState(errorMessage: 'Connection Error'));
    } on HTTPException catch (e) {
      emit(TopProductsErrorState(errorMessage: e.message));
    } catch (e) {
      emit(TopProductsErrorState(errorMessage: 'Unknown Error'));
    }
  }

  Future<void> getTopProducts() async {
    await _fetchProducts(_repo.getTopProducts);
  }
}
