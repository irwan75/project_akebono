import 'package:intl/intl.dart';

String changeFormatDate(DateTime timeGet) {
  final f = new DateFormat('dd-MM-yyyy hh:mm');
  return f.format(timeGet).toString().split(" ")[0];
}
