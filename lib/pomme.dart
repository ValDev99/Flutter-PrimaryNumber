import 'package:flutter/material.dart';

class Pomme extends StatefulWidget {
  const Pomme({super.key, required this.title});
  final String title;

  @override
  State<Pomme> createState() => _PommeState();
}

class _PommeState extends State<Pomme> {
  int _counter = 0;
  List<int> _fruits = []; //

  void _incrementCounter() {
    setState(() {
      _counter++;
      _fruits.add(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _fruits.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item ${_fruits[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
