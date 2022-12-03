import 'package:rcis_ep_task_three/rcis_ep_task_three.dart'
    as rcis_ep_task_three;
import 'dart:io';
import 'dart:math';

void main() async {
  String numsInFile = "";
  List<int> nums = [];
  File file = File("");
  List<String> lines = [];

  try {
    file = File('numsTask3.txt');
    lines = file.readAsLinesSync();
  } catch (e) {
    print("Ошибка. Отсутсвует файл");
    file = await File('numsTask3.txt').writeAsString("");
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
  int index = 0;
  try {
    index = nums.indexOf(nums.reduce(min));
  } catch (e) {
    print(e);
  }
  double aver = 0;
  for (int i = 0; i < index; ++i) {
    aver += nums[i];
  }
  aver /= index;
  print("numbers = $nums");
  print("average = $aver");
}
