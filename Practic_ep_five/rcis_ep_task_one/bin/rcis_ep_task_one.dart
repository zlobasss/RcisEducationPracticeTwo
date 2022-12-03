import 'package:rcis_ep_task_one/rcis_ep_task_one.dart' as rcis_ep_task_one;
import 'dart:io';

void main() async {
  String numsInFile = "";
  List<int> nums = [];
  File file = File("");
  List<String> lines = [];

  int min = 0;
  int prod = 1;

  try {
    file = File('numsTask1.txt');
    lines = file.readAsLinesSync();
  } catch (e) {
    print("Ошибка. Отсутсвует файл");
    file = await File('numsTask1.txt').writeAsString("");
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
  print("numbers = $nums");

  for (int i = 0; i < nums.length; ++i) {
    nums[i] < nums[min] ? min = i : null;
  }
  for (int i = min + 1; i < nums.length; ++i) {
    prod *= nums[i];
  }
  print(prod);
}
