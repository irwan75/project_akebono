import 'package:flutter/material.dart';

Widget textFormField(String title, TextEditingController controller,
    TextInputType textInputType, bool readOnly) {
  return Container(
    child: Row(
      children: [
        Container(
          constraints: BoxConstraints(minWidth: 80),
          child: Text(
            "$title",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Text(" :  "),
        Expanded(
          child: Container(
            child: TextFormField(
              keyboardType: textInputType,
              controller: controller,
              readOnly: readOnly,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
