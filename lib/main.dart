import 'package:av_catalog/bloc/items/items_bloc.dart';
import 'package:av_catalog/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider<ItemsBloc>(
      lazy: false,
      create: (context) => ItemsBloc()..add(GenerateItems()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF050505),
        brightness: Brightness.dark,
        accentColor: Color(0xff0050ff),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14.0,
            letterSpacing: -0.15,
            fontWeight: FontWeight.w700,
          ),
          headline1: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFFFFFFFF),
        ),
      ),
      home: BlocProvider.value(
        value: BlocProvider.of<ItemsBloc>(context),
        child: MainScreen(),
      ),
    );
  }
}
