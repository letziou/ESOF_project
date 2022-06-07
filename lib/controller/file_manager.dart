import 'dart:async';
import 'dart:io';
import 'package:uni/utils/constants.dart' as Constants;

import 'package:gsheets/gsheets.dart';
import 'package:path_provider/path_provider.dart';

class fileManager{

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/alarm_save.txt');
  }

  Future<File> writeListTimes(List<int> times) async {
    final file = await _localFile;

    // Write the file
    for(int i=0; i<times.length; i++){
      return file.writeAsString(times[i].toString()+' ');
    }
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<void> basic() async {
    // init GSheets
    final gsheets = GSheets(Constants.credentials);
    // fetch spreadsheet by its id
    final ss = await gsheets.spreadsheet(Constants.spreadsheetId);
    // get worksheet by its title
    final sheet = await ss.worksheetByTitle('products');
    // prints - [100, Product A, 50, 100.0]
    print(await sheet.values.row(2));

    // prints - [Product A, Product B, Product C, Product D, Product F, Product G]
    // we use 'fromRow' to skip first row
    print(await sheet.values.column(2, fromRow: 2));

    // prints - Product A
    print(await sheet.values.value(row: 2, column: 2));

    // inserts passed values into second row
    await sheet.values.insertRow(
      2,
      [200, 'Ex Product A', 60, 110.0],
    );

    // updates B2 cell by inserting passed value
    await sheet.values.insertValue(
      'Product A',
      row: 2,
      column: 2,
    );

    // appends passed values to the products table
    await sheet.values.appendRow(
      [200, 'Ex Product A', 60, 110.0],
    );

    // deletes row #8
    await sheet.deleteRow(8);
  }
}