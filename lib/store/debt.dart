import 'package:finances_front_end/store/pay_period.dart';
import 'package:mobx/mobx.dart';

part 'debt.g.dart';

abstract class DebtState = _DebtState with _$DebtState;

abstract class _DebtState with Store {
  @observable
  String name;

  _DebtState({required this.name});
}

class CreditCardDebt = _CreditCardDebt with _$CreditCardDebt;

abstract class _CreditCardDebt extends DebtState with Store {
  @observable
  double amount;
  @observable
  CashFlowPeriod cashFlowPeriod;
  @observable
  ObservableList<DebtSnapShot> spending = ObservableList();
  @observable
  ObservableList<DebtPayments> payment = ObservableList();

  _CreditCardDebt({
    required super.name,
    required this.amount,
    required this.cashFlowPeriod,
  });
}

class DebtSnapShot = _DebtSnapShot with _$DebtSnapShot;

abstract class _DebtSnapShot with Store {
  @observable
  double amount;
  @observable
  DateTime created;
  _DebtSnapShot(this.amount) : created = DateTime.now();
}

class DebtPayments = _DebtPayments with _$DebtPayments;

abstract class _DebtPayments with Store {
  @observable
  double amount;
  @observable
  DateTime timePayed;
  _DebtPayments({required this.amount, required this.timePayed});
}
