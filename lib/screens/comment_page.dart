import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackernews/model/itemdata.dart';
import 'package:hackernews/provider/comment_provider.dart';
import 'package:hackernews/provider/item_provider.dart';

class CommentWidget extends StatelessWidget {
  String urlData;
  CommentWidget({required this.urlData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('Hacker News'))),
        body: Consumer(
          builder: (context, ref, child) {
            final comentData = ref.watch(commentProvider);
            return Container(
              padding: EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: comentData.commentData.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Comments',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          )),
                        )),
                        Center(
                          child: Text(
                            comentData.commentData[index].text == null
                                ? 'no data '
                                : comentData.commentData[index].text!,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
