import 'package:av_catalog/bloc/items/items_bloc.dart';
import 'package:av_catalog/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return BlocBuilder<ItemsBloc, ItemsState>(builder: (itemContext, itemState) {
      if (itemState is ItemsGeneratedSuccess) {
        return Expanded(
          child: Scrollbar(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
                itemCount: itemState.itemsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemCard(menuItem: itemState.itemsList[index]);
                }),
          ),
        );
      }
      return Center(child: CircularProgressIndicator());
    });
  }
}
