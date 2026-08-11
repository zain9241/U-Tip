import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter  U Tip App ',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  late int _personCount = 1;

  //Methods
  void increment() {
    setState(() {
      _personCount += 1;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount >1) {
        _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(context.widget);
    }
    var theme = Theme.of(context);
    // Add Style
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text("Flutter U Tip App"))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(" Total Per Person  ", style: style),
                Text(
                  " \$ 20.98  ",
                  style: style.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontSize: theme.textTheme.displaySmall?.fontSize,
                  ),
                ),
              ],
            ),
          ),
          // Form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: .circular(5),
                border: Border.all(
                  color: theme.colorScheme.inversePrimary,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: "Bill Amount ",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {},
                  ),
                  //Split Bill Area
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("Split ", style: theme.textTheme.titleLarge),
                      Row(
                        children: [
                          IconButton(
                            onPressed: decrement,
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            "$_personCount",
                            style: theme.textTheme.titleMedium,
                          ),
                          IconButton(
                            onPressed: increment,
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
