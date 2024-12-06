

import 'common/readfiles.dart';

Future<void> exerciceOne() async {
  List<List<int>> columns = await getTwoColumnFromFile('dayone/input-1.txt');
  final column1 = columns[0];
  final column2 = columns[1];
  column1.sort();
  column2.sort();
  final List<int> diffColumn = [];
  for (var i = 0; i < column1.length; i++) {
    var diff = column2[i] - column1[i];
    diffColumn.add(diff.abs());
  }
  int sum = diffColumn.reduce((value, element) => value + element);
  print(sum);
}

Future<void> exerciceTwo() async {
  List<List<int>> columns = await getTwoColumnFromFile('dayone/input-1.txt');
  final column1 = columns[0];
  final column2 = columns[1];
  column1.sort();
  column2.sort();

  final Map<int, int> nbOccurence = {};
  var previous = 0;
  for (var i = 0; i < column2.length; i++) {
    if (column2[i] == previous) {
      nbOccurence[column2[i]] = nbOccurence[column2[i]]! + 1;
    } else {
      nbOccurence[column2[i]] = 1;
      previous = column2[i];
    }
  }
  var factorDiff = 0;
  for (var i = 0; i < column1.length; i++) {
    if (nbOccurence.containsKey(column1[i])) {
      factorDiff += nbOccurence[column1[i]]!*column1[i];
    }
  }
  print(factorDiff);
}

void main() async {
  await exerciceOne();
  await exerciceTwo();
}