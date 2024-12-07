



import 'dart:io';

Future<List<List<int>>> getTwoColumnFromFile(String filename) async {
  final file = File(filename);
  final lines = await file.readAsLines();

  List<int> column1 = [];
  List<int> column2 = [];

  for (var line in lines) {
    var parts = line.split(RegExp(r'\s+'));
    if (parts.length == 2) {
      column1.add(int.parse(parts[0]));
      column2.add(int.parse(parts[1]));
    }
    else {
      print('Invalid line: $line');
    }
  }

  return [column1, column2];
}

Future<List<List<int>>> getLinesFromFile(String filename) async {
  final file = File(filename);
  final lines = await file.readAsLines();

  List<List<int>> result = [];
  for (var line in lines) {
    var line_result = line.split(RegExp(r'\s+')).map((e) => int.parse(e)).toList();
    result.add(line_result);
  }
  return result;
}

Future<String> getTextFromFile(String filename) async {
  final file = File(filename);
  final result = await file.readAsString();
  return result;
}

Future<List<String>> getFileLines(String filename) async {
  final file = File(filename);
  final lines = await file.readAsLines();
  return lines;
}
