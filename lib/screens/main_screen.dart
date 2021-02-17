import 'package:av_catalog/bloc/items/items_bloc.dart';
import 'package:av_catalog/widgets/items_container.dart';
import 'package:av_catalog/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              TopMenu(),
              BlocProvider.value(
                value: BlocProvider.of<ItemsBloc>(context),
                child: ItemsContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
