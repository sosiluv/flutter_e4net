import 'package:flutter/material.dart';
import 'package:flutter_e4net_1/learn_flutter/posts.dart';

class PostDetail extends StatelessWidget {
  final JsonTest myPost;
  PostDetail({@required this.myPost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('id : ${myPost.id}'),
              Divider(),
              Text('userId : ${myPost.userId}'),
              Divider(),
              Text('title : ${myPost.title}'),
              Divider(),
              Text('body :\n${myPost.body}'),
            ],
          ),
        ),
      ),
    );
  }
}
