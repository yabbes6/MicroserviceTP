import 'package:flutter/material.dart';

class Fields extends StatefulWidget {
  const Fields({super.key});

  @override
  State<Fields> createState() => _FieldsState();
}

enum Groups { groupe1, groupe2 }

class _FieldsState extends State<Fields> {
  String _value = "hello world";
  void _onChange(String value) {
    setState(() {
      _value = "Change : ${_value}";
    });
  }

  void _onSubmit(String value) {
    setState(() {
      _value = "Submit : ${_value}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(title: const Text("my name yassine")),
        body: Container(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Text(_value),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Nom',
                    hintText: 'Tapez votre nom',
                    icon: Icon(Icons.people)),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: _onChange,
                onSubmitted: _onSubmit,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Forward")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _value = 'NO!!!';
                    });
                  },
                  child: const Text("Back"))
            ],
          ),
        ),
      ),
    );
  }
}
