import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

class GeneratorService {

  final random = new Random();

  // Генерируем массив товаров из моковых данных json файла

  dynamic generateListOfItems(listOfItems, path) async {
    final dynamic data = await rootBundle.loadString(path);

    List<dynamic> jsonData = json.decode(data);

    jsonData.forEach((element) {

      listOfItems.add(element);
    });

    return listOfItems;
  }

  // Функция для получения рандомного элемента из массива

  getRandomElement(list) {
    var i = random.nextInt(list.length);
    return list[i];
  }

}