

import 'common/readfiles.dart';

int isCorrect(List<int> line) {
  for (int i = 1; i < line.length; i++) {
    if (line[i] <= line[i - 1] || line[i] > line[i - 1] + 3) {
      return i;
    }
  }
  return 0;
}

Future<void> exerciceOne() async {
  List<List<int>> lines = await getLinesFromFile('daytwo/input.txt');

  int nb_correct_result = 0;
  lines.forEach((line) {
    int first = line.first;
    int last = line.last;
    if (first >= last) {
      line = line.reversed.toList();
    }
    if (isCorrect(line)==0) {
      nb_correct_result++;
    }
  });
  print(nb_correct_result);
}

Future<void> exerciceTwo() async {

  List<List<int>> lines = await getLinesFromFile('daytwo/input.txt');

  int nb_correct_result = 0;
  lines.forEach((line) {
    int first = line.first;
    int last = line.last;
    if (first >= last) {
      line = line.reversed.toList();
    }
    int index = isCorrect(line);
    if (isCorrect(line)==0) {
      nb_correct_result++;
    }
    else {
      List<int> lineClone = List.from(line);
      lineClone.removeAt(index-1);
      if (isCorrect(lineClone)==0) {
        nb_correct_result++;
      }
      else {
        List<int> lineCloneTwo = List.from(line);
        lineCloneTwo.removeAt(index);
        if (isCorrect(lineCloneTwo)==0) {
          nb_correct_result++;
        }
      }
    }
  });
  print(nb_correct_result);
}

void main() async {
  await exerciceOne();
  await exerciceTwo();
}