import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cart_list_provider.dart';
import 'package:shoping_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CardListProvider>(
      create: (context) {
        return CardListProvider();
      },
      child: MaterialApp(
        title: "Shoe Shopping App",
        home: const Home(),
        theme: ThemeData(
            textTheme: const TextTheme(
                titleLarge:
                    TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            inputDecorationTheme: const InputDecorationTheme(
                prefixIconColor: Color.fromRGBO(119, 119, 199, 1),
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            fontFamily: "Loto",
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
            primaryColor: Colors.yellow),
      ),
    );
  }
}
