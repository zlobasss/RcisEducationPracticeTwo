import 'package:rcis_ep_task_three/rcis_ep_task_three.dart' as rcis_ep_task_three;
import 'dart:io';
import 'dart:math';

void main() async 
{
  File file = File("");
  String line = "";
  String string = "";
  int number = 0;
  List<int> nums = [];

  try
  {
    file = File('numsTask3.txt');
    line = "${file.readAsStringSync()},";
  } catch (e)
  {
    print("Ошибка. Отсутсвует файл");
    file = await File('numsTask3.txt').writeAsString("");
  }

  for (int i = 0; i < line.length; ++i)
  {
    if (line[i] != ',')
    {
      string += line[i];
    }
    else if (line[i] == ',' && string != "")
    {
      try
      {
        number = int.parse(string);
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
  print("Числа: $nums");
  int minNum = nums.reduce(min);
  int maxNum = nums.reduce(max);
  
  stdout.write("Max = $maxNum; Min = $minNum");
}