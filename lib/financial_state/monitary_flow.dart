import 'package:finances_front_end/financial_state/pay_period.dart';

abstract class Flow {
  double amount;
  CashFlowPeriod cashFlowPeriod;
  List<Payment> payments = [];
  DateTime? start;
  DateTime? end;

  Flow({
    required this.amount,
    required this.cashFlowPeriod,
    this.start,
    this.end,
  });
}

class Inflow extends Flow {
  Inflow({
    required super.amount,
    required super.cashFlowPeriod,
    super.start,
    super.end,
  });
}

class OutFlow extends Flow {
  OutFlow({
    required super.amount,
    required super.cashFlowPeriod,
    super.start,
    super.end,
  });
}

class Payment {
  double amount;
  final DateTime created;
  late DateTime updated;

  Payment(this.amount) : created = DateTime.now() {
    updated = created;
  }
}
