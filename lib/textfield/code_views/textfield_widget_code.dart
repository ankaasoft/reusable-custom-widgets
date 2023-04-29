import 'package:flutter/material.dart';

class TextFieldWidgetCode extends StatelessWidget {
  const TextFieldWidgetCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text('''
import 'package:flutter/material.dart';

class TextFieldTextWgt extends StatelessWidget {
  TextFieldTextWgt({
    super.key,
    required this.textEditingController,
    maxLength
  });

  final TextEditingController textEditingController;
  int? maxLength=50;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textEditingController,
        keyboardType: TextInputType.text,
        maxLength: maxLength,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        showCursor: true,
        decoration: InputDecoration(
          counter: const Offstage(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
    );
  }
}

class TextFieldNumWgt extends StatelessWidget {
  TextFieldNumWgt({
    super.key,
    required this.textEditingController,
    maxLength
  });

  final TextEditingController textEditingController;
  int? maxLength=20;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        maxLength: maxLength,
        textAlign: TextAlign.right,
        textAlignVertical: TextAlignVertical.center,
        showCursor: true,
        decoration: InputDecoration(
          counter: const Offstage(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      inputFormatters: [
        CurrencyTextInputFormatter(
          locale: 'en',
          decimalDigits: 0,
          symbol: '',
        )
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