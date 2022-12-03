import 'package:rcis_ep_task_two/rcis_ep_task_two.dart' as rcis_ep_task_two;
import 'dart:io';

void main() async {
  String numsInFile = "";
  List<double> nums = [];
  File file = File("");
  List<String> lines = [];

  try {
    file = File('numsTask2.txt');
    lines = file.readAsLinesSync();
  } catch (e) {
    print("Ошибка. Отсутсвует файл");
    file = await File('numsTask2.txt').writeAsString("");
  }

  for (int k = 0; k < lines.length; ++k) {
    lines[k] += ";";
    for (int i = 0; i < lines[k].length; ++i) {
      if (lines[k][i] != ";") {
        numsInFile += lines[k][i];
      } else if (lines[k][i] == ";" && numsInFile != "") {
        try {
          nums.add(double.parse(numsInFile));
        } catch (e) {
          print("\nЭто не число => $numsInFile \n");
        }
        numsInFile = "";
      }
    }
  }
  

  for (int i = 0; i < nums.length - 1; ++i) {
    for (int j = i + 1; j < nums.length; ++j) {
      if (nums[i] > nums[j]) {
        double c = nums[i];
        nums[i] = nums[j];
        nums[j] = c;
      }
    }
  }
  print("numbers = $nums");
  numsInFile = "";
  for (int i = 0; i < nums.length; ++i) {
    numsInFile += "${nums[i]};";
  }
  file = await File('numsTask2.txt').writeAsString(numsInFile);
}
