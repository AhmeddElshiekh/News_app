import 'package:flutter/material.dart';
import 'package:news_app/widgets/list_item_category.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:RichText(
          text: const TextSpan(
            text: 'News',style: TextStyle(
            color: Colors.black,
            fontSize: 24
          ),
            children: <TextSpan>[
              TextSpan(text: 'Cloud', style: TextStyle(color: Colors.yellow)),
            ],
          ),
        )
      ),
      body: const Column(
        children: [
          ListItemCategory(),
        ],
      ),
    );
  }
}
