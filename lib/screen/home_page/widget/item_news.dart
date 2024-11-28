import 'package:flutter/material.dart';
import 'package:news_app/model/cnn_news_api.dart' as cnnApi;
import 'package:news_app/screen/detail_page/detail_page.dart';

class itemNews extends StatelessWidget {
  const itemNews({
    super.key, required this.news, 
  });
  final cnnApi.Data news;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(
          news: news,
        )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 360,
          decoration: BoxDecoration(
            // color: Colors.black
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(news.image!.small!.toString())),
                SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
            news.isoDate!,
            style: TextStyle(
              fontSize: 8,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            news.title!,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            news.contentSnippet!,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
