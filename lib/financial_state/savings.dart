import 'package:uuid/uuid.dart';

class Savings {}

class SavingsStore {
  final UuidValue id;
  String name;
  final DateTime created;
  List<SnapShot> history = [];
  SavingsStore({
    required this.id,
    required this.name,
  }) : created = DateTime.now();
}

class SnapShot {
  final double amount;
  final DateTime updated;
  SnapShot(this.amount) : updated = DateTime.now();
}
