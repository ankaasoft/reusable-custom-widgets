import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_class_examples/methods.dart';
import 'package:widget_class_examples/classes/tab_scaffold.dart';
import 'checkbox/checkbox_tabs.dart';
import 'code_page3.dart';

class CardListPage extends StatelessWidget {
  //final String title;
  final List<dynamic> list;

  const CardListPage({super.key,
    //required this.title,
    required this.list
  });


  @override
  Widget build(BuildContext context) {
    int itemCount = list.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Widget Class Examples"),
      ),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text('${list[index]}'),
              subtitle: Text('Descriptive ${list[index]}'),
              onTap: () {
                //buildShowDialog(context, index, "OK");
/*                ['AlertDialog','Card','Checkbox','DropdownButton',
                 'ElevatedButton','RadioListTile','TextField']*/
                switch (list[index]) {
                  case 'AlertDialog':
                    context.goNamed("informationview");
                    break;
                  case 'Checkbox':
                    context.goNamed("checkboxtabs");
                    break;
                  case 'DropdownButton':
                    context.goNamed("dropdowntabs");
                    break;
                  case 'TextField':
                    context.goNamed("textfieldtabs");
                    break;
                  default:
                    context.goNamed("informationview");
                }
              },
            ),
          );
        },
      ),
    );
  }
}
