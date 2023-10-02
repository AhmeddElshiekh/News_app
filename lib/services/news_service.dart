import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

class NewsService{

  Dio dio = Dio();

  Future<List<NewsModel>> getHttp({required String category }) async {
    Response response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=0f8a16d0c8d342a59ed04f4fc8946654&category=$category');
    Map<String , dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<NewsModel> newsList = [];
    for(var article in articles ){
      NewsModel newsModel = NewsModel.fromJson(article);
      newsList.add(newsModel);

    }
    return newsList;
  }

  Future<List<NewsModel>> getHttpSearch({required String search}) async {
    Response response = await dio.get('https://newsapi.org/v2/everything?q=$search&apiKey=0f8a16d0c8d342a59ed04f4fc8946654');
    Map<String , dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<NewsModel> newsList = [];
    for(var article in articles ){
      NewsModel newsModel = NewsModel.fromJson(article);
      newsList.add(newsModel);

    }
    return newsList;
  }
}