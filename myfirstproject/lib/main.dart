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
      title: 'MULTIPLE COUNTERS',
      theme: ThemeData(
  
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Multiple counters Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List <int> _counters =[]; 
  void addCounters(){
    setState(() {
      _counters.add(0);//initial value
    });
  }

  void _incrementCounter(int i) {
    setState(() {
      _counters[i]++;
    });
  }
  void decrementCounter(int f){
    setState(() {
      _counters[f]--;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _counters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Counter ${index + 1}: ${_counters[index]}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => decrementCounter(index),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _incrementCounter(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addCounters,
        tooltip: 'Add Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}