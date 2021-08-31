import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var textController = TextEditingController();

  DateTime date = DateTime.now();
  String dateFormatNoClock = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String dateCalculator = DateFormat('yyyy').format(DateTime.now());

  String input = "";
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
          centerTitle: true,
          title: Text("Age Calculator"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                dateFormatNoClock,
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextField(
                  onChanged: (String value) {
                    input = value;
                  },
                  controller: textController,
                  showCursor: false,
                  maxLength: 4,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.yellow,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Write your year of birth day",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3),
              TextButton(
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.yellowAccent, fontSize: 30),
                ),
                onPressed: () {
                  setState(() {
                    result = int.parse(dateCalculator) - int.parse(input);
                    if (result >= 1000) {
                      result = 000;
                    }
                    textController.clear();
                    print(result);
                  });
                },
              ),
              Text(
                "$result",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
