import 'package:rcis_ep_task_three/rcis_ep_task_three.dart' as rcis_ep_task_three;

import 'dart:io';

void main() {
  stdout.write("Введите число: ");
  int a = 0;
  try {
    a = int.parse(stdin.readLineSync()!);
  } catch (e) {
    print(e);
  }
  print("Число a = $a");
  print(a % 10 == 0 ? "True" : "False");
}
