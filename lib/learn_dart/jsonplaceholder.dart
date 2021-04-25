import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class JsonTest{
  final int userId;
  final int id;
  final String title;
  final String body;

  const JsonTest({this.userId, this.id, this.title, this.body});

  factory JsonTest.fromJson(Map<String,dynamic> json){
    return JsonTest(userId: json['userId'],body: json['body'],
        title: json['title'],id: json['id']);
  }
}

main() async {
  //https://jsonplaceholder.typicode.com/posts
  var uri = Uri.https('jsonplaceholder.typicode.com','/posts');

  var response = await http.get(uri);

  if(response.statusCode == 200){
    print('body : ${response.body}, type: ${response.body.runtimeType}');
    var decoded = convert.jsonDecode(response.body);
    print('decoded = $decoded \n type : ${decoded.runtimeType}');
    if(decoded is List){
      decoded.forEach((val) {
        JsonTest json = JsonTest.fromJson(val);
        print('json> $json, json type> ${json.runtimeType}');
      });
    } else {
      JsonTest json = JsonTest.fromJson(decoded);
      print('json> $json, json type> ${json.runtimeType}');
    }
  } else {
    print('응답실패');
  }
}