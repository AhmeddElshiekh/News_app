import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';

class ChangeMode extends StatelessWidget {
  const ChangeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 12),
          child: IconButton(onPressed: () {
            NewsCubit.get(context).changeMode();
          },
              icon: NewsCubit.get(context).isLight == true ?  const Icon( Icons.dark_mode):const Icon( Icons.light_mode,color: Colors.yellow),
        ),
        );
      },
    );
  }
}
