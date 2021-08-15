class User {
  int id;
  String name, address;

  User({required this.id, required this.name, required this.address});

  /// Convert a User into a Map. The keys must correspond to the names of the
  /// columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
    };
  }

  /// Implement toString to make it easier to see information about
  /// each user when using the print statement.
  @override
  String toString() {
    return 'User{id: $id, name: $name, address: $address}';
  }
}
