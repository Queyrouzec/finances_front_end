import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'pay_period.g.dart';

sealed class CashFlowPeriod = _CashFlowPeriod with _$CashFlowPeriod;

abstract class _CashFlowPeriod with Store {}

// TODO(queyrozuec): change with dart 3.0
enum Weekday {
  sun,
  mon,
  tues,
  wed,
  thurs,
  fri,
  sat,
}

// TODO(queyrozuec): change with dart 3.0
Weekday getWeekday(DateTime dateTime) {
  switch (dateTime.weekday) {
    case 1:
      return Weekday.mon;
    case 2:
      return Weekday.tues;
    case 3:
      return Weekday.wed;
    case 4:
      return Weekday.thurs;
    case 5:
      return Weekday.fri;
    case 6:
      return Weekday.sat;
    case 7:
      return Weekday.sun;
    default:
      throw ArgumentError("How'd you get here?");
  }
}

// TODO(queyrozuec): change with dart 3.0
int getDatetimeWeekday(Weekday weekday) {
  switch (weekday) {
    case Weekday.mon:
      return 1;

    case Weekday.tues:
      return 2;

    case Weekday.wed:
      return 3;

    case Weekday.thurs:
      return 4;

    case Weekday.fri:
      return 5;

    case Weekday.sat:
      return 6;

    case Weekday.sun:
      return 7;

    default:
      throw ArgumentError("How'd you get here?");
  }
}

int gDatetimeWeekday(Weekday weekday) => switch (weekday) {
      Weekday.mon => 1,
      Weekday.tues => 2,
      Weekday.wed => 3,
      Weekday.thurs => 4,
      Weekday.fri => 5,
      Weekday.sat => 6,
      Weekday.sun => 7,
    };

class WeeklyCashFlowPeriod = _WeeklyCashFlowPeriod with _$WeeklyCashFlowPeriod;

abstract class _WeeklyCashFlowPeriod extends CashFlowPeriod with Store {
  @observable
  Weekday weekday;
  @observable
  TimeOfDay? timeOfDay;
  @observable
  int weeksPerFlow;

  _WeeklyCashFlowPeriod({
    required this.weekday,
    required this.weeksPerFlow,
    this.timeOfDay,
  });

  double flowTo7Days(double payAmount) => payAmount / (weeksPerFlow * 7);

  double flowTo1Day(double payAmount) => payAmount / (weeksPerFlow * 7);

  DateTime _nextWeekday({
    required DateTime fromDate,
    required int weeksPerFlow,
  }) {
    int weekday = getDatetimeWeekday(this.weekday);
    int dayDifference = fromDate.weekday - weekday;
    if (dayDifference == 0) {
      DateTime todaysPeriod = DateTime(
        fromDate.year,
        fromDate.month,
        fromDate.day,
        timeOfDay?.hour ?? 0,
        timeOfDay?.minute ?? 0,
      );
      return fromDate.isAfter(todaysPeriod)
          ? todaysPeriod.add(Duration(days: 7 * weeksPerFlow))
          : todaysPeriod;
    }
    return DateTime(
      fromDate.year,
      fromDate.month,
      fromDate.day + (dayDifference > 0 ? dayDifference : 7 - dayDifference),
      timeOfDay?.hour ?? 0,
      timeOfDay?.minute ?? 0,
    );
  }

  DateTime _prevWeekday({
    required DateTime fromDate,
    required int weeksPerFlow,
  }) {
    int weekday = getDatetimeWeekday(this.weekday);
    int dayDifference = fromDate.weekday - weekday;
    if (dayDifference == 0) {
      DateTime todaysPeriod = DateTime(
        fromDate.year,
        fromDate.month,
        fromDate.day,
        timeOfDay?.hour ?? 0,
        timeOfDay?.minute ?? 0,
      );
      return fromDate.isBefore(todaysPeriod)
          ? todaysPeriod.subtract(Duration(days: 7 * weeksPerFlow))
          : todaysPeriod;
    }

    return DateTime(
      fromDate.year,
      fromDate.month,
      fromDate.day + (dayDifference > 0 ? dayDifference : 7 - dayDifference),
      timeOfDay?.hour ?? 0,
      timeOfDay?.minute ?? 0,
    );
  }

  /// null `timeOfDay` is treated as 00:00
  DateTime nextWeekday([DateTime? fromDate]) =>
      _nextWeekday(fromDate: fromDate ?? DateTime.now(), weeksPerFlow: 1);

  /// null `timeOfDay` is treated as 00:00
  DateTime prevWeekday([DateTime? fromDate]) =>
      _prevWeekday(fromDate: fromDate ?? DateTime.now(), weeksPerFlow: 1);

  // @override
  DateTime nextFlowPeriod(DateTime prevFlowDate) =>
      _nextWeekday(fromDate: prevFlowDate, weeksPerFlow: weeksPerFlow);

  // @override
  DateTime prevFlowPeriod(DateTime nextFlowDate) =>
      _prevWeekday(fromDate: nextFlowDate, weeksPerFlow: weeksPerFlow);
}

class MonthlyCashFlowPeriod = _MonthlyCashFlowPeriod
    with _$MonthlyCashFlowPeriod;

abstract class _MonthlyCashFlowPeriod extends CashFlowPeriod with Store {
  @observable
  int day;
  @observable
  TimeOfDay? timeOfDay;
  @observable
  int monthsPerFlow;

  _MonthlyCashFlowPeriod({
    required this.day,
    this.timeOfDay,
    required this.monthsPerFlow,
  }) {
    if (day > 31) {
      throw ArgumentError("cannot have a day greater than 31");
    }
  }

  /// if the day is greater than the biggest day in the month it gives the biggest day in the month
  int getDay(int year, int month) {
    if (day <= 28) return day;
    switch (month) {
      case 1:
        return day;
      case 2:
        int maxDay = year % 4 == 0 ? 29 : 28;
        return day > maxDay ? maxDay : day;
      case 3:
        return day;
      case 4:
        return day > 30 ? 30 : day;
      case 5:
        return day;
      case 6:
        return day > 30 ? 30 : day;
      case 7:
        return day;
      case 8:
        return day;
      case 9:
        return day > 30 ? 30 : day;
      case 10:
        return day;
      case 11:
        return day > 30 ? 30 : day;
      case 12:
        return day;
      default:
        throw ArgumentError("that month is not in the valid range");
    }
  }

  // DateTime _nextMonthDay({
  //   required DateTime fromDate,
  //   required int monthsPerFlow,
  // }) {
  //   if (fromDate.day == day) {
  //     DateTime todaysPeriod = DateTime(
  //       fromDate.year,
  //       fromDate.month,
  //       day,
  //       timeOfDay?.hour ?? 0,
  //       timeOfDay?.minute ?? 0,
  //     );
  //     return fromDate.isAfter(todaysPeriod)
  //         ? DateTime(
  //             fromDate.year,
  //             fromDate.month + monthsPerFlow,
  //             day,
  //             timeOfDay?.hour ?? 0,
  //             timeOfDay?.minute ?? 0,
  //           )
  //         : todaysPeriod;
  //   }
  //   return DateTime(
  //     fromDate.year,
  //     fromDate.month + monthsPerFlow,
  //     day,
  //     timeOfDay?.hour ?? 0,
  //     timeOfDay?.minute ?? 0,
  //   );
  // }

  // DateTime _prevMonthDay({
  //   required DateTime fromDate,
  //   required int monthsPerFlow,
  // }) {
  //   if (fromDate.day == day) {
  //     DateTime todaysPeriod = DateTime(
  //       fromDate.year,
  //       fromDate.month,
  //       day,
  //       timeOfDay?.hour ?? 0,
  //       timeOfDay?.minute ?? 0,
  //     );
  //     return fromDate.isBefore(todaysPeriod)
  //         ? DateTime(
  //             fromDate.year,
  //             fromDate.month - monthsPerFlow,
  //             day,
  //             timeOfDay?.hour ?? 0,
  //             timeOfDay?.minute ?? 0,
  //           )
  //         : todaysPeriod;
  //   }
  //   return DateTime(
  //     fromDate.year,
  //     fromDate.month - monthsPerFlow,
  //     day,
  //     timeOfDay?.hour ?? 0,
  //     timeOfDay?.minute ?? 0,
  //   );
  // }
}

class YearlyCashFlowPeriod = _YearlyCashFlowPeriod with _$YearlyCashFlowPeriod;

abstract class _YearlyCashFlowPeriod extends CashFlowPeriod with Store {
  @observable
  int month;
  @observable
  int day;
  @observable
  TimeOfDay? timeOfDay;
  @observable
  int yearsPerFlow;

  _YearlyCashFlowPeriod({
    required this.month,
    required this.day,
    this.timeOfDay,
    required this.yearsPerFlow,
  }) {
    _checkDay();
  }

  void _checkDay() {
    if (day <= 28) return;
    void throwDay(int max) {
      if (day > max) {
        // TODO(queyrouzec): change month to a word
        throw ArgumentError(
            "the day $day is higher than the amount of days in $month}");
      }
    }

    switch (month) {
      case 1:
        throwDay(31);
        break;
      case 2:
        throwDay(28);
        break;
      case 3:
        throwDay(31);
        break;
      case 4:
        throwDay(30);
        break;
      case 5:
        throwDay(31);
        break;
      case 6:
        throwDay(30);
        break;
      case 7:
        throwDay(31);
        break;
      case 8:
        throwDay(31);
        break;
      case 9:
        throwDay(30);
        break;
      case 10:
        throwDay(31);
        break;
      case 11:
        throwDay(30);
        break;
      case 12:
        throwDay(31);
        break;
      default:
        throw ArgumentError("that month is not in the valid range");
    }
  }
}

class DailyCashFlowPeriod = _DailyCashFlowPeriod with _$DailyCashFlowPeriod;

abstract class _DailyCashFlowPeriod extends CashFlowPeriod with Store {
  @observable
  int daysPerFlow;
  @observable
  TimeOfDay? timeOfDay;

  _DailyCashFlowPeriod({required this.daysPerFlow});
}

class TimeBasedCashFlowPeriod = _TimeBasedCashFlowPeriod
    with _$TimeBasedCashFlowPeriod;

abstract class _TimeBasedCashFlowPeriod extends CashFlowPeriod with Store {
  int seconds;

  _TimeBasedCashFlowPeriod({required this.seconds});
}
