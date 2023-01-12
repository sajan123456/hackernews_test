import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hackernews/provider/comment_provider.dart';
import 'package:hackernews/provider/item_provider.dart';
import 'package:hackernews/screens/comment_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Hacker News'))),
        body: Consumer(
          builder: (context, ref, child) {
            final data = ref.watch(newsProvider);

            return data.isLoad
                ? Center(child: CircularProgressIndicator())
                : Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: data.newsData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  String urlData = data.newsData[index].url!;

                                  ref
                                      .read(commentProvider.notifier)
                                      .getCommentData(
                                          data.newsData[index].kids!);
                                  print(data.newsData[index].kids!);
                                  Get.to(CommentWidget(
                                    urlData: urlData,
                                  ));
                                },
                                child: Card(
                                    color: Color.fromARGB(245, 232, 235, 236),
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //Title Text
                                          Text(
                                            data.newsData[index].title == null
                                                ? 'No data'
                                                : data.newsData[index].title!,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          //Details
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'By: ' +
                                                            data.newsData[index]
                                                                .by! ==
                                                        null
                                                    ? 'no data '
                                                    : data.newsData[index].by!,
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                              Text(
                                                data.newsData[index].kids!
                                                        .length
                                                        .toString() +
                                                    ' comments',
                                                style: TextStyle(
                                                    color: Colors.lightBlue),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
