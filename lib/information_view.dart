import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_class_examples/widgets.dart';
import 'package:widget_class_examples/methods.dart';

class InformationView extends StatelessWidget {
  const InformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: Container(
            decoration: buildBoxDecoration10(),
            height:100.0,
              width: 400.0,
              child: Center(child: Text("View is unavailable"))
          ), //unavailable
      ),
    );
  }
}
