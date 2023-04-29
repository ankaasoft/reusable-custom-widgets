import 'package:flutter/material.dart';

class MethodCodes extends StatelessWidget {
  const MethodCodes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text('''
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

BoxDecoration buildBoxDecoration10() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    border: Border.all(
      width: 1.0,
    ),
  );
}

BoxDecoration buildBoxDecoration20() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(20),
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

Future<dynamic> buildShowDialog(BuildContext context, int title, String message) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
            title: const Text('&title'),
            content: Text(message),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
      );
    },
  );
}     
            '''),
            ]
          ),
        )
    );
  }
}