import 'dart:io';
import 'package:fakecommerce/bloc/categories/categories_state.dart';
import 'package:fakecommerce/data/repositories/categories.dart';
import 'package:fakecommerce/utilities/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitState());

  final _repo = CategoriesRepositor();
  bool isInit = false;
  Future<void> getAllCategories() async {
    emit(CategoriesLoadingState());
    try {
      final data = await _repo.getAllCategories();
      isInit = true;
      emit(CategoriesUpdateState(categories: data));
    } on SocketException catch (_) {
      emit(CategoriesErrorState(errorMessage: 'Connection Error'));
    } on HTTPException catch (e) {
      emit(CategoriesErrorState(errorMessage: e.message));
    } catch (e) {
      emit(CategoriesErrorState(errorMessage: 'Unkown Error'));
    }
  }
}
