// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_period.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CashFlowPeriod on _CashFlowPeriod, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}

mixin _$WeeklyCashFlowPeriod on _WeeklyCashFlowPeriod, Store {
  late final _$weekdayAtom =
      Atom(name: '_WeeklyCashFlowPeriod.weekday', context: context);

  @override
  Weekday get weekday {
    _$weekdayAtom.reportRead();
    return super.weekday;
  }

  @override
  set weekday(Weekday value) {
    _$weekdayAtom.reportWrite(value, super.weekday, () {
      super.weekday = value;
    });
  }

  late final _$timeOfDayAtom =
      Atom(name: '_WeeklyCashFlowPeriod.timeOfDay', context: context);

  @override
  TimeOfDay? get timeOfDay {
    _$timeOfDayAtom.reportRead();
    return super.timeOfDay;
  }

  @override
  set timeOfDay(TimeOfDay? value) {
    _$timeOfDayAtom.reportWrite(value, super.timeOfDay, () {
      super.timeOfDay = value;
    });
  }

  late final _$weeksPerFlowAtom =
      Atom(name: '_WeeklyCashFlowPeriod.weeksPerFlow', context: context);

  @override
  int get weeksPerFlow {
    _$weeksPerFlowAtom.reportRead();
    return super.weeksPerFlow;
  }

  @override
  set weeksPerFlow(int value) {
    _$weeksPerFlowAtom.reportWrite(value, super.weeksPerFlow, () {
      super.weeksPerFlow = value;
    });
  }

  @override
  String toString() {
    return '''
weekday: ${weekday},
timeOfDay: ${timeOfDay},
weeksPerFlow: ${weeksPerFlow}
    ''';
  }
}

mixin _$MonthlyCashFlowPeriod on _MonthlyCashFlowPeriod, Store {
  late final _$dayAtom =
      Atom(name: '_MonthlyCashFlowPeriod.day', context: context);

  @override
  int get day {
    _$dayAtom.reportRead();
    return super.day;
  }

  @override
  set day(int value) {
    _$dayAtom.reportWrite(value, super.day, () {
      super.day = value;
    });
  }

  late final _$timeOfDayAtom =
      Atom(name: '_MonthlyCashFlowPeriod.timeOfDay', context: context);

  @override
  TimeOfDay? get timeOfDay {
    _$timeOfDayAtom.reportRead();
    return super.timeOfDay;
  }

  @override
  set timeOfDay(TimeOfDay? value) {
    _$timeOfDayAtom.reportWrite(value, super.timeOfDay, () {
      super.timeOfDay = value;
    });
  }

  late final _$monthsPerFlowAtom =
      Atom(name: '_MonthlyCashFlowPeriod.monthsPerFlow', context: context);

  @override
  int get monthsPerFlow {
    _$monthsPerFlowAtom.reportRead();
    return super.monthsPerFlow;
  }

  @override
  set monthsPerFlow(int value) {
    _$monthsPerFlowAtom.reportWrite(value, super.monthsPerFlow, () {
      super.monthsPerFlow = value;
    });
  }

  @override
  String toString() {
    return '''
day: ${day},
timeOfDay: ${timeOfDay},
monthsPerFlow: ${monthsPerFlow}
    ''';
  }
}

mixin _$YearlyCashFlowPeriod on _YearlyCashFlowPeriod, Store {
  late final _$monthAtom =
      Atom(name: '_YearlyCashFlowPeriod.month', context: context);

  @override
  int get month {
    _$monthAtom.reportRead();
    return super.month;
  }

  @override
  set month(int value) {
    _$monthAtom.reportWrite(value, super.month, () {
      super.month = value;
    });
  }

  late final _$dayAtom =
      Atom(name: '_YearlyCashFlowPeriod.day', context: context);

  @override
  int get day {
    _$dayAtom.reportRead();
    return super.day;
  }

  @override
  set day(int value) {
    _$dayAtom.reportWrite(value, super.day, () {
      super.day = value;
    });
  }

  late final _$timeOfDayAtom =
      Atom(name: '_YearlyCashFlowPeriod.timeOfDay', context: context);

  @override
  TimeOfDay? get timeOfDay {
    _$timeOfDayAtom.reportRead();
    return super.timeOfDay;
  }

  @override
  set timeOfDay(TimeOfDay? value) {
    _$timeOfDayAtom.reportWrite(value, super.timeOfDay, () {
      super.timeOfDay = value;
    });
  }

  late final _$yearsPerFlowAtom =
      Atom(name: '_YearlyCashFlowPeriod.yearsPerFlow', context: context);

  @override
  int get yearsPerFlow {
    _$yearsPerFlowAtom.reportRead();
    return super.yearsPerFlow;
  }

  @override
  set yearsPerFlow(int value) {
    _$yearsPerFlowAtom.reportWrite(value, super.yearsPerFlow, () {
      super.yearsPerFlow = value;
    });
  }

  @override
  String toString() {
    return '''
month: ${month},
day: ${day},
timeOfDay: ${timeOfDay},
yearsPerFlow: ${yearsPerFlow}
    ''';
  }
}

mixin _$DailyCashFlowPeriod on _DailyCashFlowPeriod, Store {
  late final _$daysPerFlowAtom =
      Atom(name: '_DailyCashFlowPeriod.daysPerFlow', context: context);

  @override
  int get daysPerFlow {
    _$daysPerFlowAtom.reportRead();
    return super.daysPerFlow;
  }

  @override
  set daysPerFlow(int value) {
    _$daysPerFlowAtom.reportWrite(value, super.daysPerFlow, () {
      super.daysPerFlow = value;
    });
  }

  late final _$timeOfDayAtom =
      Atom(name: '_DailyCashFlowPeriod.timeOfDay', context: context);

  @override
  TimeOfDay? get timeOfDay {
    _$timeOfDayAtom.reportRead();
    return super.timeOfDay;
  }

  @override
  set timeOfDay(TimeOfDay? value) {
    _$timeOfDayAtom.reportWrite(value, super.timeOfDay, () {
      super.timeOfDay = value;
    });
  }

  @override
  String toString() {
    return '''
daysPerFlow: ${daysPerFlow},
timeOfDay: ${timeOfDay}
    ''';
  }
}

mixin _$TimeBasedCashFlowPeriod on _TimeBasedCashFlowPeriod, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}
