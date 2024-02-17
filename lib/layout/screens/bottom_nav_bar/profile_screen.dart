import 'package:fakecommerce/layout/screens/login_screen.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

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
      body: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 300),
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
      ),
    );
  }
}
