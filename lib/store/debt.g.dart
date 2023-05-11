// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DebtState on _DebtState, Store {
  late final _$nameAtom = Atom(name: '_DebtState.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name}
    ''';
  }
}

mixin _$CreditCardDebt on _CreditCardDebt, Store {
  late final _$amountAtom =
      Atom(name: '_CreditCardDebt.amount', context: context);

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

  late final _$cashFlowPeriodAtom =
      Atom(name: '_CreditCardDebt.cashFlowPeriod', context: context);

  @override
  CashFlowPeriod get cashFlowPeriod {
    _$cashFlowPeriodAtom.reportRead();
    return super.cashFlowPeriod;
  }

  @override
  set cashFlowPeriod(CashFlowPeriod value) {
    _$cashFlowPeriodAtom.reportWrite(value, super.cashFlowPeriod, () {
      super.cashFlowPeriod = value;
    });
  }

  late final _$spendingAtom =
      Atom(name: '_CreditCardDebt.spending', context: context);

  @override
  ObservableList<DebtSnapShot> get spending {
    _$spendingAtom.reportRead();
    return super.spending;
  }

  @override
  set spending(ObservableList<DebtSnapShot> value) {
    _$spendingAtom.reportWrite(value, super.spending, () {
      super.spending = value;
    });
  }

  late final _$paymentAtom =
      Atom(name: '_CreditCardDebt.payment', context: context);

  @override
  ObservableList<DebtPayments> get payment {
    _$paymentAtom.reportRead();
    return super.payment;
  }

  @override
  set payment(ObservableList<DebtPayments> value) {
    _$paymentAtom.reportWrite(value, super.payment, () {
      super.payment = value;
    });
  }

  @override
  String toString() {
    return '''
amount: ${amount},
cashFlowPeriod: ${cashFlowPeriod},
spending: ${spending},
payment: ${payment}
    ''';
  }
}

mixin _$DebtSnapShot on _DebtSnapShot, Store {
  late final _$amountAtom =
      Atom(name: '_DebtSnapShot.amount', context: context);

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

  late final _$createdAtom =
      Atom(name: '_DebtSnapShot.created', context: context);

  @override
  DateTime get created {
    _$createdAtom.reportRead();
    return super.created;
  }

  @override
  set created(DateTime value) {
    _$createdAtom.reportWrite(value, super.created, () {
      super.created = value;
    });
  }

  @override
  String toString() {
    return '''
amount: ${amount},
created: ${created}
    ''';
  }
}

mixin _$DebtPayments on _DebtPayments, Store {
  late final _$amountAtom =
      Atom(name: '_DebtPayments.amount', context: context);

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

  late final _$timePayedAtom =
      Atom(name: '_DebtPayments.timePayed', context: context);

  @override
  DateTime get timePayed {
    _$timePayedAtom.reportRead();
    return super.timePayed;
  }

  @override
  set timePayed(DateTime value) {
    _$timePayedAtom.reportWrite(value, super.timePayed, () {
      super.timePayed = value;
    });
  }

  @override
  String toString() {
    return '''
amount: ${amount},
timePayed: ${timePayed}
    ''';
  }
}
