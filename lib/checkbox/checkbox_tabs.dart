import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'code_views/checkbox_code.dart';
import 'code_views/checkbox_widget_code.dart';
import 'code_views/method_codes.dart';
import 'checkbox_output.dart';
import '../classes/tab_scaffold.dart';

final checkboxValueProvider = StateProvider((ref) => true);

class CheckboxTabs extends ConsumerStatefulWidget {
  const CheckboxTabs({Key? key}) : super(key: key);

  @override
  CheckboxTabsState createState() => CheckboxTabsState();
}

class CheckboxTabsState extends ConsumerState<CheckboxTabs> with SingleTickerProviderStateMixin{
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
      tabName: "CheckBox",
      textPage1: "Output",
      textPage2: " <> \nMainpage",
      textPage3: " <> \nWidgets",
      textPage4: " <> \nMethods",
      function1: CheckboxOutput(),
      function2: const CheckboxCode(),
      function3: const CheckboxWidgetCode(),
      function4: const MethodCodes(),
    );
  }
}
