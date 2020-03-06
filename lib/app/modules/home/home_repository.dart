import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/shared/models/category.dart';

class HomeRepository extends Disposable {
  List categories = [
    {
      "name": "Pessoal",
      "codePointIcon": 59389,
      "tasks": [
        {
          "title": "Título tarefa pessoal com teste de limite de linha",
          "hour": "10:10",
          "date": "05/12",
          "category": "Pessoal",
          "importance": 0,
          "description": "Descrição da tarefa",
          "done": true,
        },
        {
          "title": "Título tarefa pessoal 2",
          "hour": "10:10",
          "date": "05/12",
          "category": "Pessoal",
          "importance": 1,
          "description": "Descrição da tarefa",
          "done": false,
        },        {
          "title": "Título tarefa pessoal 2",
          "hour": "10:10",
          "date": "05/12",
          "category": "Pessoal",
          "importance": 0,
          "description": "Descrição da tarefa",
          "done": true,
        },        {
          "title": "Título tarefa pessoal 2",
          "hour": "10:10",
          "date": "05/12",
          "category": "Pessoal",
          "importance": 2,
          "description": "Descrição da tarefa",
          "done": false,
        },        {
          "title": "Título tarefa pessoal 2",
          "hour": "10:10",
          "date": "05/12",
          "category": "Pessoal",
          "importance": 1,
          "description": "Descrição da tarefa",
          "done": false,
        },        {
          "title": "Título tarefa pessoal 2",
          "hour": "10:10",
          "date": "05/12",
          "category": "Pessoal",
          "importance": 3,
          "description": "Descrição da tarefa",
          "done": false,
        },        {
          "title": "Título tarefa pessoal 2",
          "hour": "10:10",
          "date": "05/12",
          "category": "Pessoal",
          "importance": 1,
          "description": "Descrição da tarefa",
          "done": false,
        },
      ]
    },
    {
      "name": "Casa",
      "codePointIcon": 59530,
      "tasks": [
        {
          "title": "Título tarefa de casa",
          "hour": "10:10",
          "date": "05/12",
          "category": "Casa",
          "importance": 0,
          "description": "Descrição da tarefa",
          "done": false,
        }
      ]
    },
    {
      "name": "Trabalho",
      "codePointIcon": 59641,
      "tasks": [
        {
          "title": "Título tarefa do trabalho",
          "hour": "10:10",
          "date": "05/12",
          "category": "Trabalho",
          "importance": 0,
          "description": "Descrição da tarefa",
          "done": false,
        }
      ]
    },
    {
      "name": "Escola",
      "codePointIcon": 59404,
      "tasks": [
        {
          "title": "Título tarefa da escola",
          "hour": "10:10",
          "date": "05/12",
          "category": "Escola",
          "importance": 0,
          "description": "Descrição da tarefa",
          "done": false,
        }
      ]
    },
  ];

  List<Category> getCategories() {
    return Category.fromJsonList(categories);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
