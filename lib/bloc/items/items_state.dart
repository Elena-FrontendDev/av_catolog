part of 'items_bloc.dart';


abstract class ItemsState extends Equatable {
  const ItemsState();
}

class ItemsInitial extends ItemsState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class ItemsGeneratedSuccess extends ItemsState {
  final List<MenuItem> itemsList;

  ItemsGeneratedSuccess({this.itemsList});

  @override
  List<Object> get props => [itemsList];
}
