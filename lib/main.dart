import 'package:flutter/material.dart';
import 'package:sakubelanja_app/widgets/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BelanjaKu',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 144, 238, 144),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 34, 45, 38),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 40, 50, 42),
      ),
      home: const GroceryList(),
    );
  }
}
