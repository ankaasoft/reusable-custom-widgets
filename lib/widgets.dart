import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class buttonWgt extends StatelessWidget {
  final String text;
  final Function onPressed;

  buttonWgt({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: () => onPressed(),
    );
  }
}

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
          //const Text("Pilih :"),
          Container(
            decoration: BoxDecoration(
              //color: Colors.white, // Warna latar belakang container
              borderRadius: BorderRadius.circular(borderRadiusCircular??0.0), // Border radius
/*                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Warna bayangan
                        blurRadius: 5.0, // Jarak blur bayangan
                        spreadRadius: 2.0, // Jarak penyebaran bayangan
                        offset: Offset(0, 3), // Posisi bayangan (x, y)
                      ),
                    ],*/
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
              onChanged: (String? value){onChanged1(value);} ,
            ),
          )
        ],
      ),
    );
  }
}
