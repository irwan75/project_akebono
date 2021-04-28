import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akebono/api/list_api.dart';
import 'package:project_akebono/controller/login_controller.dart';
import 'package:project_akebono/services/default_dialog.dart';
import 'package:project_akebono/services/storage_preferences.dart';
import 'package:project_akebono/views/pages/template.dart';

class Login extends StatelessWidget {
  TextEditingController _formUsername = TextEditingController();
  TextEditingController _formPassword = TextEditingController();

  ListApi _listApi = new ListApi();
  StoragePreferences _storagePreferences = new StoragePreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          constraints: BoxConstraints(maxWidth: Get.width / 2.5),
          child: GetBuilder<LoginController>(
            id: 'refresh_page',
            init: LoginController(),
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Halaman Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    expands: false,
                    controller: _formUsername,
                    decoration: InputDecoration(
                      hintText: "Username",
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    expands: false,
                    obscureText: true,
                    controller: _formPassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MaterialButton(
                        color: Colors.green,
                        onPressed: () async {
                          if (_formUsername.text.isEmpty ||
                              _formUsername.text == "" ||
                              _formPassword.text.isEmpty ||
                              _formPassword.text == "") {
                            viewDefaultDialog("Mohon Isi Form Terlebih Dahulu");
                          } else {
                            var result = await _listApi.loginApi(
                                _formUsername.text.trim(),
                                _formPassword.text.trim());
                            if (result == 1) {
                              _storagePreferences
                                  .saveUsername(_formUsername.text);
                              Get.to(Template());
                            } else if (result == 0) {
                              viewDefaultDialog("User Anda Belum Terdaftar");
                            } else {
                              viewDefaultDialog("Password atau Username Salah");
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 7),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      MaterialButton(
                        color: Colors.grey,
                        onPressed: () {
                          _formUsername = new TextEditingController(text: "");
                          _formPassword = new TextEditingController(text: "");
                          controller.refreshPage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 7),
                          child: Text(
                            "Clear",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
