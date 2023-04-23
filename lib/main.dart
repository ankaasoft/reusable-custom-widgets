import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dropdown_button1/widgets.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final dropdownValueProvider = StateProvider((ref) => "Merah");
final buttonValueProvider = StateProvider((ref) => "Hello World!");

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

typedef myDropdownButtonFunction = void Function(String);
typedef myButtonFunction = void Function(String);

class MyHomePage extends ConsumerWidget {
  MyHomePage({Key? key}) : super(key: key);

  Icon myIcon = const Icon(Icons.arrow_forward_ios);
  List<String> list = ["Merah", "Kuning", "Hijau", "Biru"];
  String item = "Merah";

  late String result;
  String result1="Hello World!";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void myDropdownButtonFunction(value) {
      ref.read(dropdownValueProvider.notifier).state = value;
    }

    void myButtonFunction() {
      ref.read(buttonValueProvider.notifier).state = "Hello World, Selamat Datang di Dunia Flutter";
    }

    result = ref.watch(dropdownValueProvider);
    result1 = ref.watch(buttonValueProvider);
    item = ref.watch(dropdownValueProvider);
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Contoh Dropdown Button"),
        ),
        body: Center(
          child: Column(
            children: [
              DropdownButtonWgt(
                  item: item,
                  list1: list,
                  //ddColor: Colors.red,
                  //focusColor: Colors.yellow,
                  borderRadiusCircular: 20.0,
                  onChanged1: myDropdownButtonFunction,
                  icon: myIcon
              ),
              const SizedBox(height: 10.0),
              buttonWgt(text: "Print Hello!", onPressed: myButtonFunction),
              const SizedBox(height: 10.0),
              Text(result),
              const SizedBox(height: 10.0),
              Text(result1),
            ],
          ),
        ));
  }
}

