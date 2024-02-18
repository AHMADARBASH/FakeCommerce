import 'package:animate_do/animate_do.dart';
import 'package:fakecommerce/bloc/Auth/auth_cubit.dart';
import 'package:fakecommerce/bloc/Auth/auth_state.dart';
import 'package:fakecommerce/layout/widgets/custom_text_field.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isPassword = true;
  TextEditingController _UsernameController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: context.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FadeInLeft(
                    delay: Duration(milliseconds: 100),
                    child: Image.asset(
                      'assets/images/purple_logo.png',
                      width: context.width * 0.4,
                    ),
                  ),
                  FadeInUp(
                    delay: Duration(milliseconds: 100),
                    duration: Duration(milliseconds: 400),
                    child: SizedBox(
                      width: context.width * 0.9,
                      child: CustomTextField(
                        lable: 'username',
                        isPassword: false,
                        action: TextInputAction.next,
                        controller: _UsernameController,
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return 'Please enter username';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    delay: Duration(milliseconds: 200),
                    duration: Duration(milliseconds: 400),
                    child: SizedBox(
                        width: context.width * 0.9,
                        child: StatefulBuilder(
                          builder: (context, newSetState) => CustomTextField(
                            lable: 'password',
                            isPassword: _isPassword,
                            controller: _PasswordController,
                            validator: (value) {
                              if (value!.isEmpty || value == '') {
                                return 'Please enter password';
                              } else {
                                return null;
                              }
                            },
                            suffix: IconButton(
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                newSetState(
                                  () => _isPassword = !_isPassword,
                                );
                              },
                              icon: Icon(
                                _isPassword
                                    ? Icons.lock
                                    : Icons.lock_open_rounded,
                                color: context.primaryColor,
                              ),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    delay: Duration(milliseconds: 300),
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeOutCubic,
                    child: BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) => InkWell(
                        onTap: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          } else {
                            BlocProvider.of<AuthCubit>(context).login(
                                username: _UsernameController.text,
                                password: _PasswordController.text);
                          }
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: state is AuthLoadingState
                              ? 80
                              : context.width * 0.9,
                          height: context.height * 0.07,
                          decoration: BoxDecoration(
                            color: context.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: state is AuthLoadingState
                              ? CircularProgressIndicator(
                                  color: context.secondaryColor,
                                )
                              : Text(
                                  'login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: context.secondaryColor),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
