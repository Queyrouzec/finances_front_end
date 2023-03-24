import 'package:flutter/material.dart';

abstract class CashFlowPeriod {
  double flowTo365Days(double payAmount) => flowTo1Day(payAmount) * 365;
  double flowTo30Days(double payAmount) => flowTo1Day(payAmount) * 30;
  double flowTo7Days(double payAmount) => flowTo1Day(payAmount) * 7;
  double flowTo1Day(double payAmount);

  /// null `timeOfDay` is treated as 00:00
  DateTime nextFlowPeriod(DateTime prevFlowDate);
  DateTime prevFlowPeriod(DateTime nextFlowDate);
}

enum Weekday {
  sun,
  mon,
  tues,
  wed,
  thurs,
  fri,
  sat,
}

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

class WeekdayCashFlowPeriod extends CashFlowPeriod {
  Weekday weekday;
  TimeOfDay? timeOfDay;
  int weeksPerFlow;

  WeekdayCashFlowPeriod({
    required this.weekday,
    required this.weeksPerFlow,
    this.timeOfDay,
  });

  @override
  double flowTo7Days(double payAmount) => payAmount / (weeksPerFlow * 7);

  @override
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

  @override
  DateTime nextFlowPeriod(DateTime prevFlowDate) =>
      _nextWeekday(fromDate: prevFlowDate, weeksPerFlow: weeksPerFlow);

  @override
  DateTime prevFlowPeriod(DateTime nextFlowDate) =>
      _prevWeekday(fromDate: nextFlowDate, weeksPerFlow: weeksPerFlow);
}
