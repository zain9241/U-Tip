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
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(context.widget);
    }
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Flutter U Tip App")),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(" Total Per Person  ",
                  style: theme.textTheme.titleMedium ,
                ),
                 Text(" \$ 20.98  " ,
                style:Theme.of(context).textTheme.displaySmall ,
                ),

              ],
            ), ),
        ],
      ),
    );
  }
}
