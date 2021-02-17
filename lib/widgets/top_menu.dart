import 'package:av_catalog/bloc/items/items_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopMenu extends StatelessWidget {
  const TopMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 9.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Меню',
            style: Theme.of(context).textTheme.headline1,
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Color(0xFF2F54EB),
              child: Icon(
                Icons.add,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            onTap: () => BlocProvider.of<ItemsBloc>(context).add(AddNewItem()),
          ),
        ],
      ),
    );
  }
}
