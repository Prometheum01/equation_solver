import 'package:flutter/material.dart';

class CustomInputBorders extends OutlineInputBorder {
  CustomInputBorders.numberFieldBorder({Color color = Colors.grey})
      : super(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: color,
          ),
        );
}
