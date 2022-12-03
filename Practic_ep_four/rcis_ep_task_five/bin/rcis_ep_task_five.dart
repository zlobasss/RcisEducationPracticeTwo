import 'package:rcis_ep_task_five/rcis_ep_task_five.dart' as rcis_ep_task_five;
import 'dart:io';

void main() {
  double a = 0;
  double b = 0;

  try {
    stdout.write("Введите a: ");
    a = double.parse(stdin.readLineSync()!);
  } catch (e) {
    print("Неверный формат числа...");
    a = 0;
  }
  try {
    stdout.write("Введите b: ");
    b = double.parse(stdin.readLineSync()!);
  } catch (e) {
    print("Неверный формат числа...");
    b = 0;
  }

  print(a >= -2 && a <= 4 && b >= -1 && b <= 3
      ? "Принадлежит"
      : "Не принадлежит");
}
