import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home_controller.dart';
import 'package:getx/model/student_model.dart';
import 'package:getx/static/all_color.dart';
import 'package:getx/static/all_text.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  String name = "";
  String roll = "";
  String subject = "";
  final formkey = GlobalKey<FormState>();
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 5.0, right: 5.0, bottom: 5.0),
        child: Container(
          child: Column(
            children: [
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: AllText.namehinttext,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: AllColor.orangecolor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: AllColor.blackcolor,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Empty Field";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        name = newValue.toString();
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: AllText.rollhinttext,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: AllColor.orangecolor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: AllColor.blackcolor,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Empty Field";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        roll = newValue.toString();
                      },
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: AllText.subjecthinttext,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: AllColor.orangecolor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: AllColor.blackcolor,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Empty Field";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        subject = newValue.toString();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    homeController.adddata(StudentModel(name, roll, subject));
                  }
                },
                child: AllText.bottontext,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AllColor.orangecolor)),
              ),
              Expanded(
                child: GetBuilder<HomeController>(
                  builder: (_) {
                    return ListView.builder(
                      itemCount: homeController.studentList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AllColor.orangecolor,
                                border: Border.all(width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: ListTile(
                              title:
                                  Text(homeController.studentList[index].name),
                              leading:
                                  Text(homeController.studentList[index].roll),
                              subtitle: Text(
                                  homeController.studentList[index].subject),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
