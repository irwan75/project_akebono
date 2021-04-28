import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akebono/controller/template_controller.dart';
import 'package:project_akebono/services/storage_preferences.dart';
import 'package:project_akebono/views/pages/dashboard.dart';
import 'package:project_akebono/views/pages/input_page.dart';
import 'package:project_akebono/views/pages/login.dart';
import 'package:project_akebono/views/pages/view_page.dart';

class Template extends StatelessWidget {
  StoragePreferences _storagePreferences = new StoragePreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            GetBuilder<TemplateController>(
              init: TemplateController(),
              builder: (controller) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(3, 0),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person_pin,
                        color: Colors.blue,
                        size: 120,
                      ),
                      textButton(
                        () {
                          controller.setChooseTemplate(1);
                        },
                        "Dashboard",
                      ),
                      textButton(
                        () {},
                        "Transaksi",
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.setChooseTemplate(2);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          padding: EdgeInsets.only(
                              left: 10, right: 35, top: 6, bottom: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text("Input"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.setChooseTemplate(3);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          padding: EdgeInsets.only(
                              left: 10, right: 35, top: 6, bottom: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text("View"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textButton(
                        () {
                          _storagePreferences.saveUsername("");
                          Get.offAll(Login());
                        },
                        "Logout",
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: Container(
                color: Colors.grey.shade200,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: GetBuilder<TemplateController>(
                  id: 'choose_template',
                  init: TemplateController(),
                  builder: (controller) {
                    if (controller.chooseTemplate == 1)
                      return Dashboard();
                    else if (controller.chooseTemplate == 2)
                      return InputPage();
                    else if (controller.chooseTemplate == 3) return ViewPage();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textButton(Function callback, String text) {
  return IntrinsicWidth(
    child: GestureDetector(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.only(left: 10, right: 35, top: 6, bottom: 6),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
