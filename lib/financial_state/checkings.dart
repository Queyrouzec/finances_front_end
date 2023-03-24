import 'package:uuid/uuid.dart';

class Checkings {}

class CheckingsStore {
  final UuidValue id;
  String name;
  final DateTime created;
  List<SnapShot> history = [];
  CheckingsStore({
    required this.id,
    required this.name,
  }) : created = DateTime.now();
}

class SnapShot {
  final double amount;
  final DateTime updated;
  SnapShot(this.amount) : updated = DateTime.now();
}
