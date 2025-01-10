
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

Future<List<String>> getData(filter) async {


  return [];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dropdownSearch Demo',
      //enable this line if you want test Dark Mode
      //theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final dropDownKey = GlobalKey<DropdownSearchState>();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('examples mode')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownSearch<String>(
                  key: dropDownKey,
                  selectedItem: "Menu",
                  items: (filter, infiniteScrollProps) =>
                      ["Menu", "Dialog", "Modal", "BottomSheet"],
                  decoratorProps: const DropDownDecoratorProps(
                    decoration: InputDecoration(
                      labelText: 'Examples for: ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  popupProps: const PopupProps.menu(
                      fit: FlexFit.loose, constraints: BoxConstraints()),
                ),
              ),
              const Padding(padding: EdgeInsets.only(right: 16)),
              FilledButton(
                onPressed: () {
                  switch (dropDownKey.currentState?.getSelectedItem) {
                    case 'Menu':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Text("")));
                      break;
                    case 'Modal':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Text("")));
                      break;
                    case 'BottomSheet':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const Text("")));
                      break;
                    case 'Dialog':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Text("")));
                      break;
                  }
                },
                child: const Text("Go"),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.all(8)),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 14.0, color: Colors.black),
              children: [
                TextSpan(text: 'we used '),
                TextSpan(
                    text: 'fit: FlexFit.loose',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' and '),
                TextSpan(
                    text: 'constraints: BoxConstraints() ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        'to fit the height of menu automatically to the length of items'),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Text(
            'DropdownSearch Anatomy',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
       
        ],
      ),
    );
  }
}