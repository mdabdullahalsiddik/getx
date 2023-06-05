import 'package:get/get.dart';

import '../model/student_model.dart';

class HomeController extends GetxController {
  List<StudentModel> studentList = [];

  void adddata(StudentModel data) {
    studentList.add(data);
    update();
  }
}
