import 'package:flutter/material.dart';
import 'package:math_solver/core/constants/string_const.dart';

import 'custom_input_border.dart';

class CustomNumberField extends SizedBox {
  CustomNumberField.numberField({
    super.key,
    required String label,
    bool beAbleZero = true,
    required double width,
    required TextEditingController controller,
  }) : super(
          width: width,
          child: TextFormField(
            textAlign: TextAlign.start,
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: label,
              focusedErrorBorder:
                  CustomInputBorders.numberFieldBorder(color: Colors.red),
              errorBorder:
                  CustomInputBorders.numberFieldBorder(color: Colors.red),
              enabledBorder: CustomInputBorders.numberFieldBorder(),
              focusedBorder: CustomInputBorders.numberFieldBorder(),
            ),
            validator: (value) {
              if (value != null && value.trim().isNotEmpty) {
                if (double.tryParse(value.trim()) is double) {
                  if (!beAbleZero && double.parse(value.trim()) == 0) {
                    return StringConst.validatorAEqualText;
                  } else if (double.parse(value.trim()) <= 10000 &&
                      double.parse(value.trim()) >= -10000) {
                    return null;
                  }
                  return StringConst.maxValue;
                } else {
                  return StringConst.egValues;
                }
              } else {
                return StringConst.egValues;
              }
            },
          ),
        );
}
