import 'package:app/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // 01
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 03
            StreamBuilder(
              stream: counterBloc.counterStream,
              builder: (context, snapshot) {
                return Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),

            // 02
            IconButton(
              onPressed: () {
                _counter++;
                counterBloc.counterSink.add(_counter);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
