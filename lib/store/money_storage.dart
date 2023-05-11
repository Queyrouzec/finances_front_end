import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'money_storage.g.dart';

class Storage = _Storage with _$Storage;

abstract class _Storage with Store {
  final UuidValue id;
  String name;
  final DateTime dataCreated;
  List<SnapShot> history = [];
  _Storage({
    required this.id,
    required this.name,
  }) : dataCreated = DateTime.now();
}

class Checkings = _Checkings with _$Checkings;

abstract class _Checkings extends Storage with Store {
  _Checkings({required super.id, required super.name});
}

class Savings = _Savings with _$Savings;

abstract class _Savings extends Storage with Store {
  _Savings({required super.id, required super.name});
}

class SnapShot = _SnapShot with _$SnapShot;

abstract class _SnapShot with Store {
  final double amount;
  final DateTime updated;
  _SnapShot(this.amount) : updated = DateTime.now();
}
