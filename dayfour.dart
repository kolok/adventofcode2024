

import 'common/readfiles.dart';

Future<void> exerciceOne() async {
  List<String> lines = await getFileLines('dayfour/input.txt');

  List<String> searchLines = [];
  // Lire ligne par ligne
  for (var line in lines) {
    searchLines.add(line);
  }

  // Lire colonne par colonne
  int nb_col = lines[0].length;
  for (int col = 0; col < nb_col; col++) {
    String column = '';
    for (var line in lines) {
      column += line[col];
    }
    searchLines.add(column);
  }

  // Lire diagonale par diagonale
  int n = lines.length;
  int m = lines[0].length;

  // Diagonales de gauche à droite
  for (int d = 0; d < n + m - 1; d++) {
    String diagonal = '';
    for (int i = 0; i <= d; i++) {
      int j = d - i;
      if (i < n && j < m) {
        diagonal += lines[i][j];
      }
    }
    if (diagonal.length > 2) {
      searchLines.add(diagonal);
    }
  }

  // Diagonales de droite à gauche
  for (int d = 0; d < n + m - 1; d++) {
    String diagonal = '';
    for (int i = 0; i <= d; i++) {
      int j = m - 1 - (d - i);
      if (i < n && j >= 0) {
        diagonal += lines[i][j];
      }
    }
    if (diagonal.length > 2) {
      searchLines.add(diagonal);
    }
  }

  // nombre d'occurence de 'XMAS' dans les lignes
  int count = 0;
  for (var line in searchLines) {
    int nbXmas = RegExp(r'XMAS').allMatches(line).length;
    int nbSamx = RegExp(r'SAMX').allMatches(line).length;
    count += nbXmas + nbSamx;
  }
  print(count);


}

Future<void> exerciceTwo() async {
  List<String> lines = await getFileLines('dayfour/input.txt');
  int count = 0;
  List<String> searchLines = [];
  // Lire ligne par ligne
  int indexLine = 0;
  int nb_line = lines.length;
  for (var i = 1; i < nb_line-1; i++) {
    String line = lines[i];
    // trouver les index de tous les A
    for (int j = 1; j < line.length-1; j++) {
      if (line[j] == 'A') {
        String mas1 = '';
        mas1 += lines[i-1][j-1];
        mas1 += lines[i+1][j+1];
        String mas2 = '';
        mas2 += lines[i-1][j+1];
        mas2 += lines[i+1][j-1];
        if (mas1.indexOf('M') != -1 && mas1.indexOf('S') != -1 && mas2.indexOf('M') != -1 && mas2.indexOf('S') != -1) {
          count++;
        }
      }
    }
  }
  print(count);
}

void main() async {
  await exerciceOne();
  await exerciceTwo();
}