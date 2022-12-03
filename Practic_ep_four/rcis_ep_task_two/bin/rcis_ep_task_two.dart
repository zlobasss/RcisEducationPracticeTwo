import 'package:rcis_ep_task_two/rcis_ep_task_two.dart' as rcis_ep_task_two;

import 'dart:io';

void main() async 
{
  File file = File("");
  String line = "";
  List<double> nums = [];
  String string = "";
  double number = 0;

  double sum = 0;

  try
  {
    file = File('numsTask2.txt');
    line = "${file.readAsStringSync()};";
  } catch (e)
  {
    print("Ошибка. Отсутсвует файл");
    file = await File('numsTask2.txt').writeAsString("");
  }
  
  for (int i = 0; i < line.length; ++i)
  {
    if (line[i] != ';')
    {
      string += line[i];
    }
    else if (line[i] == ';' && string != "")
    {
      try
      {
        number = double.parse(string);
        if (number != 0)
        {
          nums.add(number);
        }
        else 
        {
          i = line.length;
        }
      } catch (e)
      {
        print("Неверное число: '$string'");
      }
      string = "";
    }
  }

  for (int i = 0; i < nums.length; ++i)
  {
    nums[i] > 0 ? sum += nums[i] : i = i;
    print(nums[i]);
  }

  print(nums);
  print(sum.toStringAsFixed(2));
}
