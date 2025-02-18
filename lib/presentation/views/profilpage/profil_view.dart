import 'package:flutter/material.dart';

class ProfilView extends StatefulWidget {
  static const String routeName = '/profil';
  const ProfilView({super.key});

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      color: Colors.white,
      child: const Center(
        child: Text("This is page profile view After logged in !"),
      ),
    );
  }
}
