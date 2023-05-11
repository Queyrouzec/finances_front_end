// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitary_flow.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Flow on _Flow, Store {
  late final _$amountPerExpectedPeriodAtom =
      Atom(name: '_Flow.amountPerExpectedPeriod', context: context);

  @override
  double get amountPerExpectedPeriod {
    _$amountPerExpectedPeriodAtom.reportRead();
    return super.amountPerExpectedPeriod;
  }

  @override
  set amountPerExpectedPeriod(double value) {
    _$amountPerExpectedPeriodAtom
        .reportWrite(value, super.amountPerExpectedPeriod, () {
      super.amountPerExpectedPeriod = value;
    });
  }

  late final _$cashFlowPeriodAtom =
      Atom(name: '_Flow.cashFlowPeriod', context: context);

  @override
  dynamic get cashFlowPeriod {
    _$cashFlowPeriodAtom.reportRead();
    return super.cashFlowPeriod;
  }

  @override
  set cashFlowPeriod(dynamic value) {
    _$cashFlowPeriodAtom.reportWrite(value, super.cashFlowPeriod, () {
      super.cashFlowPeriod = value;
    });
  }

  late final _$paymentsAtom = Atom(name: '_Flow.payments', context: context);

  @override
  ObservableList<Payment> get payments {
    _$paymentsAtom.reportRead();
    return super.payments;
  }

  @override
  set payments(ObservableList<Payment> value) {
    _$paymentsAtom.reportWrite(value, super.payments, () {
      super.payments = value;
    });
  }

  late final _$startAtom = Atom(name: '_Flow.start', context: context);

  @override
  DateTime? get start {
    _$startAtom.reportRead();
    return super.start;
  }

  @override
  set start(DateTime? value) {
    _$startAtom.reportWrite(value, super.start, () {
      super.start = value;
    });
  }

  late final _$endAtom = Atom(name: '_Flow.end', context: context);

  @override
  DateTime? get end {
    _$endAtom.reportRead();
    return super.end;
  }

  @override
  set end(DateTime? value) {
    _$endAtom.reportWrite(value, super.end, () {
      super.end = value;
    });
  }

  @override
  String toString() {
    return '''
amountPerExpectedPeriod: ${amountPerExpectedPeriod},
cashFlowPeriod: ${cashFlowPeriod},
payments: ${payments},
start: ${start},
end: ${end}
    ''';
  }
}

mixin _$HourlyWage on Inflow, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}

mixin _$Payment on _Payment, Store {
  late final _$amountAtom = Atom(name: '_Payment.amount', context: context);

  @override
  double get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(double value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$updatedAtom = Atom(name: '_Payment.updated', context: context);

  @override
  DateTime get updated {
    _$updatedAtom.reportRead();
    return super.updated;
  }

  @override
  set updated(DateTime value) {
    _$updatedAtom.reportWrite(value, super.updated, () {
      super.updated = value;
    });
  }

  @override
  String toString() {
    return '''
amount: ${amount},
updated: ${updated}
    ''';
  }
}

mixin _$HourlyWage on _HourlyWage, Store {
  late final _$hourlyPayAtom =
      Atom(name: '_HourlyWage.hourlyPay', context: context);

  @override
  double get hourlyPay {
    _$hourlyPayAtom.reportRead();
    return super.hourlyPay;
  }

  @override
  set hourlyPay(double value) {
    _$hourlyPayAtom.reportWrite(value, super.hourlyPay, () {
      super.hourlyPay = value;
    });
  }

  late final _$expectedShiftsAtom =
      Atom(name: '_HourlyWage.expectedShifts', context: context);

  @override
  int get expectedShifts {
    _$expectedShiftsAtom.reportRead();
    return super.expectedShifts;
  }

  @override
  set expectedShifts(int value) {
    _$expectedShiftsAtom.reportWrite(value, super.expectedShifts, () {
      super.expectedShifts = value;
    });
  }

  late final _$expectedHoursPerShiftAtom =
      Atom(name: '_HourlyWage.expectedHoursPerShift', context: context);

  @override
  int get expectedHoursPerShift {
    _$expectedHoursPerShiftAtom.reportRead();
    return super.expectedHoursPerShift;
  }

  @override
  set expectedHoursPerShift(int value) {
    _$expectedHoursPerShiftAtom.reportWrite(value, super.expectedHoursPerShift,
        () {
      super.expectedHoursPerShift = value;
    });
  }

  late final _$expectedMinutesPerShiftAtom =
      Atom(name: '_HourlyWage.expectedMinutesPerShift', context: context);

  @override
  int get expectedMinutesPerShift {
    _$expectedMinutesPerShiftAtom.reportRead();
    return super.expectedMinutesPerShift;
  }

  @override
  set expectedMinutesPerShift(int value) {
    _$expectedMinutesPerShiftAtom
        .reportWrite(value, super.expectedMinutesPerShift, () {
      super.expectedMinutesPerShift = value;
    });
  }

  late final _$weeklyLimitsAtom =
      Atom(name: '_HourlyWage.weeklyLimits', context: context);

  @override
  ObservableList<WeeklyLimits> get weeklyLimits {
    _$weeklyLimitsAtom.reportRead();
    return super.weeklyLimits;
  }

  @override
  set weeklyLimits(ObservableList<WeeklyLimits> value) {
    _$weeklyLimitsAtom.reportWrite(value, super.weeklyLimits, () {
      super.weeklyLimits = value;
    });
  }

  @override
  String toString() {
    return '''
hourlyPay: ${hourlyPay},
expectedShifts: ${expectedShifts},
expectedHoursPerShift: ${expectedHoursPerShift},
expectedMinutesPerShift: ${expectedMinutesPerShift},
weeklyLimits: ${weeklyLimits}
    ''';
  }
}

mixin _$WeeklyLimits on _WeeklyLimits, Store {
  late final _$hoursAtom = Atom(name: '_WeeklyLimits.hours', context: context);

  @override
  int get hours {
    _$hoursAtom.reportRead();
    return super.hours;
  }

  @override
  set hours(int value) {
    _$hoursAtom.reportWrite(value, super.hours, () {
      super.hours = value;
    });
  }

  late final _$minutesAtom =
      Atom(name: '_WeeklyLimits.minutes', context: context);

  @override
  int get minutes {
    _$minutesAtom.reportRead();
    return super.minutes;
  }

  @override
  set minutes(int value) {
    _$minutesAtom.reportWrite(value, super.minutes, () {
      super.minutes = value;
    });
  }

  late final _$payIncreaseAtom =
      Atom(name: '_WeeklyLimits.payIncrease', context: context);

  @override
  int get payIncrease {
    _$payIncreaseAtom.reportRead();
    return super.payIncrease;
  }

  @override
  set payIncrease(int value) {
    _$payIncreaseAtom.reportWrite(value, super.payIncrease, () {
      super.payIncrease = value;
    });
  }

  late final _$increaseTypeAtom =
      Atom(name: '_WeeklyLimits.increaseType', context: context);

  @override
  Increase get increaseType {
    _$increaseTypeAtom.reportRead();
    return super.increaseType;
  }

  @override
  set increaseType(Increase value) {
    _$increaseTypeAtom.reportWrite(value, super.increaseType, () {
      super.increaseType = value;
    });
  }

  @override
  String toString() {
    return '''
hours: ${hours},
minutes: ${minutes},
payIncrease: ${payIncrease},
increaseType: ${increaseType}
    ''';
  }
}
