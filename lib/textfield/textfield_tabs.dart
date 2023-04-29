import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'textfield_output.dart';
import 'code_views/textField_run_code.dart';
import 'code_views/textField_widget_code.dart';
import 'code_views/method_codes.dart';
import '../classes/tab_scaffold.dart';


class TextFieldTabs extends ConsumerStatefulWidget {
  const TextFieldTabs({Key? key}) : super(key: key);

  @override
  TextFieldTabsState createState() => TextFieldTabsState();
}

class TextFieldTabsState extends ConsumerState<TextFieldTabs> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController=TabController(vsync: this, length: 4, initialIndex:0);
  }

  @override
  Widget build(BuildContext context) {
    return TabScaffold4(
      tabController: tabController,
      tabName: "TextField",
      textPage1: "Output",
      textPage2: " <> \nMainpage",
      textPage3: " <> \nWidgets",
      textPage4: " <> \nMethods",
      function1: TextFieldOutput(),
      function2: const TextFieldRunCode(),
      function3: const TextFieldWidgetCode(),
      function4: const MethodCodes(),
    );
  }
}
