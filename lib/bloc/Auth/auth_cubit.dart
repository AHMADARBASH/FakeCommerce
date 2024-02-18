import 'dart:io';

import 'package:fakecommerce/data/helpers/local_data.dart';
import 'package:fakecommerce/data/repositories/auth.dart';
import 'package:fakecommerce/utilities/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _repo = AuthRepository();
  String? username = LocalData.getData(key: 'username');

  AuthCubit() : super(AuthInitState(isAuth: false));

  bool getAuthState() => LocalData.containsKey('token');

  Future<void> updateAuthState() async {
    emit(
      AuthUpdateState(
        isAuth: LocalData.containsKey('token'),
      ),
    );
  }

  Future<void> login(
      {required String username, required String password}) async {
    emit(AuthLoadingState(isAuth: false));
    try {
      await _repo.login(
          body: {'username': username, 'password': password}).then((value) {
        LocalData.saveData(key: 'token', data: value['token']);
        LocalData.saveData(key: 'username', data: username);
        emit(AuthUpdateState(isAuth: true, username: username));
      });
    } on SocketException catch (_) {
      emit(AuthErrorState(isAuth: false, errorMessage: 'Connection Error'));
    } on HTTPException catch (e) {
      emit(AuthErrorState(isAuth: false, errorMessage: e.toString()));
    } catch (e) {
      emit(AuthErrorState(errorMessage: 'Server Error', isAuth: false));
    }
  }

  Future<void> logout() async {
    emit(AuthLoadingState(isAuth: false));
    await LocalData.deleteData(key: 'token');
    await LocalData.deleteData(key: 'username');
    emit(AuthUpdateState(isAuth: false));
  }
}
