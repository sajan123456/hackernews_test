import 'package:dio/dio.dart';
import 'package:hackernews/model/comment.dart';
import 'package:hackernews/model/itemdata.dart';

class CommentService {
  List<CommentData> response = [];
  Future<List<CommentData>> getData(List kid) async {
    int test = kid[0];

    List<CommentData> response = [];
    final dio = Dio();
    try {
      final dataDetails = await dio.get(
          'https://hacker-news.firebaseio.com/v0/item/$test.json?print=pretty');
      print(dataDetails);
      Map<String, dynamic> map = dataDetails.data;
      final commentData = CommentData.fromJson(map);
      response.add(commentData);

      return response;
    } catch (err) {
      throw ('err');
    }
  }
}
