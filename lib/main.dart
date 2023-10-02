import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cache_helper.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/screens/news_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  dynamic isLight = CacheHelper.getSaveData(key: 'mode');
  print(isLight);
  runApp(MyApp(
    isLight: isLight,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLight});

  final dynamic isLight;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      NewsCubit()
        ..changeMode(fromShared: isLight),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: NewsCubit.get(context).isLight == true ? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
