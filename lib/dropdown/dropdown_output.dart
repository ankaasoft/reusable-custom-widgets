import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_class_examples/widgets.dart';
import 'package:widget_class_examples/methods.dart';

final dropdownValueProvider = StateProvider((ref) => "Red");

class DropdownOutput extends ConsumerWidget {
  DropdownOutput({Key? key}) : super(key: key);

  Icon myIcon = const Icon(Icons.arrow_forward_ios);
  List<String> list = ["Red", "Yellow", "Green", "Blue"];
  String item = "Red";

  late String resultDropdown;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void dropdownButtonFunction(value) {
      ref.read(dropdownValueProvider.notifier).state = value;
    }
    resultDropdown = ref.watch(dropdownValueProvider);
    item = ref.watch(dropdownValueProvider);
    return Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.0,
              height: 140.0,
              decoration: buildBoxDecoration10(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Choose the color :"),
                  const SizedBox(height: 10.0),
                  DropdownButtonWgt(
                      item: item,
                      list1: list,
                      //ddColor: Colors.red,
                      //focusColor: Colors.yellow,
                      borderRadiusCircular: 20.0,
                      onChanged1: dropdownButtonFunction,
                      icon: myIcon),
                  const SizedBox(height: 10.0),
                  Text("Color : $resultDropdown"),
                ],
              ),
            ),
            const Text("DropdownButton"),
          ],
        )
    );
  }
}
