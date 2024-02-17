abstract class AuthState {
  bool isAuth;
  AuthState({required this.isAuth});
}

class AuthInitState extends AuthState {
  AuthInitState({required super.isAuth});
}

class AuthLoadingState extends AuthState {
  AuthLoadingState({required super.isAuth});
}

class AuthUpdateState extends AuthState {
  AuthUpdateState({required super.isAuth});
}
