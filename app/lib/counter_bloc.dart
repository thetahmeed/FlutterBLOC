import 'dart:async';

// because we want this type of event from the user
enum UserCounterAction {
  Incre,
  Decre,
  Reset,
}

class CounterBloc {
  // StreamController => The pipe
  // Here is some things that you should cons.
  // sink => To add data to the pipe
  // stream => To get data from the pipe
  // [Here pipe is the media]
  // IMPORTANT: Make sure you have close all the stream controller

  // State StremController
  // 1. StreamController: 'int' is the kind of data that we will exchange
  final _stateStreamController = StreamController<int>(); // [It is single cast]
  // 2. Sink:
  StreamSink<int> get counterSink => _stateStreamController.sink;
  // 3. Stream:
  Stream<int> get counterStream => _stateStreamController.stream;

  // Event StreamController
  final _eventStreamController = StreamController<UserCounterAction>();
  StreamSink<UserCounterAction> get eventSink => _eventStreamController.sink;
  Stream<UserCounterAction> get eventStream => _eventStreamController.stream;

  // We will listen when ever this class is created
  CounterBloc() {
    int _counterIntValue = 0;

    eventStream.listen((event) {
      if (event == UserCounterAction.Incre)
        _counterIntValue++;
      else if (event == UserCounterAction.Decre)
        _counterIntValue--;
      else if (event == UserCounterAction.Reset) _counterIntValue = 0;

      // Passing the data to another streamController
      counterSink.add(_counterIntValue);
    });
  }

  // And here we are closing all the stream controller.
  // And you have to call this method. (We did it on: main.dart => 36)
  void closeTheStreamController() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
