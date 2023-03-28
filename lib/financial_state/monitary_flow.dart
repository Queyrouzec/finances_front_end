import 'package:finances_front_end/financial_state/pay_period.dart';

abstract class Flow {
  double amountPerExpectedPeriod;
  CashFlowPeriod cashFlowPeriod;
  List<Payment> payments = [];
  DateTime? start;
  DateTime? end;

  Flow({
    required this.amountPerExpectedPeriod,
    required this.cashFlowPeriod,
    this.start,
    this.end,
  });
}

class Inflow extends Flow {
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

class Payment {
  double amount;
  final DateTime created;
  late DateTime updated;

  Payment(this.amount) : created = DateTime.now() {
    updated = created;
  }
}

class HourlyWage extends Inflow {
  double hourlyPay;
  int expectedShifts;
  int expectedHoursPerShift;
  int expectedMinutesPerShift;

  List<WeeklyLimits> weeklyLimits = [];

  HourlyWage({
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

class WeeklyLimits {
  int hours;
  int minutes;
  int payIncrease;
  Increase increaseType;

  WeeklyLimits({
    required this.hours,
    this.minutes = 0,
    required this.increaseType,
    required this.payIncrease,
  });
}
