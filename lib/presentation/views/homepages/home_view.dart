import 'package:flutter/material.dart';
import 'package:distcanal_io/presentation/views/loginpage/signin_view.dart'; // Importez SigninView

class HomeView extends StatelessWidget {
  static const String routeName = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPrimaryColor, Colors.black], // Dégradé cohérent
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Titre principal
                const Text(
                  "Canal de Distribution",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Description
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Optimisez votre distribution avec des outils puissants et intuitifs. Gérez vos stocks, suivez vos performances et maximisez vos ventes en temps réel.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),

                // Bouton "Connexion"
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        kPrimaryColor,
                        kAccentColor
                      ], // Dégradé du bouton
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SigninView.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Fond transparent
                      shadowColor: Colors.transparent, // Ombre transparente
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Connexion",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
