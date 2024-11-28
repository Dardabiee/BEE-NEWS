import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/cnn_news_api.dart';

class NetClient {
  final String url = "https://berita-indo-api-next.vercel.app/api/";
  Future<CnnNewsApi>fetchNewsByChannel({required String newsChannel})async{
    final endPoint = newsChannel;
    final response = await http.get(Uri.parse(url + endPoint));
    try{
      if(response.statusCode == 200){
        return CnnNewsApi.fromJson(jsonDecode(response.body));
      }else{
        throw Exception("Failed to load data");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
}