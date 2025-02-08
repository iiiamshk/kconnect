import 'package:flutter/material.dart';
import 'package:kconnect/Providers/auth_provider.dart';
// import 'package:sconnect/Screens/home_page.dart';
import 'package:kconnect/Screens/login_page.dart';
import 'package:kconnect/Screens/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KConnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, // WhatsApp dark theme background
      ),
      home: MainPage(),
    );
  }
}
