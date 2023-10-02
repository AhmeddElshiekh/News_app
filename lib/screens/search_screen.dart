import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_text_form_filed.dart';
import 'package:news_app/widgets/sliver_list_search_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomFormFiled(
                  label: 'Search',
                  controller: searchController,
                  onSubmit: (val) {
                    setState(() {

                    });
                  },
                ),
              ),
              if(searchController.text.isNotEmpty )
                ListSearchItem(search: searchController.text)
            ],
          ),
        )
    );

  }
}
