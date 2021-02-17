import 'package:av_catalog/bloc/items/items_bloc.dart';
import 'package:av_catalog/model/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  final MenuItem menuItem;

  const DeleteButton({@required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(6.0),
        color: Color(0xFF2F54EB),
        child: Icon(
          Icons.delete_forever,
          color: Theme.of(context).iconTheme.color,
          size: 22.0,
        ),
      ),
      onTap: () {
        BlocProvider.of<ItemsBloc>(context).add(DeleteItem(menuItem.id));
      },
    );
  }
}
