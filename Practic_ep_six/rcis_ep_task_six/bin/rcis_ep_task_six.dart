import 'dart:io';
import 'dart:math';

import 'package:rcis_ep_task_six/rcis_ep_task_six.dart' as rcis_ep_task_six;

void main() {
  int n = Random().nextInt(10) + 1;
  List<double> array = [];
  List<double> pos = [];
  List<double> neg = [];

  for (int i = 0; i < n; ++i) {
    stdout.write("Введите число (осталось ${n - i}): ");
    try {
      array.add(double.parse(stdin.readLineSync()!));
    } catch (e) {
      print(e);
      array.add(0);
    }
  }

  for (int i = 0; i < n; ++i) {
    array[i] > 0 ? pos.add(array[i]) : null;
    array[i] < 0 ? neg.add(array[i]) : null;
  }
  print(array);
  print(pos);
  print(neg);
}
