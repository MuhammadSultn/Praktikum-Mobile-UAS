import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gaming_review/firebase_options.dart';
import 'package:gaming_review/view/home_screen.dart';
import 'package:gaming_review/view/discover_user.dart';
import 'package:gaming_review/view/login_screen.dart';
import 'package:gaming_review/view/onboard_screen.dart';
import 'package:gaming_review/view/profile_screen.dart';

import 'package:gaming_review/screens/screen.dart';
late FirebaseApp app;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gaming Review',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        Login_Screen.routeName: (context) => const Login_Screen(),
        onboard.routeName: (context) => const onboard(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        discover.routeName: (context) => const discover(),
        ArticleScreen.routeName: (context) => const ArticleScreen(),
        Profile_screen.routeName:(context) => const Profile_screen(),
      },
    );
  }
}



