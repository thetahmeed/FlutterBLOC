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
  // 01
  final counterBloc = CounterBloc();

  // 05
  @override
  void dispose() {
    counterBloc.closeTheStreamController();
    super.dispose();
  }

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
            Spacer(),
            // 04
            IconButton(
              onPressed: () {
                counterBloc.eventSink.add(UserCounterAction.Decre);
              },
              icon: Icon(Icons.remove),
            ),

            // 03
            StreamBuilder(
              initialData: 0,
              stream: counterBloc.counterStream,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                );
              },
            ),

            // 02
            IconButton(
              onPressed: () {
                counterBloc.eventSink.add(UserCounterAction.Incre);
              },
              icon: Icon(Icons.add),
            ),
            Spacer(),
            TextButton(
                onPressed: () {
                  counterBloc.eventSink.add(UserCounterAction.Reset);
                },
                child: Text('Reset'.toUpperCase())),
          ],
        ),
      ),
    );
  }
}
