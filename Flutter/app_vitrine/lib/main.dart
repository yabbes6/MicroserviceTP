import 'package:flutter/material.dart';

import 'fields.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter layout demo'),
          ),
          body: ListView(
            children: [
              Image.asset(
                "images/lake.jpg",
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              MyHomePage(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
                  _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
                  _buildButtonColumn(Colors.blue, Icons.share, 'SHARE'),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(32),
                child: const Text(
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                  'Alps. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                  'half-hour walk through pastures and pine forest, leads you to the '
                  'lake, which warms to 20 degrees Celsius in the summer. Activities '
                  'enjoyed here include rowing, and riding the summer toboggan run.',
                  softWrap: true,
                ),
              ),
            ],
          )),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isFav = false;
  int _favCount = 21;

  void _selectFavorite() {
    setState(() {
      if (_isFav == false) {
        _isFav = true;
        _favCount += 1;
      } else {
        _isFav = false;
        _favCount -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
            child: IconButton(
              icon: _isFav
                  ? const Icon(
                      Icons.star_outlined,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.star_rate_outlined,
                      color: Colors.red,
                    ),
              onPressed: () => _selectFavorite(),
            ),
          ),
          SizedBox(
              width: 20,
              child: Text(
                "$_favCount",
              ))
        ],
      ),
    );
  }
}
