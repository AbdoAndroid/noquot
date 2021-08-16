class Payment {
  int id;
  int userID;
  int amount;
  int prevAmount;
  String occasion;
  DateTime day;
  String notes;

  Payment(
      {required this.id,
      required this.userID,
      required this.amount,
      this.prevAmount = 0,
      required this.occasion,
      required this.day,
      this.notes = ' '});

  /// Convert object into a Map. The keys must correspond to the names of the
  /// columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userID': userID,
      'amount': amount,
      'prevAmount': prevAmount,
      'occasion': occasion,
      'day': day,
      'notes': notes,
    };
  }

  @override
  String toString() {
    return 'Payment{id: $id, userID: $userID, amount: $amount, prevAmount: $prevAmount, occasion: $occasion, day: $day, notes: $notes}';
  }
}
