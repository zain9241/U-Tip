import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter U Tip App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  double _billAmount = 0;
  double _tipPercentage = 0;
  int _personCount = 1;

  double get _totalPerPerson {
    final total = _billAmount + (_billAmount * _tipPercentage);
    return total / _personCount;
  }

  void _increment() {
    setState(() {
      _personCount += 1;
    });
  }

  void _decrement() {
    setState(() {
      if (_personCount > 1) {
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
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Flutter U Tip App"))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text("Total Per Person", style: style),
                Text(
                  "\$ ${_totalPerPerson.toStringAsFixed(2)}",
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
            padding: const EdgeInsets.all(10),
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: theme.colorScheme.inversePrimary,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.attach_money),
                        labelText: "Bill Amount",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        setState(() {
                          _billAmount = double.tryParse(value) ?? 0;
                        });
                      },
                    ),
                    // Split Bill Area
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Split", style: theme.textTheme.titleLarge),
                        Row(
                          children: [
                            IconButton(
                              onPressed: _decrement,
                              icon: const Icon(Icons.remove),
                            ),
                            Text(
                              "$_personCount",
                              style: theme.textTheme.titleMedium,
                            ),
                            IconButton(
                              onPressed: _increment,
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // == Tip Section ==
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tip", style: theme.textTheme.titleMedium),
                        Text(
                          "\$ ${(_billAmount * _tipPercentage).toStringAsFixed(2)}",
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    // === Slider Text ===
                    Text(
                      "${(_tipPercentage * 100).toStringAsFixed(0)}%",
                      style: theme.textTheme.titleLarge,
                    ),
                    Slider(
                      value: _tipPercentage,
                      min: 0,
                      max: 1,
                      label: "${(_tipPercentage*100).round()}%",
                      onChanged: (value) {
                        setState(() {
                          _tipPercentage = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
