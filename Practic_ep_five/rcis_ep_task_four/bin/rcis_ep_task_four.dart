import 'package:rcis_ep_task_four/rcis_ep_task_four.dart' as rcis_ep_task_four;

import 'dart:io';
import 'dart:math';

void main() async {
  String numsInFile = "";
  List<int> nums = [];
  File file = File("");
  List<String> lines = [];

  try {
    file = File('numsTask4.txt');
    lines = file.readAsLinesSync();
  } catch (e) {
    print("Ошибка. Отсутсвует файл");
    file = await File('numsTask4.txt').writeAsString("");
  }

  for (int k = 0; k < lines.length; ++k) {
    lines[k] += " ";
    for (int i = 0; i < lines[k].length; ++i) {
      if (lines[k][i] != " " && lines[k][i] != ",") {
        numsInFile += lines[k][i];
      } else if ((lines[k][i] == " " || lines[k][i] == ",") &&
          numsInFile != "") {
        try {
          nums.add(int.parse(numsInFile));
        } catch (e) {
          print("\nЭто не число => $numsInFile \n");
        }
        numsInFile = "";
      }
    }
  }
  int sum = 0;
  for (int i = 0; i < nums.length; ++i) {
    if (nums.reduce(max) - 1 == nums[i]) {
      sum += nums[i];
    }
  }

  print("nums = $nums");
  print("sum = $sum");
}
