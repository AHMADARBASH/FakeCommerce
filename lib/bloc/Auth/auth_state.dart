abstract class AuthState {
  bool isAuth;
  String? username;
  AuthState({required this.isAuth, this.username});
}

class AuthInitState extends AuthState {
  AuthInitState({required super.isAuth, super.username});
}

class AuthLoadingState extends AuthState {
  AuthLoadingState({required super.isAuth, super.username});
}

class AuthErrorState extends AuthState {
  String errorMessage;
  AuthErrorState(
      {required super.isAuth, required this.errorMessage, super.username});
}

class AuthUpdateState extends AuthState {
  AuthUpdateState({required super.isAuth, super.username});
}
