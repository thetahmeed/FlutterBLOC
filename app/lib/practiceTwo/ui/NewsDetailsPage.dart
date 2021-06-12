import 'package:app/practiceTwo/model/articles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({
    Key? key,
    required this.articles,
    required this.time,
  }) : super(key: key);

  final Articles articles;
  final time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  articles.urlToImage.toString(),
                  //fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Text(
                articles.title.toString(),
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 8),
              Text(
                time,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Text(
                articles.description.toString() +
                    '\n\n' +
                    articles.content.toString(),
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
              GestureDetector(
                onTap: () async {
                  var _url = articles.url.toString();
                  await canLaunch(_url)
                      ? await launch(_url)
                      : throw 'Could not launch $_url';
                },
                child: Text(
                  'Continue reading...',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
