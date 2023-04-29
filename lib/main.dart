import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_class_examples/checkbox/checkbox_tabs.dart';
import 'package:widget_class_examples/textfield/textfield_tabs.dart';
import 'view/alert_dialog_view.dart';
import 'view/information_view.dart';
import 'classes/tab_scaffold.dart';
import 'homepage.dart';
import 'package:widget_class_examples/card_list_page.dart';
import 'package:widget_class_examples/dropdown/dropdown_tabs.dart';
import 'package:widget_class_examples/dropdown/dropdown_output.dart';
import 'code_page1.dart';
import 'code_page2.dart';
import 'code_page3.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    List<String> list=['AlertDialog','Card','Checkbox','DropdownButton','ElevatedButton','RadioListTile','TextField'];
    final GoRouter router = GoRouter(routes: [
      GoRoute(
        path: '/',
        name: 'mainpage',
        builder: (context, state){
          return MainMenu();
        }
      ),
      GoRoute(
          path: '/card_list_page',
          name: 'cardlistpage',
          builder: (context, state) {
            return CardListPage(list: list);
          },
        routes: [
          GoRoute(
            path: 'checkbox/checkbox_tabs',
            name: 'checkboxtabs',
            builder: (context, state){
              //return CardListPage(title: "Input Data", list: list);
              return const CheckboxTabs(); //CheckboxView
            },
          ),
          GoRoute(
            path: 'dropdown/dropdown_tabs',
            name: 'dropdowntabs',
            builder: (context, state){
              //return CardListPage(title: "Input Data", list: list);
              return const DropdownTabs(); //CheckboxView
            },
          ),
          GoRoute(
            path: 'dropdown/dropdown_output',
            name: 'dropdownoutput',
            builder: (context, state){
              //return CardListPage(title: "Input Data", list: list);
              return DropdownOutput(); //CheckboxView
            },
          ),
          GoRoute(
            path: 'textfield/textfield_tabs',
            name: 'textfieldtabs',
            builder: (context, state){
              //return CardListPage(title: "Input Data", list: list);
              return const TextFieldTabs();
            },
          ),
          GoRoute(
            path: 'view/alert_dialog_view',
            name: 'alertdialogview',
            builder: (context, state){
              //return CardListPage(title: "Input Data", list: list);
              return const AlertDialogView();
            },
          ),
          GoRoute(
            path: 'view/information_view',
            name: 'informationview',
            builder: (context, state){
              //return CardListPage(title: "Input Data", list: list);
              return const InformationView();
            },
          ),
        ]
      ),
    ], initialLocation: '/', debugLogDiagnostics: true);

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Reusable Widget Examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  MainMenu({Key? key}) : super(key: key);

  List<String> list=[
    'Checkbox','Card','TextField','RadioListTile',
    'ElevatedButton','DropdownButton','AlertDialog'
  ];


  @override
  Widget build(BuildContext context) {
    list.sort();
    return CardListPage(list: list, );
/*    return MaterialApp(
      home: CardListPage(list: list, ),
    );*/
  }
}

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin{
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
      textPage2: "<>Mainpage",
      textPage3: "<>Widgets",
      textPage4: "<>Methods",
      function1: HomePage(),
      function2: const CodePage1(),
      function3: const CodePage2(),
      function4: const CodePage3(),
    );
  }
}


