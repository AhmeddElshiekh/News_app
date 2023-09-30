import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_model.dart';

class NewsService{

  Dio dio = Dio();

  Future<List<NewsModel>> getHttp() async {
    Response response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=0f8a16d0c8d342a59ed04f4fc8946654&category=general');
    Map<String , dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<NewsModel> newsList = [];
    for(var article in articles ){
      NewsModel newsModel = NewsModel(description: article['description'], name: article['title'], image: article['urlToImage'], date: DateFormat('yyyy-MM-dd  h:m').format(DateFormat("yyyy-MM-ddTh:m:sz").parse(article['publishedAt'])));
      newsList.add(newsModel);
      
    }
    return newsList;
  }
}