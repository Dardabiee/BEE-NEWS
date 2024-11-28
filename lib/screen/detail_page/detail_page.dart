import 'package:flutter/material.dart';
import 'package:news_app/model/cnn_news_api.dart' as cnnApi;
import 'package:news_app/network/net_client.dart';

class DetailPage extends StatefulWidget {
  final cnnApi.Data news;

  const DetailPage({super.key, required this.news});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int indexBar = 0;
  late final cnnApi.Data news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: NetClient().fetchNewsByChannel(
          newsChannel: indexBar == 0 
          ? "cnn-news/internasional" 
          : "cnbc-news/market",
        ),
        builder: (context, AsyncSnapshot<cnnApi.CnnNewsApi> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            final news = widget.news;
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.black,
                      expandedHeight: 260.0,
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      actions: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(),
                          child: const Icon(
                            Icons.bookmark_border_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(news.image!.large! ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Add other Slivers here if needed
                    SliverList(delegate: SliverChildListDelegate(
                      [
                        // Padding(
                        //   padding: const EdgeInsets.all(10),
                        //   child: ,
                        //   ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            news.title!,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            news.contentSnippet ?? 'Gak ada Konten',
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ),
                      ]
                    ))
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
