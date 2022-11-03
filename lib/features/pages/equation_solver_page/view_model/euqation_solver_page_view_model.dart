import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_solver/core/constants/string_const.dart';
import 'package:math_solver/core/extensions/double_extension.dart';

import '../view/equation_solver_page_view.dart';

abstract class EquationSolverPageViewModel
    extends State<EquationSolverPageView> {
  late final TextEditingController controllerA;
  late final TextEditingController controllerB;
  late final TextEditingController controllerC;

  String deltaText = '';

  double firstValue = 0.0;

  double secondValue = 0.0;

  final key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controllerA = TextEditingController();
    controllerB = TextEditingController();
    controllerC = TextEditingController();
  }

  calculateX1(double a, double b, double c) {
    setState(() {
      firstValue = (-b + pow(findDelta(a, b, c), 1 / 2)) / (2 * a);
      firstValue = firstValue.shorted();
    });
  }

  calculateX2(double a, double b, double c) {
    setState(() {
      secondValue = (-b - pow(findDelta(a, b, c), 1 / 2)) / (2 * a);
      secondValue = secondValue.shorted();
    });
  }

  double findDelta(double a, double b, double c) {
    final delta = pow(b, 2) - (4 * a * c);

    if (delta > 0) {
      deltaText = StringConst.deltaBigText;
    } else if (delta == 0) {
      deltaText = StringConst.deltaEqualText;
    } else {
      deltaText = StringConst.deltaSmallText;
    }

    return delta;
  }
}
