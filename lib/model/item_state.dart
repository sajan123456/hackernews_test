import 'package:hackernews/model/comment.dart';
import 'package:hackernews/model/itemdata.dart';

class ItemState {
  final List<NewsData> newsData;
  final List<CommentData> commentData;
  final bool isLoad;

  ItemState(
      {required this.newsData,
      required this.commentData,
      required this.isLoad});

  factory ItemState.initState() {
    return ItemState(newsData: [], commentData: [], isLoad: false);
  }

  ItemState copyWith(
      {final List<NewsData>? newsData,
      final bool? isLoad1,
      final List<CommentData>? commentData1}) {
    return ItemState(
        newsData: newsData ?? this.newsData,
        isLoad: isLoad1 ?? isLoad,
        commentData: commentData1 ?? commentData);
  }
}
