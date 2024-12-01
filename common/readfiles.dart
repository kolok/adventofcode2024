



import 'dart:io';

Future<List<List<int>>> getListFromFile(String filename) async {
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