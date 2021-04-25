main(){
  print('Hello world');

  int cnt = 1;
  String str = 'String';
  print('$cnt ${str.toUpperCase()}');

  List myList = ['1', '2', '3'];
  print(myList);
  List myList2 = [...myList, '4'];
  print(myList2);
  Map<String, String> myMap = {
    'first':'1',
    'second':'1',
  };
  print(myMap['first']);

}