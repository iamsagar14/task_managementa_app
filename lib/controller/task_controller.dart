import 'package:get/get.dart';
import '../db/db_helper.dart';
import '../models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;
  //insert data to the table
  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  //get all data from table
  void getTask() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

//delete data from the table
  void delete(Task? task) {
    DBHelper.delete(task);
    getTask();
  }

//making update to the table
  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getTask();
  }
}
