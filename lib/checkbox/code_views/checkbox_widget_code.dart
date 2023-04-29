import 'package:flutter/material.dart';

class CheckboxWidgetCode extends StatelessWidget {
  const CheckboxWidgetCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text('''
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckboxWgt extends StatelessWidget {
  const CheckboxWgt({
    super.key,
    required this.checkboxValue,
    required this.checkboxFunction
  });

  final bool checkboxValue;
  final Function checkboxFunction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
              Checkbox(
                value:checkboxValue,
                onChanged: (bool? value){
                  checkboxFunction(value);
                },
              ),
              const Text('Able/Disable ...'),
      ],
    );
  }
}      
              '''),
            ],
          ),
        )
    );
  }
}