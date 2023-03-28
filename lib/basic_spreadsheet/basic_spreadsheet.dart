import 'package:finances_front_end/financial_state/bloc_state.dart';
import 'package:finances_front_end/financial_state/debt.dart';
import 'package:finances_front_end/financial_state/pay_period.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpreadSheetPage extends StatelessWidget {
  const SpreadSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FinancesBloc(
        FinancesState([]),
      ),
      child: const DebtColumn(),
    );
  }
}

class DebtColumn extends StatelessWidget {
  const DebtColumn({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<FinancesBloc>();
    return SizedBox(
      width: 420,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[const Text('debt')] +
            context
                .read<FinancesBloc>()
                .state
                .debts
                .map((e) => DebtRow(debt: e))
                .toList() +
            [const AddDebtWidge()],
      ),
    );
  }
}

class AddDebtWidge extends StatefulWidget {
  const AddDebtWidge({super.key});

  @override
  State<AddDebtWidge> createState() => _AddDebtWidgetState();
}

class _AddDebtWidgetState extends State<AddDebtWidge> {
  String debtName = '';
  double debtValue = 0;

  final _debtNameController = TextEditingController();
  final _debtValueController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void makeDebt() {
      context.read<FinancesBloc>().add(AddDebtEvent(
            CreditCardDebt(
              name: debtName,
              amount: debtValue,
              cashFlowPeriod: MonthlyCashFlowPeriod(day: 1, monthsPerFlow: 1),
            ),
          ));
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              SizedBox(
                width: 200,
                child: TextFormField(
                  onChanged: (v) => debtName = v,
                  controller: _debtNameController,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        context
                            .read<FinancesBloc>()
                            .state
                            .debts
                            .any((e) => e.name == value)) {
                      return 'Credit card debt must have a unque name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: 200,
                child: TextFormField(
                  onChanged: (v) => debtValue = double.tryParse(v) ?? 0,
                  controller: _debtValueController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    TextInputFormatter.withFunction((oldValue, newValue) =>
                        RegExp(r'^\d*(\.\d{0,2})?$').hasMatch(newValue.text)
                            ? newValue
                            : oldValue)
                  ],
                  validator: (v) {
                    if (double.tryParse(v ?? "0") == null) {
                      return "must be a numeric value";
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    if (_formKey.currentState?.validate() == true) {
                      makeDebt();
                      _debtNameController.clear();
                      _debtValueController.clear();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DebtRow extends StatelessWidget {
  final Debt debt;
  const DebtRow({required this.debt, super.key});

  @override
  Widget build(BuildContext context) {
    switch (debt.runtimeType) {
      case CreditCardDebt:
        return CreditCardDebtRow(creditCardDebt: debt as CreditCardDebt);
      default:
        throw ArgumentError(
            '${debt.runtimeType} has not been implemented yet.');
    }
  }
}

class CreditCardDebtRow extends StatelessWidget {
  final CreditCardDebt creditCardDebt;
  const CreditCardDebtRow({required this.creditCardDebt, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text('${creditCardDebt.name}: ${creditCardDebt.amount}')],
    );
  }
}
