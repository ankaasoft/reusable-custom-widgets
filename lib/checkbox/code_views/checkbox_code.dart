import 'package:flutter/material.dart';

class CheckboxCode extends StatelessWidget {
  const CheckboxCode({Key? key}) : super(key: key);

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

final checkboxValueProvider = StateProvider((ref) => true);

class CheckboxOutput extends ConsumerWidget {
  CheckboxOutput({Key? key}) : super(key: key);

  bool checkboxValue = true;
  String checkboxState = "true";
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void checkboxFunction(value) {
      ref.read(checkboxValueProvider.notifier).state = value;
    }
    checkboxValue = ref.watch(checkboxValueProvider);
    checkboxState = ref.watch(checkboxValueProvider).toString();
    return Scaffold(
      body: Center(
            child: Column(
              children: [
                Container(
                  width: 300.0,
                  height: 140.0,
                  decoration: buildBoxDecoration10(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckboxWgt(
                        checkboxValue: checkboxValue,
                        checkboxFunction: checkboxFunction,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Checkbox Status : ",
                          ),
                          Text(
                            checkboxState,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
            
            '''),
            ]
          ),
        )
    );
  }
}