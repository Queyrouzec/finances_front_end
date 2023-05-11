import 'package:mobx/mobx.dart';

part 'finances_database.g.dart';

class FinancesDatabase = _FinancesDatabase with _$FinancesDatabase;

abstract class _FinancesDatabase with Store {}
