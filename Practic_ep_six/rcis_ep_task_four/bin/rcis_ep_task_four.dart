import 'package:rcis_ep_task_four/rcis_ep_task_four.dart' as rcis_ep_task_four;

import 'dart:io';

void main() {
  int a = 0;
  stdout.write("Введите число a: ");
  try {
    a = int.parse(stdin.readLineSync()!);
  } catch (e) {
    print(e);
  }

  const int N = 5;
  int sum = 0;
  int number = 0;
  for (int i = 0; i < N; ++i) {
    stdout.write("Введите число (осталось ${N - i} чисел): ");
    try {
      number = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print(e);
      number = 0;
    }
    sum += (number % a == 0 ? number : 0);
  }
  print("Summa = $sum");
}
