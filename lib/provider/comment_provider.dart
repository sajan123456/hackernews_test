import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackernews/model/item_state.dart';
import 'package:hackernews/model/itemdata.dart';
import 'package:hackernews/service/comments_service.dart';
import 'package:hackernews/service/news_service.dart';

final commentProvider = StateNotifierProvider<CommentProvider, ItemState>(
  (ref) => CommentProvider(ItemState.initState()),
);

class CommentProvider extends StateNotifier<ItemState> {
  CommentProvider(super._state) {
    getCommentData([]);
  }

  Future<void> getCommentData(List getKid) async {
    try {
      state = state.copyWith(isLoad1: true);
      final response = await CommentService().getData(getKid);

      state = state.copyWith(commentData1: [...response]);
      state = state.copyWith(isLoad1: false);
      // print(response);
    } catch (err) {
      print('$err');
    }
  }
}
