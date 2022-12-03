import 'package:rcis_ep_task_six/rcis_ep_task_six.dart' as rcis_ep_task_six;
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

  double x = (a - 2) / 5;

  print(-3 <= a && a <= 2 && 2 * x <= b && b <= -2 * x
      ? "Принадлежит"
      : "Не принадлежит");
  stdin.readLineSync();
}
