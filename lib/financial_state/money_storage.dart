import 'package:uuid/uuid.dart';

abstract class Storage {
  final UuidValue id;
  String name;
  final DateTime dataCreated;
  List<SnapShot> history = [];
  Storage({
    required this.id,
    required this.name,
  }) : dataCreated = DateTime.now();
}

class Checkings extends Storage {
  Checkings({required super.id, required super.name});
}

class Savings extends Storage {
  Savings({required super.id, required super.name});
}

class SnapShot {
  final double amount;
  final DateTime updated;
  SnapShot(this.amount) : updated = DateTime.now();
}
