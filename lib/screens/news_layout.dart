import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/change_theme_cubit/change_them_cubit.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:news_app/widgets/change_mode.dart';
import 'package:news_app/widgets/list_item_category.dart';
import 'package:news_app/widgets/network_connectivity.dart';
import 'package:news_app/widgets/sliver_list_news_item.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({super.key});

  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {

  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';

  @override
  void initState() {
    super.initState();
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      if (kDebugMode) {
        print('source $_source');
      }

      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string =
          _source.values.toList()[0] ? 'You are connected to the Internet, you can scroll or search now' : 'Mobile: Offline';
          break;
        case ConnectivityResult.wifi:
          string =
          _source.values.toList()[0] ? 'You are connected to the Internet, you can scroll or search now' : 'WiFi: Offline';
          break;
        case ConnectivityResult.none:
        default:
          string = 'You are not connected to the Internet, please check your network';
      }
      setState(() {});

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor:string == 'You are connected to the Internet, you can scroll or search now' ? Colors.green : Colors.red ,
          content: Text(
            string,
            style:  const TextStyle(fontSize: 20, ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemCubit, ChangeThemState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: RichText(
                text: TextSpan(
                  text: 'News',
                  style: TextStyle(
                      color: ChangeThemCubit.get(context).isLight == true
                          ? Colors.white
                          : Colors.black,
                      fontSize: 24),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Cloud', style: TextStyle(color: Colors.yellow)),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ));
                      },
                      icon: const Icon(Icons.search)),
                ),
                const ChangeMode(),
                IconButton(
                    onPressed: () {
                      // NewsCubit.get(context).showMemberMenu(context);
                    },
                    icon: const Icon(Icons.menu))
              ],
            ),
            body: const Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 12),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: ListItemCategory(),
                  ),
                  ListNewsItemAndCircleIndicator(
                    category: 'General',
                  ),
                ],
              ),
            ));
      },
    );
  }


  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }
}
