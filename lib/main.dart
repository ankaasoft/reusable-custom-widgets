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
final radioStatusProvider = StateProvider((ref) => -1);
final textValueProvider = StateProvider((ref) => "");
final numberValueProvider = StateProvider((ref) => 0.0);

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
typedef onPressedButtonFunction1 = void Function(String);
typedef onPressedButtonFunction2 = void Function(String);

class MyHomePage extends ConsumerWidget {
  MyHomePage({Key? key}) : super(key: key);

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  Icon myIcon = const Icon(Icons.arrow_forward_ios);
  List<String> list = ["Red", "Yellow", "Green", "Blue"];
  String item = "Red";

  late String resultDropdown;
  String resultButton1 = "Hello World!";

  bool checkboxValue = true;
  String checkboxState = "true";
  int radioStatus = 0;
  String gender = "Unknown";

  String textValue = "";
  double numberValue = 0.0;
  String stringNumberValue = "0.0";

  double sizedBoxHeight = 5.0; //4x 5=20
  double sizedBox4TextFieldHeight = 40.0; //2x 40=80
  double containerHeight1 = (5 * 4) + (2 * 40) + 20 + 129 + 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void dropdownButtonFunction(value) {
      ref.read(dropdownValueProvider.notifier).state = value;
    }

    void textButtonFunction() {
      ref.read(buttonValueProvider.notifier).state = "Hello World!";
    }

    void checkboxFunction(value) {
      ref.read(checkboxValueProvider.notifier).state = value;
    }

    void onChangedRadioFunction(value) {
      ref.read(radioStatusProvider.notifier).state = value;
    }

    void onPressedButtonFunction1() {
      ref.read(buttonValueProvider.notifier).state =
          "Welcome to the world of Flutter.";
    }

    void onPressedButtonFunction2() {
      var value = textEditingController1.text;
      ref.read(textValueProvider.notifier).state = value;
    }

    void onPressedButtonFunction3() {
      if (textEditingController2.text.isEmpty) {
        var value = 0.0;
        ref.read(numberValueProvider.notifier).state = value;
      } else {
        var value = stringToDoubleParse(
            textEditingController2.text.replaceAll(",", ""));
        ref.read(numberValueProvider.notifier).state = value;
      }
    }

    resultDropdown = ref.watch(dropdownValueProvider);
    item = ref.watch(dropdownValueProvider);

    resultButton1 = ref.watch(buttonValueProvider);

    checkboxValue = ref.watch(checkboxValueProvider);
    checkboxState = ref.watch(checkboxValueProvider).toString();

    radioStatus = ref.watch(radioStatusProvider);

    textValue = ref.watch(textValueProvider);
    numberValue = ref.watch(numberValueProvider);
    stringNumberValue = ref.watch(numberValueProvider).toString();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Widget Class Examples"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300.0,
                    height: containerHeight1,
                    decoration: buildBoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center, // Mengatur posisi widget menjadi tengah secara horizontal
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // Mengatur posisi widget menjadi tengah secara vertikal
                              children: [
                                const SizedBox(
                                    width: 100.0, child: Text("Input text")),
                                const SizedBox(width: 10.0),
                                SizedBox(
                                    width: 200.0,
                                    height: sizedBox4TextFieldHeight, //1
                                    child: TextFieldTextWgt(
                                        textEditingController:
                                            textEditingController1)),
                              ],
                            ),
                            //SizedBox(height: sizedBoxHeight), //>1
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center, // Mengatur posisi widget menjadi tengah secara horizontal
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // Mengatur posisi widget menjadi tengah secara vertikal
                              children: [
                                const SizedBox(
                                  width: 100.0,
                                  child: Text("Input number"),
                                ),
                                const SizedBox(width: 10.0),
                                SizedBox(
                                    width: 200.0,
                                    height: sizedBox4TextFieldHeight, //2
                                    child: TextFieldNumWgt(
                                        textEditingController:
                                            textEditingController2)),
                              ],
                            ),
                            //SizedBox(height: sizedBoxHeight), //>3
                            ButtonWgt(
                                text: "Show Text",
                                onPressed: onPressedButtonFunction2),
                            Text("Text   : $textValue"),
                            SizedBox(height: sizedBoxHeight), //>4
                            ButtonWgt(
                                text: "Show Number",
                                onPressed: onPressedButtonFunction3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Number : "),
                                buildTextNumberFormat(numberValue),
                              ],
                            ),
                          ]),
                    )),
                const SizedBox(height: 5.0),
                Container(
                  width: 300.0,
                  height: 140.0,
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
                  height: 140.0,
                  decoration: buildBoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWgt(
                          text: "Say welcome!",
                          onPressed: onPressedButtonFunction1),
                      const SizedBox(height: 10.0),
                      TextButtonWgt(
                        resultButton: resultButton1,
                        textButtonFunction: textButtonFunction,
                        //fontSize: 18.0
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  width: 300.0,
                  height: 140.0,
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
                    height: 150.0,
                    decoration: buildBoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GroupRadioWgt(
                            radioStatus: radioStatus,
                            onChangedRadio: onChangedRadioFunction,
                            text1: "Male",
                            text2: "Female"),
                        const SizedBox(height: 10.0),
                        Builder(builder: (context) {
                          if (radioStatus == 0) {
                            gender = "Male";
                          } else if (radioStatus == 1) {
                            gender = "Female";
                          } else {
                            gender = "Unknown";
                          }
                          return Text("Gender : $gender");
                        })
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
