enum UserNewsAction {
  Read,
}
  final _stateStreamController = StreamController<List<Articles>?>();
  StreamSink<List<Articles>?> get _newsSink => _stateStreamController.sink;
  Stream<List<Articles>?> get newsStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<UserNewsAction>();
  StreamSink<UserNewsAction> get eventSink => _eventStreamController.sink;
  Stream<UserNewsAction> get _eventStream => _eventStreamController.stream;
