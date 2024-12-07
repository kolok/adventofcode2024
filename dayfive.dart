

import 'common/readfiles.dart';

Future<void> exerciceOne() async {
  List<String> lines = await getFileLines('dayfive/input-rules.txt');

  // creer un dict 
  Map<int, Set<int>> rules = {};
  for (var line in lines) {
    List<String> parts = line.split('|');
    int key = int.parse(parts[0]);
    // test is key est dans la map
    if (rules[key] == null) {
      rules[key] = Set();
    }
    rules[key]?.add(int.parse(parts[1]));
  }

  List<String> printOrders = await getFileLines('dayfive/input-print-order.txt');

  int sum = 0;
  for (var printOrder in printOrders) {
    List<String> parts = printOrder.split(',');
    Set<int> printed = Set();
    bool isSuccessful = true;
    for (var part in parts) {
      int page = int.parse(part);
      if (rules[page] != null) {
        // intersection de rules[page] et printed
        if (!printed.intersection(rules[page]!).isEmpty) {
          isSuccessful = false;
          break;
        }
      }
      printed.add(page);
    }
    if (!isSuccessful) {
      continue;
    }
    int indexMiddle = (parts.length-1) ~/ 2;
    sum += int.parse(parts[indexMiddle]);
  }
  print(sum);
}

Future<void> exerciceTwo() async {
  List<String> lines = await getFileLines('dayfive/input-rules.txt');

  // creer un dict 
  Map<int, Set<int>> rules = {};
  for (var line in lines) {
    List<String> parts = line.split('|');
    int key = int.parse(parts[0]);
    // test is key est dans la map
    if (rules[key] == null) {
      rules[key] = Set();
    }
    rules[key]?.add(int.parse(parts[1]));
  }

  List<String> printOrders = await getFileLines('dayfive/input-print-order.txt');

  int sum = 0;
  for (var printOrder in printOrders) {
    List<String> parts = printOrder.split(',');
    List<int> partSet = parts.map((e) => int.parse(e)).toList();

    List<int> printed = [];
    bool isSuccessful = true;
    for (var page in partSet) {
      if (rules[page] != null) {
        // intersection de rules[page] et printed
        Set intersection = Set.from(printed).intersection(rules[page]!);
        if (!intersection.isEmpty) {
          isSuccessful = false;
          break;
        }
      }
      printed.add(page);
    }
    if (isSuccessful) {
      continue;
    }
    partSet = orderPages(rules, partSet);

    int indexMiddle = (partSet.length-1) ~/ 2;
    sum += partSet[indexMiddle];
  }
  print(sum);
}

List<int> orderPages(Map<int, Set<int>> rules, List<int> pages) {
  List<int> printed = [];


  for (var page in pages) {

    if (rules[page] != null) {
      Set intersection = Set.from(printed).intersection(rules[page]!);
      if (!intersection.isEmpty) {
        // get the most mall index of intersection values in pages
        int minIndex = pages.length;
        for (var value in intersection) {
          int index = pages.indexOf(value);
          if (index < minIndex) {
            minIndex = index;
          }
        }
        // remove the page in the actual index
        pages.remove(page);
        //insert the page in the minIndex
        pages.insert(minIndex, page);
        return orderPages(rules, pages);
      }
    }
    printed.add(page);
  }
  return printed;
}


void main() async {
  await exerciceOne();
  await exerciceTwo();
}