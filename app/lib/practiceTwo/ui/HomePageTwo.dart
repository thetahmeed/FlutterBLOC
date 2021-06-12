  final newsBloc = NewsBloc();
  @override
  void initState() {
    newsBloc.eventSink.add(UserNewsAction.Read);
    super.initState();
  }
    return StreamBuilder<List<Articles>?>(
      stream: newsBloc.newsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var article = snapshot.data![index];
                var time = DateFormat.yMMMd().format(DateTime.now());

                return Container(
                  height: 100,
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              article.urlToImage.toString(),
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(time.toString()),
                            Text(
                              article.title.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              article.description.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Got an error...'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
