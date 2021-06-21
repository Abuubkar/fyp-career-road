import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyp_career_road/screens/home_screen.dart';
import 'package:fyp_career_road/screens/login_screen.dart';
import 'package:fyp_career_road/screens/splash_screen.dart';
import 'package:fyp_career_road/services/authentication.dart';
import 'package:provider/provider.dart';
// Import the firebase_core plugin
// import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseUser = context.watch<User>();
    if (FirebaseUser != null) {
      return HomeScreen();
    }
    return LoginScreen();
  }
}
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           // Otherwise, show Error
//           // return SomethingWentWrong();
//         }
//
//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           MaterialApp(debugShowCheckedModeBanner: false, home: SignupScreen());
//         }
//         // Otherwise, show something whilst waiting for initialization to complete
//         return null;
//       },
//     );
//   }
// }
