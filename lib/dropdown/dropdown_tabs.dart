import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dropdown_output.dart';
import 'code_views/dropdown_run_code.dart';
import 'code_views/dropdown_widget_code.dart';
import 'code_views/method_codes.dart';
import '../classes/tab_scaffold.dart';

final dropdownValueProvider = StateProvider((ref) => true);

class DropdownTabs extends ConsumerStatefulWidget {
  const DropdownTabs({Key? key}) : super(key: key);

  @override
  DropdownTabsState createState() => DropdownTabsState();
}

class DropdownTabsState extends ConsumerState<DropdownTabs> with SingleTickerProviderStateMixin{
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
      tabName: "DropdownButton",
      textPage1: "Output",
      textPage2: " <> \nMainpage",
      textPage3: " <> \nWidgets",
      textPage4: " <> \nMethods",
      function1: DropdownOutput(),
      function2: const DropdownRunCode(),
      function3: const DropdownWidgetCode(),
      function4: const MethodCodes(),
    );
  }
}
