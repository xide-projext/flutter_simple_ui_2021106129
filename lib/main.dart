import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SimpleUI(),
    );
  }
}

class SimpleUI extends StatefulWidget {
  @override
  _SimpleUIState createState() => _SimpleUIState();
}

class _SimpleUIState extends State<SimpleUI> {
  final inputController = TextEditingController();
  String resultText = "";
  List<String> resultList = [];
  String selectedOption = 'Option 1';
  bool isChecked = false;

  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text('UI 확장 예시')),
        body: Column(
            children: [
              TextField(controller: inputController),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedOption,
                items: <String>['Option 1', 'Option2', 'Option 3']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOption = newValue!;
                    });
                  },
              ),
              CheckboxListTile(
                title: Text('Enable Option'),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    String result = "${inputController.text} - $selectedOption";
                    if (isChecked) {
                      result += " (Enabled)";
                    }
                    resultList.add(result);
                  });
                },
                child: Text('Add to List with Options'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: resultList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(resultList[index]),
                    );
                  }
                )
              )
              ],
          )
      );
  }
}
