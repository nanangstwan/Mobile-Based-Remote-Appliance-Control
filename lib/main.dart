import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remote_lamp/auth/authservice.dart';
import 'package:remote_lamp/home.dart';
import 'package:remote_lamp/widget/dummy_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messagerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 11, 80, 136),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Scaffold(
        body: SafeArea(
          child: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // } else if (snapshot.hasError) {
                //   return const Center(
                //     child: Text('something went error'),
                //   );
                // } else

                if (snapshot.hasData) {
                  return MyWidget();
                } else {
                  return const AuthPage();
                }
              }),
        ),
      ),
    );
  }
}
