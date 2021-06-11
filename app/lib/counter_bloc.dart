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

  // State StremController
  // 1. StreamController: 'int' is the kind of data that we will exchange
  final _stateStreamController = StreamController<int>();
  // 2. Sink:
  StreamSink<int> get counterSink => _stateStreamController.sink;
  // 3. Stream:
  Stream<int> get counterStream => _stateStreamController.stream;

  // Event StreamController
  final _eventStreamController = StreamController<UserCounterAction>();
  StreamSink<UserCounterAction> get eventSink => _eventStreamController.sink;
  Stream<UserCounterAction> get eventStream => _eventStreamController.stream;
}
