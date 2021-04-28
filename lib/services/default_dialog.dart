import 'package:flutter/material.dart';
import 'package:get/get.dart';

void viewDefaultDialog(String notif) {
  Get.defaultDialog(
    title: "",
    titleStyle: TextStyle(fontSize: 0.1),
    content: Container(
      child: Text(notif),
    ),
  );
}
