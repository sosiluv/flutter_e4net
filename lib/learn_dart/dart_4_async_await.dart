Future<int> test(){
  return Future.delayed(Duration(seconds: 2), (){
    // print('hi');
    return 1;
  });
}

main() async {
  print(await test());
}

