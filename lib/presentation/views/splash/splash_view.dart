import 'package:distcanal_io/presentation/views/homepages/home_view.dart';
import 'package:distcanal_io/presentation/views/profilpage/profil_view.dart';
import 'package:distcanal_io/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  static const String routeName = '/';

  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = Provider.of<AuthProvider>(context).isLogged;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (isLoggedIn == false) {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      } else if (isLoggedIn == true) {
        Navigator.pushReplacementNamed(context, ProfilView.routeName);
      }
    });

    return Scaffold(
      body: Container(
        //color: Theme.of(context).primaryColor,
        alignment: Alignment.center,
        child: const Text(
          "SplashView !",
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
