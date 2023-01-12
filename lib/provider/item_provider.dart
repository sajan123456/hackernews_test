import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackernews/model/item_state.dart';
import 'package:hackernews/model/itemdata.dart';
import 'package:hackernews/service/comments_service.dart';
import 'package:hackernews/service/news_service.dart';

final newsProvider = StateNotifierProvider<NewsProvider, ItemState>(
  (ref) => NewsProvider(ItemState.initState()),
);

class NewsProvider extends StateNotifier<ItemState> {
  NewsProvider(super._state) {
    getNewsData();
  }

  Future<void> getNewsData() async {
    try {
      state = state.copyWith(isLoad1: true);
      final response = await NewsService().getData();

      state = state.copyWith(newsData: [...state.newsData, ...response]);
      state = state.copyWith(isLoad1: false);
    } catch (err) {
      print('$err');
    }
  }
}
