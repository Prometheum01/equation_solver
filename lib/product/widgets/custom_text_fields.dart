import 'package:flutter/material.dart';

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
                    return 'a != 0';
                  } else if (double.parse(value.trim()) <= 10000 &&
                      double.parse(value.trim()) >= -10000) {
                    return null;
                  }
                  return 'Max 10000';
                } else {
                  return 'e.g. 1.5, -2';
                }
              } else {
                return 'e.g. 1.5, -2';
              }
            },
          ),
        );
}


/*
class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.25),
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: const CustomInputBorders.numberFieldBorder(),
          focusedBorder: const CustomInputBorders.numberFieldBorder(),
        ),
      ),
    );
  }
}
*/