import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/intl.dart';

BoxDecoration buildBoxDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    border: Border.all(
      width: 1.0,
    ),
  );
}

double stringToDoubleParse(String input) {
  return double.parse(
    input,
  );
}

final formatter = NumberFormat("#,###");

Text buildTextNumberFormat(numberValue) {
  return Text(
    formatter.format(numberValue),
    textAlign: TextAlign.end,
  );
}