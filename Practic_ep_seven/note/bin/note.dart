import 'package:note/note.dart' as note;

import 'dart:io';
import 'dart:convert';

class Note {
  String name = "null";
  String description = "null";
  String expDate = "0000-00-00";
  void display() {
    stdout.write("$name ($description) до ");
    try {
      print(
          specifyTime(format(DateTime.parse(expDate)), format(DateTime.now())));
    } catch (e) {
      print("null-nu-ll");
    }
  }
}

void printLogo(String date) {
  print(
      "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
  print("\n-----------");
  print("Ежедневник");
  print("-----------");
  stdout.write(
      "Добавить задачу на $date - \"add\"        \t Удалить задачу на $date- \"rem\" \n");
  stdout.write(
      "Изменить задачу на $date - \"edit\"       \t Показать все задачи - \"all\"\n");
  stdout.write(
      "Показать задачи на определённую дату - \"list\"\t Показать задачи на неделю - \"week\"\n");
  stdout.write(
      "Выбрать дату - \"select\"                       \t Выйти - \"exit\"\n");
  print("---------------------------");
}

void result() {
  print("-----------");
  stdout.write("Press ENTER... ");
  stdin.readLineSync();
}

String specifyTime(String date, String today) {
  int a = 0;
  int b = 0;
  try {
    a = int.parse(date.replaceAll('-', ''));
    b = int.parse(today.replaceAll('-', ''));
  } catch (e) {
    return "null-nu-ll";
  }

  if (a - b == 0) {
    return "Сегодня";
  } else if (a - b == 1 ||
      a - b == 70 ||
      a - b == 71 ||
      a - b == 72 ||
      a - b == 73 ||
      a - b == 8870) {
    return "Завтра";
  } else if (a - b == 2 ||
      a - b == 71 ||
      a - b == 72 ||
      a - b == 73 ||
      a - b == 74 ||
      a - b == 8871) {
    return "Послезавтра";
  }
  return date;
}

void remDate(Note task, var map, DateTime date) {
  try {
    for (String key in map[format(date)].keys) {
      task.name = key;
    }
  } catch (e) {
    map.remove(format(date));
  }
}

String format(DateTime date) {
  String dateString = date.toString();
  dateString =
      dateString.replaceRange(dateString.indexOf(' '), dateString.length, '');
  return dateString;
}

void week(var map, Note task) {
  String date = format(DateTime.now());
  String tempDate = date;
  print("-----------");
  String temp = "";
  int day = DateTime.parse(tempDate).day;

  while (day < DateTime.parse(tempDate).day + 7) {
    temp = (day < 10 ? "0$day" : "$day");
    date = format(DateTime.parse(
        tempDate.replaceRange(tempDate.length - 2, tempDate.length, '') +
            temp));
    task.expDate = date;
    try {
      for (String key in map[task.expDate].keys) {
        task.name = key;
        task.description = map[task.expDate][key]["description"];
        task.display();
      }
    } catch (e) {
      print("Отсутствуют задачи на $date");
    }
    day++;
  }
  result();
}

void all(var map, Note task) {
  print("-----------");
  int count = 0;
  for (String date in map.keys) {
    count++;
    taskInDay(task, DateTime.parse(date), map);
  }
  count == 0 ? print("Задачи отсутствуют...") : null;

  result();
}

void add(String date, Note task, Map<String, dynamic> map) {
  task.expDate = date;
  stdout.write("Введите название задачи: ");
  task.name = stdin.readLineSync()!;
  task.name == "" ? "null" : null;
  stdout.write("Введите описание задачи: ");
  task.description = stdin.readLineSync()!;
  task.description == "" ? "null" : null;

  map.addAll({
    task.expDate: {
      task.name: {"description": task.description}
    }
  });
  remDate(task, map, DateTime.parse(date));
  result();
}

void remove(DateTime date, Note task, Map<String, dynamic> map) {
  stdout.write("Введите название задачи: ");
  task.name = stdin.readLineSync()!;

  try {
    map[format(date)].remove(task.name);
  } catch (e) {
    print("Такой задачи нету...");
  }
  remDate(task, map, date);
}

void edit() {}

DateTime select(DateTime date) {
  stdout.write("Введите дату в формате (гггг-ММ-дд): ");
  try {
    return DateTime.parse(stdin.readLineSync()!);
  } catch (e) {
    return DateTime.parse("-0001-11-30");
  }
}

void list(DateTime date, Note task, var map) {
  print("-----------");
  taskInDay(task, date, map);
  result();
}

void taskInDay(Note task, DateTime date, var map) {
  task.expDate = format(date);
  print("${specifyTime(format(date), format(DateTime.now()))}:");
  try {
    for (String key in map[task.expDate].keys) {
      task.name = key;
      task.description = map[task.expDate][key]["description"];
      task.display();
    }
  } catch (e) {
    print("Задачи на этот день отсутствуют");
  }
}

void main() async {
  File jsonData = File("");
  var parsedJsonData;
  Map<String, dynamic> temp = {};
  DateTime today = DateTime.now();

  try {
    jsonData = File('tasks.json');
    parsedJsonData = jsonDecode(jsonData.readAsStringSync());
  } catch (e) {
    jsonData = await File('tasks.json').writeAsString("");
    parsedJsonData = temp;
  }

  Note task = Note();

  DateTime date = today;
  String exit = "";
  String func = "list";

  while (exit != "0") {
    printLogo(format(date));
    if (func == "") {
      stdout.write("Введите функцию: ");
      func = stdin.readLineSync()!;
    }
    switch (func) {
      case "list":
        list(date, task, parsedJsonData);
        break;
      case "week":
        week(parsedJsonData, task);
        break;
      case "add":
        add(format(date), task, parsedJsonData);
        jsonData =
            await File('tasks.json').writeAsString(jsonEncode(parsedJsonData));
        break;
      case "rem":
        list(date, task, parsedJsonData);
        remove(date, task, parsedJsonData);
        jsonData =
            await File('tasks.json').writeAsString(jsonEncode(parsedJsonData));
        break;
      case "edit":
        jsonData =
            await File('tasks.json').writeAsString(jsonEncode(parsedJsonData));
        break;
      case "select":
        date = select(date);
        break;
      case "exit":
        exit = "0";
        break;
      case "all":
        all(parsedJsonData, task);
        break;
      default:
        break;
    }
    func = "";
  }
}
