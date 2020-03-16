import 'package:todolist/app/shared/models/category.dart';

class CategoriesRepository {
  //temporario
  List categories = [
    {
      "id": "01",
      "name": "Pessoal",
      "codePointIcon": 59389,
      "tasks": [
        {
          "id": "01",
          "title": "Título tarefa pessoal com teste de limite de linha",
          "hour": "10",
          "minute": "59",
          "day": "01",
          "month": "12",
          "category": "Teste",
          "importance": 0,
          "description": null,
          "done": true,
        },
        {
          "id": "2",
          "title": "Título tarefa",
          "hour": "10",
          "minute": "40",
          "day": "21",
          "month": "10",
          "category": "Teste",
          "importance": 1,
          "description": "Descrição da tarefa",
          "done": true,
        },
        {
          "id": "3",
          "title": "Título tarefa",
          "hour": "08",
          "minute": "30",
          "day": "01",
          "month": "05",
          "category": "Teste",
          "importance": 1,
          "description": "Descrição da tarefa",
          "done": false,
        },
        {
          "id": "4",
          "title": "Título tarefa",
          "hour": "10",
          "minute": "40",
          "day": "21",
          "month": "10",
          "category": "Teste",
          "importance": 3,
          "description": "Descrição da tarefa",
          "done": true,
        },
        {
          "id": "5",
          "title": "Título tarefa",
          "hour": "10",
          "minute": "40",
          "day": "21",
          "month": "10",
          "category": "Teste",
          "importance": 2,
          "description": "Descrição da tarefa",
          "done": false,
        },
        {
          "id": "6",
          "title": "Título tarefa",
          "hour": "10",
          "minute": "40",
          "day": "21",
          "month": "10",
          "category": "Teste",
          "importance": 2,
          "description": "Descrição da tarefa",
          "done": false,
        },
        {
          "id": "7",
          "title": "Título tarefa",
          "hour": "10",
          "minute": "40",
          "day": "21",
          "month": "10",
          "category": "Teste",
          "importance": 3,
          "description": "Descrição da tarefa",
          "done": true,
        },
      ]
    },
    {
      "id": "02",
      "name": "Casa",
      "codePointIcon": 59530,
      "tasks": [
        {
          "id": "8",
          "title": "Título tarefa pessoal com teste de limite de linha",
          "hour": "10",
          "minute": "59",
          "day": "01",
          "month": "12",
          "category": "Teste2",
          "importance": 0,
          "description": "Descrição da tarefa",
          "done": true,
        }
      ]
    },
    {
      "id": "03",
      "name": "Escola",
      "codePointIcon": 59404,
      "tasks": [
        {
          "id": "9",
          "title": "Título tarefa pessoal com teste de limite de linha",
          "hour": "10",
          "minute": "59",
          "day": "01",
          "month": "12",
          "category": "Teste3",
          "importance": 0,
          "description": "Descrição da tarefa",
          "done": true,
        }
      ]
    },
    {
      "id": "04",
      "name": "Trabalho",
      "codePointIcon": 59641,
      "tasks": [
        {
          "id": "10",
          "title": "Título tarefa pessoal com teste de limite de linha",
          "hour": "10",
          "minute": "55",
          "day": "05",
          "month": "10",
          "category": "Teste4",
          "importance": 0,
          "description": "Descrição da tarefa",
          "done": true,
        }
      ]
    },
    {
      "id": "05",
      "name": "Academia",
      "codePointIcon": 60227,
      "tasks": [
        {
          "id": "10",
          "title": "Título tarefa pessoal com teste de limite de linha",
          "hour": "03",
          "minute": "40",
          "day": "01",
          "month": "12",
          "category": "Teste4",
          "importance": 0,
          "description": null,
          "done": true,
        }
      ]
    },
  ];

  List<Category> getCategories() {
    return Category.fromJsonList(categories);
  }
}
