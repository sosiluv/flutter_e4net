import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e4net_1/learn_flutter/form_example.dart';
import 'package:flutter_e4net_1/learn_flutter/posts.dart';
import 'package:flutter_e4net_1/learn_flutter/simple_game.dart';
import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';

main(){
  runApp(MyMaterial());
}

class MyMaterial extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e4net',
      home: MyStateless(),
    );
  }
}


class MyStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Test App'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('text1'),
              Text('text2'),
              Text('text3'),
              ElevatedButton(
                onPressed: (){
                  print('posts tap!');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Posts();
                      },
                    ),
                  );
                },
                child: Text('posts'),
                style: ElevatedButton.styleFrom(
                    elevation: 1,
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    onPrimary: Colors.red,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var res = await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Alert Diaolog Test'),
                            content: Text('MyContent'),
                            actions: [
                              TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text('취소하기')
                              ),
                              TextButton(
                                  onPressed: (){
                                    Navigator.pop(context,'Result');
                                  },
                                  child: Text('제출')
                              )
                            ],
                          );
                        },
                      );
                      print('Alert Dialog 결과값 : $res');
                    },
                    child: Text('AlertDialog'),
                  ),
                  TextButton(
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              duration: Duration(seconds: 3),
                              content: Text('imSnackBar')
                          ),
                        );
                      },
                      child: Text('snackBar')
                  ),
                  FloatingActionButton(
                    onPressed: (){
                      // Fluttertoast.showToast(
                      //   msg: 'This is Center Short Toast',
                      //   toastLength: Toast.LENGTH_LONG,
                      //   gravity: ToastGravity.BOTTOM,
                      //   backgroundColor: Colors.grey,
                      //   textColor: Colors.black,
                      //   fontSize: 16.0
                      // );
                    },
                    child: Text('Toast'),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return FormExam();
                      }),
                    );
                  },
                  child: Text('FormExample')
              ),
              IconButton(
                  icon: Icon(Icons.videogame_asset),
                  onPressed: () async {
                    var res = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SimpleGame();
                      }),
                    );
                    print('asdfasdf $res');
                    SystemChrome.setPreferredOrientations(DeviceOrientation.values.toList());
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
