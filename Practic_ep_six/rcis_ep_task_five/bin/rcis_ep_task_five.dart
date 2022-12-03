import 'dart:io';
import 'dart:math';

import 'package:rcis_ep_task_five/rcis_ep_task_five.dart' as rcis_ep_task_five;


void main() {
  int n = 5;
  int m = 7;
  List<List<int>> numbers = List.generate(n, (_) => List.generate(m, (_) => Random().nextInt(2)));
  
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < m; ++j) {
      stdout.write("${numbers[i][j]} ");
    }
    stdout.write("\n");
  }
  print("");

  int count = 0;
  for (int j = 0; j < n; ++j) {
    for (int i = 0; i < m; ++i) {
      numbers[j][i] == 1 ? count++ : null;
    }
    numbers[j].add(count % 2 == 1 ? 1 : 0);
    count = 0;
  }
  
  m++;

  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < m; ++j) {
      stdout.write("${numbers[i][j]} ");
    }
    stdout.write("\n");
  }
}
