import 'package:rcis_ep_task_one/rcis_ep_task_one.dart' as rcis_ep_task_one;
import 'dart:io';

void main() async {
  String numsInFile = "";
  List<String> words = [];
  File file = File("");
  String line = "";

  try {
    file = File('numsTask1.txt');
    line = file.readAsStringSync();
  } catch (e) {
    print("Ошибка. Отсутсвует файл");
    file = await File('numsTask1.txt').writeAsString("");
  }

  words = line.split(" ");
  print(words);
  int count = 0;

  for (int i = 0; i < words.length; ++i) {
    words[i].length % 2 == 1 ? count++ : i = i;
  }
  print(count);
}