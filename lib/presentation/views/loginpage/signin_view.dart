import 'dart:convert';

import 'package:distcanal_io/models/signin_model.dart';
import 'package:distcanal_io/models/user_model.dart';
import 'package:distcanal_io/presentation/resources/assets_manager.dart';
import 'package:distcanal_io/presentation/views/homepages/home_view.dart';
import 'package:distcanal_io/presentation/views/profilpage/profil_view.dart';
import 'package:distcanal_io/providers/auth_provider.dart';
import 'package:distcanal_io/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninView extends StatefulWidget {
  static const String routeName = '/signin';

  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late SigninForm signinForm;
  FormState? get form => key.currentState;
  bool _isLoading = false;
  bool hidePassword = true;
  String? error;

  @override
  void initState() {
    /// initialisation de la classe

    signinForm = SigninForm(
      email: '',
      password: '',
    );
    super.initState();
  }

  Future<void> submitForm() async {
    try {
      if (form!.validate()) {
        form?.save();
        final response = await Provider.of<AuthProvider>(context, listen: false)
            .signin(signinForm);
        if (response is User && mounted) {
          Provider.of<UserProvider>(context, listen: false)
              .updateUser(response);
          Navigator.pushNamed(context, ProfilView.routeName);
        } else {
          setState(() {
            error = json.decode(response.body)['reason'];
          });
        }
      }
    } catch (e) {
      setState(() => _isLoading = false);
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Connexion',
          style: TextStyle(
              //color: Colors.white,
              ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, HomeView.routeName);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        //color: Colors.black,
        alignment: Alignment.center,
        padding:
            const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Image(
                image: AssetImage(ImageAssets.splashLogo),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Email addresse",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == '' || value!.isEmpty) {
                          return "Vous devez saisir Votre adresse email";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        fillColor: Colors.black54,
                        filled: true,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      onSaved: ((newValue) {
                        signinForm.email = newValue!;
                      }),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    const Text(
                      "Mot de passe",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                    ),
                    TextFormField(
                      obscureText: hidePassword == true ? true : false,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == '' || value!.isEmpty) {
                          return "Vous devez saisir votre Mot de passe";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.black54,
                          filled: true,
                          suffixIcon: IconButton(
                            icon: hidePassword == true
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          )),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      onSaved: ((newValue) {
                        signinForm.password = newValue!;
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: error != null
                          ? Text(
                              error!,
                              style: const TextStyle(color: Colors.red),
                            )
                          : null,
                    ),
                    ElevatedButton(
                      onPressed: _isLoading ? null : submitForm,
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : const Text(
                              "Se connecter",
                            ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
