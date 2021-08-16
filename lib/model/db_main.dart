import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MainDBSettings {
  static final DB_MAIN = _InitDB();
  static const DB_NAME = 'noquot_database.db';
  static const TABLE_USER = 'users';
  static const TABLE_PAYMENT = 'user';
  static _InitDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), DB_NAME),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        db.execute(
          'CREATE TABLE $TABLE_USER(id INTEGER PRIMARY KEY IDENTITY(1,1), name TEXT, address TEXT)',
        );
        db.execute(
          'CREATE TABLE $TABLE_PAYMENT(id INTEGER PRIMARY KEY IDENTITY(1,1),userID int, amount INTEGER,'
          'prevAmount INTEGER,occasion TEXT, day DATE,notes TEXT, FOREIGN KEY(userID) REFERENCES $TABLE_USER(id))',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
}
