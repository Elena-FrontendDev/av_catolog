import 'dart:async';

import 'package:av_catalog/constants.dart';
import 'package:av_catalog/model/menu_item.dart';
import 'package:av_catalog/services/generator_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'items_event.dart';
part 'items_state.dart';

List<dynamic> listOfDefaultItems = [];
List<dynamic> listOfNewItems = [];
List<MenuItem> listItems = [];

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc() : super(ItemsInitial());

  @override
  Stream<ItemsState> mapEventToState(
    ItemsEvent event,
  ) async* {
    if (event is GenerateItems) {
      yield* _mapGenerateItemsToState(event);
    } else if (event is AddNewItem) {
      yield* _mapAddNewItemToState(event);
    } else if (event is DeleteItem) {
      yield* _mapDeleteItemToState(event);
    }
  }

  Stream<ItemsState> _mapGenerateItemsToState(GenerateItems event) async* {
    // Генерируем список для загрузки дефолтных товаров
    // и список для последующего добавления новых товаров

    await GeneratorService().generateListOfItems(listOfDefaultItems, defaultItemsData);
    await GeneratorService().generateListOfItems(listOfNewItems, newItemsData);

    int id = 1;
    // создаем спиисок из необходимого количества товаров для загрузки
    for (int i = 0; i < MAX_ITEMS; i++) {

      // получаем рандомный элемент
      final element = GeneratorService().getRandomElement(listOfDefaultItems);
      MenuItem menuItem = MenuItem.fromMap(element);

      // добавляем id для последующего удаления товара из списка
      menuItem.id = id.toString();
      listItems.add(menuItem);
      id = id + 1;
    }

    yield ItemsGeneratedSuccess(itemsList: listItems);
  }

  Stream<ItemsState> _mapAddNewItemToState(AddNewItem event) async* {
    if (state is ItemsGeneratedSuccess) {
      List<MenuItem> currentList = List.from((state as ItemsGeneratedSuccess).itemsList);

      // генерируем рандомный элемент из созданного ранее списка товаров для добавления
      final newItem = GeneratorService().getRandomElement(listOfNewItems);

      MenuItem menuItem = MenuItem.fromMap(newItem);

      //добавляем id
      menuItem.id = (currentList.length + 1).toString();

      currentList.insert(0, menuItem);

      yield ItemsGeneratedSuccess(itemsList: currentList);
    }
  }

  Stream<ItemsState> _mapDeleteItemToState(DeleteItem event) async* {
    if (state is ItemsGeneratedSuccess) {
      final List<MenuItem> updatedList =
          (state as ItemsGeneratedSuccess).itemsList.where((item) => item.id != event.id).toList();

      yield ItemsGeneratedSuccess(itemsList: updatedList);
    }
  }
}
