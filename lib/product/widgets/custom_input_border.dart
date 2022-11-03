import 'package:flutter/material.dart';
import 'package:math_solver/core/constants/border_radius_const.dart';

class CustomInputBorders extends OutlineInputBorder {
  CustomInputBorders.numberFieldBorder({Color color = Colors.grey})
      : super(
          borderRadius: const BorderRadiusConst.smallAll(),
          borderSide: BorderSide(
            color: color,
          ),
        );
}
