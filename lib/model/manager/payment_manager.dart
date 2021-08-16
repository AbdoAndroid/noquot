import 'package:noquot/model/db_main.dart';
import 'package:noquot/model/entity/payment.dart';
import 'package:sqflite/sqflite.dart';

Future<void> insertPayment(Payment payment) async {
  // Get a reference to the database.
  final db = await MainDBSettings.DB_MAIN;
  // Insert the User into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same user is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    MainDBSettings.TABLE_PAYMENT,
    payment.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Payment>> payments() async {
  // Get a reference to the database.
  final db = await MainDBSettings.DB_MAIN;
  // Query the table for all The Users.
  final List<Map<String, dynamic>> maps =
      await db.query(MainDBSettings.TABLE_PAYMENT, where: 'amount<0');
  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return _paymentFrom(maps[i]);
  });
}

Future<List<Payment>> paymentsForUs() async {
  // Get a reference to the database.
  final db = await MainDBSettings.DB_MAIN;
  // Query the table for all The Users.
  final List<Map<String, dynamic>> maps =
      await db.query(MainDBSettings.TABLE_PAYMENT, where: 'amount>0');
  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return _paymentFrom(maps[i]);
  });
}

Future<List<Payment>> prevPayments() async {
  // Get a reference to the database.
  final db = await MainDBSettings.DB_MAIN;
  // Query the table for all The Users.
  final List<Map<String, dynamic>> maps = await db
      .query(MainDBSettings.TABLE_PAYMENT, where: 'amount=0 and prevAmount<0');
  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return _paymentFrom(maps[i]);
  });
}

Future<List<Payment>> prevPaymentsForUs() async {
  // Get a reference to the database.
  final db = await MainDBSettings.DB_MAIN;
  // Query the table for all The Users.
  final List<Map<String, dynamic>> maps = await db
      .query(MainDBSettings.TABLE_PAYMENT, where: 'amount=0 and prevAmount>0');
  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return _paymentFrom(maps[i]);
  });
}

Future<Payment> getPayment(int id) async {
  // Get a reference to the database.
  final Database db = await MainDBSettings.DB_MAIN;
  final List<Map<String, dynamic>> maps = await db.query(
    MainDBSettings.TABLE_PAYMENT,
    where: 'id = ?',
    // Pass the User's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
  return _paymentFrom(maps[0]);
}

Payment _paymentFrom(Map map) {
  return Payment(
      id: map['id'],
      amount: map['amount'],
      prevAmount: map['prevAmount'],
      day: map['day'],
      notes: map['notes'],
      occasion: map['occasion'],
      userID: map['userID']);
}

Future<void> updatePayment(Payment payment) async {
  // Get a reference to the database.
  final db = await MainDBSettings.DB_MAIN;

  // Update the given user.
  await db.update(
    MainDBSettings.TABLE_PAYMENT,
    payment.toMap(),
    // Ensure that the user has a matching id.
    where: 'id = ?',
    // Pass the user's id as a whereArg to prevent SQL injection.
    whereArgs: [payment.id],
  );
}

Future<void> deletePayment(int id) async {
  // Get a reference to the database.
  final db = await MainDBSettings.DB_MAIN;

  // Remove the user from the database.
  await db.delete(
    MainDBSettings.TABLE_PAYMENT,
    // Use a `where` clause to delete a specific user.
    where: 'id = ?',
    // Pass the User's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}
