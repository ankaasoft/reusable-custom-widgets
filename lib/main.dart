import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_class_examples/widgets.dart';
import 'package:widget_class_examples/methods.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final dropdownValueProvider = StateProvider((ref) => "Red");
final buttonValueProvider = StateProvider((ref) => "Hello World!");
final checkboxValueProvider = StateProvider((ref) => true);
final radioStatusProvider=StateProvider((ref) => -1);

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

typedef dropdownButtonFunction = void Function(String);
typedef buttonFunction = void Function(String);

class MyHomePage extends ConsumerWidget {
  MyHomePage({Key? key}) : super(key: key);

  Icon myIcon = const Icon(Icons.arrow_forward_ios);
  List<String> list = ["Red", "Yellow", "Green", "Blue"];
  String item = "Red";

  late String resultDropdown;
  String resultButton = "Hello World!";

  bool checkboxValue = true;
  String checkboxState = "true";
  int radioStatus=0;
  String gender="Unknown";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void dropdownButtonFunction(value) {
      ref.read(dropdownValueProvider.notifier).state = value;
    }

    void buttonFunction() {
      ref.read(buttonValueProvider.notifier).state =
          "Welcome to the world of Flutter.";
    }

    void textButtonFunction() {
      ref.read(buttonValueProvider.notifier).state = "Hello World!";
    }

    void checkboxFunction(value) {
      ref.read(checkboxValueProvider.notifier).state = value;
    }

    void onChangedRadio(value){
      ref.read(radioStatusProvider.notifier).state=value;
    }

    resultDropdown = ref.watch(dropdownValueProvider);
    item = ref.watch(dropdownValueProvider);

    resultButton = ref.watch(buttonValueProvider);

    checkboxValue = ref.watch(checkboxValueProvider);
    checkboxState = ref.watch(checkboxValueProvider).toString();

    radioStatus=ref.watch(radioStatusProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Widget Class Examples"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300.0,
                height: 130.0,
                decoration: buildBoxDecoration(),
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
              const SizedBox(height: 10.0),
              Container(
                width: 300.0,
                height: 100.0,
                decoration: buildBoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWgt(text: "Say welcome!", onPressed: buttonFunction),
                    const SizedBox(height: 10.0),
                    TextButtonWgt(
                      resultButton: resultButton,
                      textButtonFunction: textButtonFunction,
                      //fontSize: 18.0
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 300.0,
                height: 100.0,
                decoration: buildBoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CheckboxWgt(
                      checkboxValue: checkboxValue,
                      checkboxFunction: checkboxFunction,
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Checkbox Status : ",
                        ),
                        Text(
                          checkboxState,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 300.0,
                height: 100.0,
                decoration: buildBoxDecoration(),
                child: Column(
                  children: [
                    GroupRadioWgt(radioStatus: radioStatus,onChangedRadio: onChangedRadio,text1: "Male",text2: "Female"),
                    const SizedBox(height: 10.0),
                    Builder(
                      builder: (context) {
                        if (radioStatus==0){
                          gender="Male";
                        } else if (radioStatus==1){
                          gender="Female";
                        } else {
                          gender="Unknown";
                        }
                        return Text("Gender : $gender");
                      }
                    )
                  ],
                )
              ),
            ],
          ),
        ));
  }
}

