import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:math_solver/core/constants/padding_const.dart';
import 'package:math_solver/core/constants/string_const.dart';

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
          StringConst.appBarFormatText,
          style: context.textTheme.headline6
              ?.copyWith(color: Colors.white, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const PaddingConst.allMedium(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              StringConst.functionDefaultText,
              style: context.textTheme.headline4,
            ),
            Padding(
              padding: const PaddingConst.verticalMedium(),
              child: Form(
                key: key,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomNumberField.numberField(
                      width: context.dynamicWidth(0.25),
                      controller: controllerA,
                      beAbleZero: false,
                      label: StringConst.a,
                    ),
                    CustomNumberField.numberField(
                      width: context.dynamicWidth(0.25),
                      controller: controllerB,
                      label: StringConst.b,
                    ),
                    CustomNumberField.numberField(
                      width: context.dynamicWidth(0.25),
                      controller: controllerC,
                      label: StringConst.c,
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
              child: const Text(StringConst.calculateText),
            ),
            Padding(
              padding: const PaddingConst.verticalMedium(),
              child: Text(deltaText),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${StringConst.x1} $firstValue',
                ),
                Text(
                  '${StringConst.x1} $secondValue',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
