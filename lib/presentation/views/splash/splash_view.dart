import 'package:flutter/material.dart';
import 'package:distcanal_io/presentation/views/homepages/home_view.dart';
import 'package:distcanal_io/presentation/views/profilpage/profil_view.dart';
import 'package:distcanal_io/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  static const String routeName = '/';

  const SplashView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _fadeController;
  late AnimationController _textSlideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Animation de rotation infinie
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Animation de fondu
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);

    // Animation de glissement du texte
    _textSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(
        CurvedAnimation(parent: _textSlideController, curve: Curves.easeOut));

    _fadeController.forward();
    _textSlideController.forward();

    // Redirection après 5 secondes (5000 ms)
    Future.delayed(const Duration(milliseconds: 5000), () {
      final bool isLoggedIn =
          // ignore: use_build_context_synchronously
          Provider.of<AuthProvider>(context, listen: false).isLogged;

      Navigator.pushReplacementNamed(
        // ignore: use_build_context_synchronously
        context,
        isLoggedIn ? ProfilView.routeName : HomeView.routeName,
      );
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _fadeController.dispose();
    _textSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Supprime le bandeau "Debug"
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kPrimaryColor, Colors.black], // Dégradé cohérent
            ),
          ),
          alignment: Alignment.center,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animation de rotation
                RotationTransition(
                  turns: _rotationController,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: kAccentColor.withOpacity(0.6),
                          blurRadius: 15,
                          spreadRadius: 3,
                        ),
                      ],
                      border: Border.all(width: 4, color: kAccentColor),
                    ),
                    child: const Icon(
                      Icons.sync,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Texte "Chargement..."
                SlideTransition(
                  position: _slideAnimation,
                  child: const Text(
                    "Chargement...",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Couleurs constantes
const Color kPrimaryColor = Color(0xFF1E1E2C);
const Color kAccentColor = Color(0xFFFF3D00);
