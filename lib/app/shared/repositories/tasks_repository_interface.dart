import 'package:flutter/foundation.dart';
import 'package:todolist/app/shared/models/task.dart';

abstract class TasksRepositoryInterface {
  Future<bool> addTask(Task task);
  Future<bool> deleteTask(Task task);
  Future<bool> updateTask(Task task);

  Future<bool> checkTasksExistenceAdd(
      {@required Task task});
      Future<bool> checkTasksExistenceUpdate(
      {@required Task task});
}
