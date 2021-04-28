import 'package:get/get.dart';

class TemplateController extends GetxController {
  int chooseTemplate = 1;

  void setChooseTemplate(int val) {
    chooseTemplate = val;
    update(['choose_template']);
  }
}
