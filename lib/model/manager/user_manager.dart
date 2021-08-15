import 'package:noquot/model/db_main.dart';
import 'package:noquot/model/entity/user.dart';
import 'package:sqflite/sqflite.dart';

/// inserts a new user to the users set
Future<void> insertUser(User user) async {
  // Get a reference to the database.
  final db = await MainDBSettings.DB_MAIN;
  // Insert the User into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same user is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    MainDBSettings.TABLE_USER,
    user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// A method that retrieves all the users from the dogs table.
Future<List<User>> users() async {
  // Get a reference to the database.
  final db = await MainDBSettings.DB_MAIN;
  // Query the table for all The Users.
  final List<Map<String, dynamic>> maps =
      await db.query(MainDBSettings.TABLE_USER);
  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return User(
      id: maps[i]['id'],
      name: maps[i]['name'],
      address: maps[i]['address'],
    );
  });
}

Future<User> getUser(int id) async {
  // Get a reference to the database.
  final Database db = await MainDBSettings.DB_MAIN;
  final List<Map<String, dynamic>> maps = await db.query(
    MainDBSettings.TABLE_USER,
    where: 'id = ?',
    // Pass the User's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
  return User(
    id: maps[0]['id'],
    name: maps[0]['name'],
    address: maps[0]['address'],
  );
}

Future<void> updateUser(User user) async {
  // Get a reference to the database.
  final db = await MainDBSettings.DB_MAIN;

  // Update the given user.
  await db.update(
    MainDBSettings.TABLE_USER,
    user.toMap(),
    // Ensure that the user has a matching id.
    where: 'id = ?',
    // Pass the user's id as a whereArg to prevent SQL injection.
    whereArgs: [user.id],
  );
}

Future<void> deleteUser(int id) async {
  // Get a reference to the database.
  final db = await MainDBSettings.DB_MAIN;

  // Remove the user from the database.
  await db.delete(
    MainDBSettings.TABLE_USER,
    // Use a `where` clause to delete a specific user.
    where: 'id = ?',
    // Pass the User's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}
