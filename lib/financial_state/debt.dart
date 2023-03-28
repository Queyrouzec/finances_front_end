import 'package:finances_front_end/financial_state/pay_period.dart';

abstract class Debt {
  String name;

  Debt({required this.name});
}

class CreditCardDebt extends Debt {
  double amount;
  CashFlowPeriod cashFlowPeriod;
  List<DebtSnapShot> spenting = [];
  List<DebtPayments> payment = [];

  CreditCardDebt({
    required super.name,
    required this.amount,
    required this.cashFlowPeriod,
  });
}

class DebtSnapShot {
  final double amount;
  final DateTime created;
  DebtSnapShot(this.amount) : created = DateTime.now();
}

class DebtPayments {
  final double amount;
  final DateTime timePayed;
  DebtPayments({required this.amount, required this.timePayed});
}
