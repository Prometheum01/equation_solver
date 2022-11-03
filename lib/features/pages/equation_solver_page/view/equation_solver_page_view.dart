import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/widgets/custom_text_fields.dart';
import '../view_model/euqation_solver_page_view_model.dart';

class EquationSolverPageView extends StatefulWidget {
  const EquationSolverPageView({super.key});

  @override
  State<EquationSolverPageView> createState() => _EquationSolverPageViewState();
}

class _EquationSolverPageViewState extends EquationSolverPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'You have to use . format e.g. 0.254, -125.21',
          style: context.textTheme.headline6
              ?.copyWith(color: Colors.white, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'f(x) = ax^2 + bx + c',
              style: context.textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Form(
                key: key,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomNumberField.numberField(
                      width: context.dynamicWidth(0.25),
                      controller: controllerA,
                      beAbleZero: false,
                      label: 'a',
                    ),
                    CustomNumberField.numberField(
                      width: context.dynamicWidth(0.25),
                      controller: controllerB,
                      label: 'b',
                    ),
                    CustomNumberField.numberField(
                      width: context.dynamicWidth(0.25),
                      controller: controllerC,
                      label: 'c',
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  calculateX1(
                    double.parse(controllerA.text.trim()),
                    double.parse(controllerB.text.trim()),
                    double.parse(controllerC.text.trim()),
                  );
                  calculateX2(
                    double.parse(controllerA.text.trim()),
                    double.parse(controllerB.text.trim()),
                    double.parse(controllerC.text.trim()),
                  );
                }
              },
              child: const Text('Calculate'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(deltaText),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'x1 = $firstValue',
                ),
                Text(
                  'x2 = $secondValue',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
