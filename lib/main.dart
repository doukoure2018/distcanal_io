import 'package:distcanal_io/presentation/resources/strings_manager.dart';
import 'package:distcanal_io/presentation/resources/theme_manager.dart';
import 'package:distcanal_io/presentation/views/homepages/home_view.dart';
import 'package:distcanal_io/presentation/views/loginpage/signin_view.dart';
import 'package:distcanal_io/presentation/views/notFound/not_found_view.dart';
import 'package:distcanal_io/presentation/views/profilpage/profil_view.dart';
import 'package:distcanal_io/presentation/views/profilpage/stats_view.dart'; // Ajoutez cette ligne
import 'package:distcanal_io/presentation/views/splash/splash_view.dart';
import 'package:distcanal_io/providers/auth_provider.dart';
import 'package:distcanal_io/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyAuth());
}

class MyAuth extends StatefulWidget {
  const MyAuth({super.key});

  @override
  State<MyAuth> createState() => _MyAuthState();
}

class _MyAuthState extends State<MyAuth> {
  AuthProvider authProvider = AuthProvider();
  //UserProvider userProvider = UserProvider();

  @override
  void initState() {
    authProvider
        .initAuth(); // permet de verifier si l'utilisateur est connecte ou pas
    // localisationProvider.fetchListRegion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
          create: (_) => UserProvider(),
          update: (_, authProvider, oldUserProvider) =>
              oldUserProvider!..update(authProvider),
        ),
        //ChangeNotifierProvider.value(value: localisationProvider),
      ],
      child: MaterialApp(
        theme: getApplicationTheme(),
        debugShowCheckedModeBanner: false,
        title: AppStrings.auth,
        home: const SplashView(),
        onGenerateRoute: (settings) {
          if (settings.name == HomeView.routeName) {
            return MaterialPageRoute(builder: (_) => const HomeView());
          } else if (settings.name == ProfilView.routeName) {
            return MaterialPageRoute(builder: (_) => const ProfilView());
          } else if (settings.name == SigninView.routeName) {
            return MaterialPageRoute(builder: (_) => const SigninView());
          } else if (settings.name == StatsView.routeName) {
            // Ajoutez cette condition
            return MaterialPageRoute(builder: (_) => const StatsView());
          } else {
            return null;
          }
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (_) => const NotFoundView(),
        ),
      ),
    );
  }
}
