import 'package:flutter/material.dart';

class DropdownWidgetCode extends StatelessWidget {
  const DropdownWidgetCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text('''
import 'package:flutter/material.dart';

class DropdownButtonWgt extends ConsumerWidget {
  final List<String> list1;
  final String item;
  final Function onChanged1;
  Icon? icon=const Icon(Icons.album_outlined);
  Color? ddColor=Colors.white;
  Color? focusColor=Colors.white;
  double? borderRadiusCircular;

  DropdownButtonWgt({
    required this.list1,
    required this.item,
    required this.onChanged1,
    this.icon,
    this.ddColor,
    this.focusColor,
    this.borderRadiusCircular
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          //const Text("Choose color :"),
          Container(
            decoration: BoxDecoration(
              //color: Colors.white, //
              borderRadius: BorderRadius.circular(borderRadiusCircular??0.0), // Border radius
            ),
            child: DropdownButton(
              focusColor: focusColor,
              dropdownColor: ddColor,
              enableFeedback: true,
              borderRadius: BorderRadius.circular(borderRadiusCircular??0.0),
              value: item,
              items: list1.map((String val){
                return DropdownMenuItem(
                  value: val,
                  child: Row(
                    children: [
                      icon??Icon(icon as IconData?),
                      Text(val),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? value){onChanged1(value);},
            ),
          )
        ],
      ),
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