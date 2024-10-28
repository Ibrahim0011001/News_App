import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

class NewsServices {
 Future<List<NewsArticle>>  getnews()async{
      const String apiKey = '8235d37aea6f4c5b87fedcb6a86265e3';
      try {
         final  response=await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey'));
        if (response.statusCode==200) {
          final List articles=jsonDecode(response.body)['articles'];  
          final List<NewsArticle> article=articles.map((e) => NewsArticle.fromJson(e),).toList();
          return article;
                }
                return [];
      } catch (e) {
        rethrow;
      }
       
               
              
     
      
  }
}