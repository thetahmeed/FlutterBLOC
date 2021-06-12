  final newsBloc = NewsBloc();
  @override
  void initState() {
    newsBloc.eventSink.add(UserNewsAction.Read);
    super.initState();
  }
