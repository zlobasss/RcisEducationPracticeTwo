import 'package:rcis_ep_task_two/rcis_ep_task_two.dart' as rcis_ep_task_two;

import 'dart:io';

void main() async {
  String numsInFile = "";
  List<String> lines = [];
  File file = File("");

  try {
    file = File('numsTask2.txt');
    lines = file.readAsLinesSync();
  } catch (e) {
    print("Ошибка. Отсутсвует файл");
    file = await File('numsTask2.txt').writeAsString("");
  }

  print(lines);
  String line = "";

  for (int i = 0; i < lines.length; ++i) {
    line += "${lines[i]} ";
  }
  print(line);
}