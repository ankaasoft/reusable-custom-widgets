import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonWgt extends StatelessWidget {
  final String text;
  final Function onPressed;

  const ButtonWgt({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: () => onPressed(),
    );
  }
}

class DropdownButtonWgt extends ConsumerWidget {
  final List<String> list1;
  final String item;
  final Function onChanged1;
  Icon? icon=const Icon(Icons.album_outlined);
  Color? ddColor=Colors.white;
  Color? focusColor=Colors.white;
  double? borderRadiusCircular;

  DropdownButtonWgt({
    required this.list1,
    required this.item,
    required this.onChanged1,
    this.icon,
    this.ddColor,
    this.focusColor,
    this.borderRadiusCircular
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          //const Text("Choose color :"),
          Container(
            decoration: BoxDecoration(
              //color: Colors.white, //
              borderRadius: BorderRadius.circular(borderRadiusCircular??0.0), // Border radius
            ),
            child: DropdownButton(
              focusColor: focusColor,
              dropdownColor: ddColor,
              enableFeedback: true,
              borderRadius: BorderRadius.circular(borderRadiusCircular??0.0),
              value: item,
              items: list1.map((String val){
                return DropdownMenuItem(
                  value: val,
                  child: Row(
                    children: [
                      icon??Icon(icon as IconData?),
                      Text(val),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? value){onChanged1(value);} ,
            ),
          )
        ],
      ),
    );
  }
}

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

class TextButtonWgt extends StatelessWidget {
  TextButtonWgt({super.key,
    required this.resultButton,
    required this.textButtonFunction,
    this.fontSize,
  });

  final String resultButton;
  final Function textButtonFunction;
  double? fontSize=24.0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed:(){
          textButtonFunction();
        },
        child: Text(
          resultButton,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ));
  }
}

class GroupRadioWgt extends StatelessWidget {
  GroupRadioWgt({
    super.key,
    required this.radioStatus,
    required this.onChangedRadio,
    required this.text1,
    required this.text2,
  });

  final int radioStatus;
  final Function onChangedRadio;
  String text1;
  String text2;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            children: [
              Radio(
                value: 0,
                groupValue: radioStatus,
                onChanged: (int? value){ onChangedRadio(value);},
              ),
              const SizedBox(width: 8.0),
              Text(text1)
            ]
        ),
        Row(
            children: [
              Radio(
                value: 1,
                groupValue: radioStatus,
                onChanged: (int? value){ onChangedRadio(value);},
              ),
              const SizedBox(width: 8.0),
              Text(text2)
            ]
        )
      ],
    );
  }
}