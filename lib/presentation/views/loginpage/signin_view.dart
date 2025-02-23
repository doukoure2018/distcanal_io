import 'package:distcanal_io/presentation/views/profilpage/profil_view.dart';
import 'package:flutter/material.dart';

class SigninView extends StatefulWidget {
  static const String routeName = '/signin';

  const SigninView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  String? _errorMessage;

  // Méthode pour valider et soumettre le formulaire
  Future<void> _submitForm() async {
    if (_isLoading) return; // Empêcher une soumission multiple

    setState(() {
      _isLoading = true;
      _errorMessage = null; // Réinitialiser le message d'erreur
    });

    if (_formKey.currentState!.validate()) {
      // Simuler une validation des identifiants (sans délai artificiel)
      if (_emailController.text.trim() == 'moumine.ingenieur@gmail.com' &&
          _passwordController.text.trim() == 'Moumine80') {
        // Identifiants valides : rediriger vers ProfilView
        Navigator.pushNamed(context, ProfilView.routeName);
      } else {
        // Identifiants invalides : afficher un message d'erreur
        setState(() {
          _errorMessage = "Identifiants incorrects.";
        });
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPrimaryColor, Colors.black],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 34,
              top: 62,
              child: Container(
                height: 792,
                padding: const EdgeInsets.only(top: 29, bottom: 56),
                child: Form(
                  key: _formKey, // Ajoutez le Form ici
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      Container(
                        width: 326,
                        height: 135,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/Logo_guidipress.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Bloc de connexion
                      SizedBox(
                        width: 346,
                        height: 560,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Arrière-plan flou
                            Opacity(
                              opacity: 0.05,
                              child: Container(
                                width: 326,
                                height: 540,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(-0.53, -0.85),
                                    end: Alignment(0.53, 0.85),
                                    colors: [Colors.white, Colors.black],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(21),
                                  ),
                                ),
                              ),
                            ),

                            // Titre "Se Connecter"
                            const Positioned(
                              top: 40,
                              child: Text(
                                'Se Connecter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                            // Champ de saisie de l'email
                            Positioned(
                              top: 100,
                              child: Container(
                                width: 325,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 15),
                                child: TextFormField(
                                  controller: _emailController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    hintText: 'Saisir l\'email',
                                    hintStyle: TextStyle(color: Colors.white70),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.email, // Icône pour l'email
                                      color: kAccentColor,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kAccentColor, width: 2),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez saisir votre email.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),

                            // Champ de saisie du mot de passe
                            Positioned(
                              top: 180,
                              child: Container(
                                width: 325,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 15),
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: !_isPasswordVisible,
                                  textInputAction: TextInputAction.done,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Saisir le mot de passe',
                                    hintStyle:
                                        const TextStyle(color: Colors.white70),
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(
                                      Icons.lock, // Icône pour le mot de passe
                                      color: kAccentColor,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: kAccentColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible =
                                              !_isPasswordVisible;
                                        });
                                      },
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kAccentColor, width: 2),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez saisir votre mot de passe.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),

                            // Bouton "Se Connecter"
                            Positioned(
                              top: 270,
                              child: Container(
                                width: 300,
                                height: 44,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    colors: [kPrimaryColor, kAccentColor],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: _isLoading ? null : _submitForm,
                                  child: Center(
                                    child: _isLoading
                                        ? const CircularProgressIndicator(
                                            color: Colors.white)
                                        : const Text(
                                            'Soumettre',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Lexend',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),

                            // Lien "Mot de passe oublié ?"
                            Positioned(
                              bottom: 30,
                              child: GestureDetector(
                                onTap: () {
                                  // Ajouter une action si nécessaire
                                },
                                child: const Text(
                                  'Mot de passe oublié ?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),

                            // Message d'erreur en dessous du bouton "Soumettre"
                            if (_errorMessage != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 150),
                                child: Text(
                                  _errorMessage!,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
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

// Couleurs constantes
const Color kPrimaryColor = Color(0xFF1E1E2C);
const Color kAccentColor = Color(0xFFFF3D00);
