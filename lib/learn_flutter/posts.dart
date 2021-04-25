import 'package:flutter/material.dart';
import 'package:flutter_e4net_1/learn_flutter/post_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class JsonTest{
  final int userId;
  final int id;
  final String title;
  final String body;
  bool isFav = false;

  JsonTest({this.userId, this.id, this.title, this.body});

  factory JsonTest.fromJson(Map<String,dynamic> json){
    return JsonTest(userId: json['userId'],body: json['body'],
        title: json['title'],id: json['id']);
  }
}


class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<JsonTest> myLists = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    print('initState');
    jsonHandler();
  }

  jsonHandler() async {

    myLists.clear();
    setState(() {
      isLoading = true;
    });
    var uri = Uri.https('jsonplaceholder.typicode.com','/posts');
    var response = await http.get(uri);
    if(response.statusCode == 200){
      print('body : ${response.body}, type: ${response.body.runtimeType}');
      var decoded = convert.jsonDecode(response.body);
      print('decoded = $decoded \n type : ${decoded.runtimeType}');
      if(decoded is List){
        decoded.forEach((val) {
          JsonTest json = JsonTest.fromJson(val);
          myLists.add(json);
        });
        print(myLists.length);
        setState(() {
          isLoading = false;
        });
      } else {
        JsonTest json = JsonTest.fromJson(decoded);
        print('json> $json, json type> ${json.runtimeType}');
      }
    } else {
      print('응답실패');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Container(
        child: isLoading ? Center(
          child: CircularProgressIndicator(),
        ):ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: myLists.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return PostDetail(myPost: myLists[index]);
                    },),
                );
              },
              trailing: IconButton(
                icon: myLists[index].isFav ? Icon(Icons.favorite): Icon(Icons.favorite_border),
                onPressed: (){
                  setState(() {
                    myLists[index].isFav = !myLists[index].isFav;
                  });
                },
              ),
              title: Text(
                myLists[index].title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              subtitle: Text(
                myLists[index].body,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            );
          },
        ),
      ),
    );
  }
}
