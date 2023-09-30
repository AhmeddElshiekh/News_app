import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.model});
  final NewsModel model ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
                image:  DecorationImage(
                    image: NetworkImage(
                        model.image ?? 'https://t3.ftcdn.net/jpg/01/91/95/30/360_F_191953033_gehQATeDoh5z6PyRDbeKyBZuS83CjMEF.jpg'
                    ), fit: BoxFit.cover)),

          ),
          const SizedBox(height: 12,),
           Text( model.name ?? '',maxLines: 2,style: const TextStyle(
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),),
          const SizedBox(height: 12,),
           Text(model.description ?? '',maxLines: 2,style: const TextStyle(
            color: Colors.grey,
            overflow: TextOverflow.ellipsis,
          ),),
          Text(model.date,style: const TextStyle(
            color: Colors.grey,
          ),),
        ],
      ),
    );
  }
}
