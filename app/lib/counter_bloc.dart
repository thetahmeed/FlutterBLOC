import 'dart:async';

class CounterBloc {
  // StreamController => [No one knows]
  // Here is some things that you should cons.
  // sink => To add data to the pipe
  // stream => To get data from the pipe
  // [Here pipe is the media]

  // 1. StreamController: 'int' is the kind of data that we will exchange
  final _streamController = StreamController<int>();

  // 2. Sink:
  StreamSink<int> get counterSink => _streamController.sink;

  // 3. Stream:
  Stream<int> get counterStream => _streamController.stream;
}
