import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 22),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
                image: const DecorationImage(
                    image: AssetImage('assets/technology.jpeg'), fit: BoxFit.cover)),

          ),
          const SizedBox(height: 12,),
          const Text('hello every one my name is ahmed i am a flutter developer hello every one my name is ahmed i am a flutter developer ',maxLines: 2,style: TextStyle(
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),),
          const SizedBox(height: 12,),
          const Text('hello every one my name is ahmed i am a flutter developer hello every one my name is ahmed i am a flutter developer ',maxLines: 2,style: TextStyle(
            color: Colors.grey,
            overflow: TextOverflow.ellipsis,
          ),),
        ],
      ),
    );
  }
}
