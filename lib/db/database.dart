import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/operation_file.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database? _database;

  String operationTable = 'tableName';
  String operationRes = 'operation';
  String columnId = 'id';
  String columnData = 'dataTame';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}operation.db';
    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  //operation
  // id | operationRes | data

  void _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $operationTable($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $operationRes TEXT, $columnData TEXT)',
    );
  }

  //READ

  Future<List<OperationFile>> getOperation() async {
    Database db = await database;
    final List<Map<String, dynamic>> operationMapList =
        await db.query(operationTable);
    final List<OperationFile> operationList = [];
    for (var operationMap in operationMapList) {
      operationList.add(OperationFile.fromMap(operationMap));
    }
    return operationList;
  }

  // INSERT

  Future<OperationFile> insertOperation(OperationFile operationFile) async {
    Database db = await database;
    operationFile.id = await db.insert(operationTable, operationFile.toMap());
    return operationFile;
  }

  //UPDATE

  Future<int> updateOperation(OperationFile operationFile) async {
    Database db = await database;
    return await db.update(
      operationTable,
      operationFile.toMap(),
      where: '$columnId = ?',
      whereArgs: [operationFile.id],
    );
  }

//DELETE
  Future<int> deleteOperation(int id) async {
    Database db = await database;
    return await db.delete(
      operationTable,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
