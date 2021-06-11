import 'package:app/practiceOne/counter_bloc.dart';
import 'package:flutter/material.dart';

class HomePageOne extends StatefulWidget {
  const HomePageOne({Key? key}) : super(key: key);

  @override
  _HomePageOneState createState() => _HomePageOneState();
}

class _HomePageOneState extends State<HomePageOne> {
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
        title: Text('Counter App with BloC'),
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
            // [Here is the place where we are listening]
            StreamBuilder(
              initialData: 0,
              stream: counterBloc.counterStream,
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return Text(
                    '${snapshot.data}',
                  );
                if (snapshot.hasError) return Text(snapshot.error.toString());
                if (snapshot.connectionState == ConnectionState.active)
                  return Text('Active');
                else
                  return Text('No data found');
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
              child: Text(
                'Reset'.toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
