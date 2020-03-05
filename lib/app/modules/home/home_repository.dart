import 'package:flutter_modular/flutter_modular.dart';

class HomeRepository extends Disposable {
  List categories = [

    {
      "name": "Pessoal",
      "codePointIcon": 59389,
      "tasks": [
        {
          "title": "Título tarefa",
          "hour": "10:10",
          "date": "05/12",
          "category": "Pessoal",
          "importance": 0,
          "description": "Descrição da tarefa"
        }
      ]
    },
    {
      "name": "Casa",
      "codePointIcon": 59530,
      "tasks": [
        {
          "title": "Título tarefa",
          "hour": "10:10",
          "date": "05/12",
          "category": "Casa",
          "importance": 0,
          "description": "Descrição da tarefa"
        }
      ]
    },
    {
      "name": "Trabalho",
      "codePointIcon": 59641,
      "tasks": [
        {
          "title": "Título tarefa",
          "hour": "10:10",
          "date": "05/12",
          "category": "Trabalho",
          "importance": 0,
          "description": "Descrição da tarefa"
        }
      ]
    },
    {
      "name": "Escola",
      "codePointIcon": 59404,
      "tasks": [
        {
          "title": "Título tarefa",
          "hour": "10:10",
          "date": "05/12",
          "category": "Escola",
          "importance": 0,
          "description": "Descrição da tarefa"
        }
      ]
    },
  ];

  List getCategories() {
    return categories;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
