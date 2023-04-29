import 'package:flutter/material.dart';

class TextFieldRunCode extends StatelessWidget {
  const TextFieldRunCode({Key? key}) : super(key: key);

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
import 'package:widget_class_examples/widgets.dart';
import 'package:widget_class_examples/methods.dart';

final textValueProvider = StateProvider((ref) => "");
final numberValueProvider = StateProvider((ref) => 0.0);


class TextFieldOutput extends ConsumerWidget {
  TextFieldOutput({Key? key}) : super(key: key);

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  String textValue = "";
  double numberValue = 0.0;
  String stringNumberValue = "0.0";

  double sizedBoxHeight = 5.0; //4x 5=20
  double sizedBox4TextFieldHeight = 40.0; //2x 40=80
  double containerHeight1 = 269.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    void onPressedButtonFunction2() {
      var value = textEditingController1.text;
      ref.read(textValueProvider.notifier).state = value;
    }

    void onPressedButtonFunction3() {
      if (textEditingController2.text.isEmpty) {
        var value = 0.0;
        ref.read(numberValueProvider.notifier).state = value;
      } else {
        var value = stringToDoubleParse(
            textEditingController2.text.replaceAll(",", ""));
        ref.read(numberValueProvider.notifier).state = value;
      }
    }

    textValue = ref.watch(textValueProvider);
    numberValue = ref.watch(numberValueProvider);
    stringNumberValue = ref.watch(numberValueProvider).toString();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Widget Class Examples"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300.0,
                    height: containerHeight1,
                    decoration: buildBoxDecoration10(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                    width: 100.0, child: Text("Input text")),
                                const SizedBox(width: 10.0),
                                SizedBox(
                                    width: 200.0,
                                    height: sizedBox4TextFieldHeight, //1
                                    child: TextFieldTextWgt(
                                        textEditingController:
                                        textEditingController1)),
                              ],
                            ),
                            //SizedBox(height: sizedBoxHeight), //>1
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 100.0,
                                  child: Text("Input number"),
                                ),
                                const SizedBox(width: 10.0),
                                SizedBox(
                                    width: 200.0,
                                    height: sizedBox4TextFieldHeight, //2
                                    child: TextFieldNumWgt(
                                        textEditingController:
                                        textEditingController2)),
                              ],
                            ),
                            //SizedBox(height: sizedBoxHeight), //>3
                            ButtonWgt(
                                text: "Show Text",
                                onPressed: onPressedButtonFunction2),
                            Text("Text   : \$\textValue"),
                            SizedBox(height: sizedBoxHeight), //>4
                            ButtonWgt(
                                text: "Show Number",
                                onPressed: onPressedButtonFunction3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Number : "),
                                buildTextNumberFormat(numberValue),
                              ],
                            ),
                          ]),
                    )),
              ],
            ),
          ),
        ));
  }
}
              '''),
            ],
          ),
        )
    );
  }
}