import 'package:finances_front_end/financial_state/pay_period.dart';
import 'package:mobx/mobx.dart';

part 'monitary_flow.g.dart';

abstract class Flow = _Flow with _$Flow;

abstract class _Flow with Store {
  @observable
  double amountPerExpectedPeriod;
  @observable
  CashFlowPeriod cashFlowPeriod;
  @observable
  ObservableList<Payment> payments = ObservableList();
  @observable
  DateTime? start;
  @observable
  DateTime? end;

  _Flow({
    required this.amountPerExpectedPeriod,
    required this.cashFlowPeriod,
    this.start,
    this.end,
  });
}

abstract class Inflow extends Flow with Store {
  Inflow({
    required super.amountPerExpectedPeriod,
    required super.cashFlowPeriod,
    super.start,
    super.end,
  });
}

class OutFlow extends Flow {
  OutFlow({
    required super.amountPerExpectedPeriod,
    required super.cashFlowPeriod,
    super.start,
    super.end,
  });
}

class Payment = _Payment with _$Payment;

abstract class _Payment with Store {
  @observable
  double amount;
  final DateTime created;
  @observable
  late DateTime updated;

  _Payment(this.amount) : created = DateTime.now() {
    updated = created;
  }
}

class HourlyWage = _HourlyWage with _$HourlyWage;

abstract class _HourlyWage extends Inflow with Store {
  @observable
  double hourlyPay;
  @observable
  int expectedShifts;
  @observable
  int expectedHoursPerShift;
  @observable
  int expectedMinutesPerShift;

  @observable
  ObservableList<WeeklyLimits> weeklyLimits = ObservableList();

  _HourlyWage({
    required super.cashFlowPeriod,
    super.start,
    super.end,
    required this.expectedShifts,
    required this.hourlyPay,
    required this.expectedHoursPerShift,
    this.expectedMinutesPerShift = 0,
  }) : super(amountPerExpectedPeriod: 0);

  @override
  double get amountPerExpectedPeriod =>
      hourlyPay * expectedHoursPerShift * (expectedMinutesPerShift / 60);
}

enum Increase { flat, percentage }

class WeeklyLimits = _WeeklyLimits with _$WeeklyLimits;

abstract class _WeeklyLimits with Store {
  @observable
  int hours;
  @observable
  int minutes;
  @observable
  int payIncrease;
  @observable
  Increase increaseType;

  _WeeklyLimits({
    required this.hours,
    this.minutes = 0,
    required this.increaseType,
    required this.payIncrease,
  });
}
