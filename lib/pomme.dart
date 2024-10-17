import 'package:flutter/material.dart';

class Pomme extends StatefulWidget {
  const Pomme({super.key, required this.title});
  final String title;

  @override
  State<Pomme> createState() => _PommeState();
}

class _PommeState extends State<Pomme> {
  int _counter = 0;
  List<int> _fruits = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
      _fruits.add(_counter);
    });
  }

  bool _isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  bool _isEven(int number) => number % 2 == 0;

  String _getNumberType(int number) {
    if (_isPrime(number)) return "Nombre premier";
    return _isEven(number) ? "Nombre pair" : "Nombre impair";
  }

  Image _getImageForNumber(int number) {
    if (_isPrime(number)) {
      return Image.asset('images/ananas.png');
    } else if (_isEven(number)) {
      return Image.asset('images/poire.png');
    } else {
      return Image.asset('images/pomme.png');
    }
  }

  Color _getColorForNumber(int number) {
    return _isEven(number) ? Colors.indigo : Colors.cyan;
  }

  void _showAlertDialog(int number) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: _getColorForNumber(number),
          title: Text(_getNumberType(number)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _getImageForNumber(number),
              const SizedBox(height: 20),
              Text(
                'Valeur: $number',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _fruits.remove(number);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Supprimer', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('$_counter : ${_getNumberType(_counter)}'),
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
                  int currentItem = _fruits[index];

                  return ListTile(
                    leading: _getImageForNumber(currentItem),
                    title: Text(
                      '$currentItem',
                      style: const TextStyle(color: Colors.white),
                    ),
                    tileColor: _getColorForNumber(currentItem),
                    onTap: () => _showAlertDialog(currentItem),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: _counter == 0
            ? Colors.orange
            : _getColorForNumber(_counter),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
