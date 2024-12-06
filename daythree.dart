

import 'common/readfiles.dart';

Future<void> exerciceOne() async {
  String line = await getTextFromFile('daythree/input.txt');
  RegExp regExp = RegExp(r'mul\((\d+),(\d+)\)'); // Correspond à des mots de 4 lettres
  int result = 0;
  Iterable<RegExpMatch> matches = regExp.allMatches(line.toString());
  for (final match in matches) {
    String? group1 = match.group(1);
    String? group2 = match.group(2);
    if (group1 != null && group2 != null) {
      result += int.parse(group1) * int.parse(group2);
    }
  }
  print(result);
}

Future<void> exerciceTwo() async {

  String line = await getTextFromFile('daythree/input.txt');
  // remove line terminator
  line = line.replaceAll('\n', '');

  RegExp regExpDo = RegExp(r"don't\(\).*?do\(\)");
  // remove all matches
  line = line.replaceAll(regExpDo, '');
  // remove the end of sting from last don't()
  if (line.indexOf('don\'t()') > 0) {
    line = line.substring(0, line.indexOf('don\'t()'));
  }

  int result = 0;
  RegExp regExp = RegExp(r'mul\((\d+),(\d+)\)'); // Correspond à des mots de 4 lettres
  Iterable<RegExpMatch> matches = regExp.allMatches(line.toString());
  for (final match in matches) {
    String? group1 = match.group(1);
    String? group2 = match.group(2);
    if (group1 != null && group2 != null) {
      result += int.parse(group1) * int.parse(group2);
    }
  }
  print(result);

}

void main() async {
  await exerciceOne();
  await exerciceTwo();
}