import 'package:fakecommerce/data/helpers/local_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitState(isAuth: false));

  bool getAuthState() => LocalData.containsKey('token');

  Future<void> updateAuthState() async {
    emit(
      AuthUpdateState(
        isAuth: LocalData.containsKey('token'),
      ),
    );
  }

  void setLoading() {
    emit(AuthLoadingState(isAuth: false));
  }
}
