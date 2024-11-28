import 'package:flutter/material.dart';
import 'package:news_app/model/cnn_news_api.dart';
import 'package:news_app/network/net_client.dart';
import 'package:news_app/screen/home_page/widget/carousel.dart';
import 'package:news_app/screen/home_page/widget/item_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexBar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder:(BuildContext context){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color:  Color.fromARGB(150, 215, 213, 213),
                  shape: BoxShape.circle
                ),
                child: 
                IconButton(onPressed: (){}, 
                icon: Icon(Icons.menu,
                )
                )),
             );
            } 
          ) ,
          actions: [
            Container(
                margin: const EdgeInsets.all(10),
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color:  Color.fromARGB(150, 215, 213, 213),
                  shape: BoxShape.circle
                  ),
                child: const Icon(
                 Icons.search_rounded,
                color: Colors.black,
              ),
            ),
          ],
          title: Text("Hot News",style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: false,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Discover",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700
              ),),
              const Text("News from all around the world"),
              const SizedBox(height: 20,),
              Carousel(),
              SizedBox(height: 20,),
              FutureBuilder(future: NetClient().fetchNewsByChannel(newsChannel: indexBar == 0 ? "cnn-news/internasional" : indexBar == 1 ?"cnbc-news/market" : "cnn-news/teknologi"), builder: (context, AsyncSnapshot<CnnNewsApi>snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }else if(snapshot.hasError){
                   return  Center(child: Text(snapshot.error.toString()));
                }else{
                  final news = snapshot.data!.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: news.length,
                    itemBuilder: (context, index){
                    return itemNews(news:news[index]);
                  });
                }
              })
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBar,
          onTap: (value){
            setState(() {
              indexBar = value;
            });
          },
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "News"),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: "Market"),  
          BottomNavigationBarItem(icon: Icon(Icons.desktop_mac_rounded), label: "Technology"),   
      ]),
    );
  }
}

