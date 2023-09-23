import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 4),
      child: Container(
        width: 230,
        height: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(15),
            image: DecorationImage(
                image: AssetImage(model.image), fit: BoxFit.cover)),
        child: Text(
          model.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
