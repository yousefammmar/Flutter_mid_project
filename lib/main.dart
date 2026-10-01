import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/product_details/view_model/favorite_cubit.dart';
import 'screens/login_screen/login_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => FavoriteCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}