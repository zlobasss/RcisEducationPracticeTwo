import 'package:rcis_ep_task_four/rcis_ep_task_four.dart' as rcis_ep_task_four;
import 'dart:io';

void main() async {
  File file = File("");
  String line = "";
  String string = "";
  List<int> nums = [];
  int count = 1;

  try {
    file = File('numsTask4.txt');
    line = "${file.readAsStringSync()} ";
  } catch (e) {
    print("Ошибка. Отсутсвует файл");
    file = await File('numsTask4.txt').writeAsString("");
  }

  for (int i = 0; i < line.length; ++i) {
    if (line[i] != ' ') {
      string += line[i];
    } else if (line[i] == ' ' && string != "") {
      try {
        nums.add(int.parse(string));
      } catch (e) {
        print("Неверное число: '$string'");
      }
      string = "";
    }
  }

  print(nums);

  for (int i = 1; i < nums.length; ++i) {
    if (nums[i] == nums[i - 1]) {
      ++count;
    } else if (count != 1) {
      print(
          "${nums[i - 1]} повторяется $count раз(а) в промежутке [${i - count}, ${i - 1}]");
      count = 1;
    }
    if (i == nums.length - 1) {
      print(
          "${nums[i - 1]} повторяется $count раз(а) в промежутке [${i + 1 - count}, $i]");
    }
  }
}
