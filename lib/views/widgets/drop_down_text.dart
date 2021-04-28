import 'package:flutter/material.dart';
import 'package:project_akebono/controller/input_controller.dart';
import 'package:project_akebono/models/drop_down_view.dart';

Widget dropDown(String title, List<DropDownModel> dataList, String value,
    Function onChange) {
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
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: DropdownButton(
              underline: Container(),
              isExpanded: true,
              value: value,
              onChanged: onChange,
              items: dataList.map((e) {
                return DropdownMenuItem<String>(
                  value: e.nama,
                  child: Text(e.nama),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    ),
  );
}
