import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:todolist/app/modules/task/repositories_document_task.dart';
import 'package:todolist/app/shared/models/task.dart';
import 'package:todolist/app/shared/repositories/tasks_repository_interface.dart';

class TasksHasuraRepository with Disposable, TasksRepositoryInterface {
  final HasuraConnect _hasuraConnect;
  TasksHasuraRepository(this._hasuraConnect);

  @override
  Future<bool> addTask(Task task) async {
    if (await checkTasksExistenceUpdate(task: task)) {
      return false;
    } else {
      try {
        var snapshot =
            await _hasuraConnect.mutation(addTaskMutation, variables: {
          "title": task.title,
          "hour": task.hour,
          "minutes": task.minutes,
          "day": task.day,
          "month": task.month,
          "category": task.category,
          "category_id": task.categoryId,
          "importance": task.importance,
          "description": task.description
        });

        if (snapshot['data']['insert_tasks']['affected_rows'] == 1)
          return true;
        else
          return false;
      } catch (e) {
        return false;
      }
    }
  }

  @override
  Future<bool> checkTasksExistenceAdd({Task task, String idUser}) async {
    var snapshot = await _hasuraConnect.query(checkForTaskQuery,
        variables: {"categoryId": task.categoryId, "taskTitle": task.title});
    if ((snapshot['data']['categorys'] as List).length > 0)
      return true;
    else
      return false;
  }

  @override
  Future<bool> deleteTask(Task task) async {
    return true;
  }

  @override
  Future<bool> updateTask(Task task) async {
    if (await checkTasksExistenceUpdate(task: task)) {
      return false;
    } else {
      try {
        var snapshot =
            await _hasuraConnect.mutation(updateTaskMutation, variables: {
          "id": task.id,
          "title": task.title,
          "hour": task.hour,
          "minutes": task.minutes,
          "day": task.day,
          "month": task.month,
          "category": task.category,
          "category_id": task.categoryId,
          "importance": task.importance,
          "description": task.description,
          "done": task.done
        });

        if (snapshot['data']['update_tasks']['affected_rows'] == 1)
          return true;
        else
          return false;
      } catch (e) {
        return false;
      }
    }
  }

  @override
  Future<bool> checkTasksExistenceUpdate({Task task, String idUser}) async {
    try {
      var snapshot = await _hasuraConnect.query(checkForTaskQuery,
          variables: {
            "categoryId": task.categoryId,
            "taskId": task.id,
            "taskTitle": task.title
          });
      if ((snapshot['data']['categorys'] as List).length > 0)
        return true;
      else
        return false;
    } catch (e) {
      print("checkTasksExistenceUpdate ERROR: $e");
      return false;
    }
  }

  @override
  void dispose() {}
}
