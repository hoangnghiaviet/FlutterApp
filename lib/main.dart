import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/checkout.dart';
import 'package:my_app/order.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Provides/profile_provider.dart';
import 'package:my_app/Provides/menu_provider.dart';
import 'package:my_app/home.dart';
import 'package:my_app/reward.dart';
import 'package:my_app/detail.dart';
import 'package:my_app/profile.dart';
import 'package:my_app/cart.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => MenuProvider()),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/reward': (context) => Reward(),
        '/detail': (context) => Detail(drinkIndex: 0),
        '/profile': (context) => Profile(),
        '/cart': (context) => Cart(),
        '/checkout': (context) => Checkout(),
        '/order': (context) => Order(),
      },
    );
  }
}