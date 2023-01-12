import 'package:dio/dio.dart';
import 'package:hackernews/model/itemdata.dart';

class NewsService {
  Future<List<NewsData>> getData() async {
    final dio = Dio();
    List<NewsData> response = [];
    try {
      final responseId = await dio.get(
          'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty');
      // print(responseId);

      final idList = responseId.data;
      for (int i = 1; i <= 8; i++) {
        final id = idList[i];

        final dataDetails = await dio.get(
            'https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty');

        // print(dataDetails);

        Map<String, dynamic> map = dataDetails.data;
        final newsData = NewsData.fromJson(map);
        response.add(newsData);
      }
      return response;
    } on DioError catch (err) {
      throw ('err');
    }
  }
}
