part of 'items_bloc.dart';

abstract class ItemsEvent extends Equatable {
  const ItemsEvent();
}

class GenerateItems extends ItemsEvent {
  @override
  List<Object> get props => [];
}

class AddNewItem extends ItemsEvent {
  @override
  List<Object> get props => [];
}

class DeleteItem extends ItemsEvent {
  final String id;

  const DeleteItem(this.id);

  @override
  List<Object> get props => [id];
}
