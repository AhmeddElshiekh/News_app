class NewsModel{
  String? name;
  String? image;
  String? description;
  final String date;
  final String url;



  NewsModel(   {required this.url, required this.date,required this.description,required this.name,required this.image});

}