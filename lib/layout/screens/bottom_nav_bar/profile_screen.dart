import 'package:fakecommerce/bloc/Auth/auth_cubit.dart';
import 'package:fakecommerce/bloc/Auth/auth_state.dart';
import 'package:fakecommerce/bloc/cart/cart_cubit.dart';
import 'package:fakecommerce/data/helpers/local_data.dart';
import 'package:fakecommerce/layout/screens/login_screen.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) =>
            state.isAuth ? ProfileForm(context, state) : LoginForm(context),
      ),
    );
  }
}

Widget ProfileForm(BuildContext context, AuthState state) => SizedBox(
      width: context.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          FadeInDown(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              ),
              height: context.height * 0.25,
              child: Icon(
                Icons.person,
                size: context.height * 0.25,
                color: context.primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FadeInDown(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            child: Text(LocalData.getData(key: 'username') ?? "username",
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          Spacer(),
          FadeInUp(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (_) => AlertDialog(
                          surfaceTintColor: context.secondaryColor,
                          content: Text(
                            'are you sure to logout?',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('No'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.primaryColor,
                                foregroundColor: context.secondaryColor,
                              ),
                              child: const Text('Yes'),
                              onPressed: () async {
                                BlocProvider.of<CartCubit>(context).emptyCart();
                                await BlocProvider.of<AuthCubit>(context)
                                    .logout();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ));
              },
              child: Container(
                width: context.width * 0.8,
                height: context.height * 0.06,
                decoration: BoxDecoration(
                  color: context.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Logout',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: context.secondaryColor),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );

Widget LoginForm(BuildContext context) => SizedBox(
      width: context.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInDown(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              ),
              height: context.height * 0.25,
              child: Icon(
                Icons.person,
                size: context.height * 0.25,
                color: context.primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: context.height * 0.02,
          ),
          FadeInRight(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            child: InkWell(
              splashColor: Colors.white,
              onTap: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              },
              child: Container(
                width: context.width * 0.8,
                height: context.height * 0.06,
                decoration: BoxDecoration(
                  color: context.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'login',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: context.secondaryColor),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeIn(
            duration: Duration(milliseconds: 600),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: context.width * 0.25,
                  height: 0.5,
                  color: context.primaryColor,
                ),
                Text('  or  '),
                Container(
                  width: context.width * 0.25,
                  height: 0.5,
                  color: context.primaryColor,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeInLeft(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: context.width * 0.8,
                height: context.height * 0.06,
                decoration: BoxDecoration(
                  color: context.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Signup',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: context.secondaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
