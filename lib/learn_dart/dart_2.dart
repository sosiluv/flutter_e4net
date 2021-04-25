class Person{
  String name;
  int age;
  Person({this.name, this.age});
  Person.myNew([this.name, this.age]);
  Person.redict(String name, int age): this.myNew(name, age);

  factory Person.fromJson(Map<String, dynamic> json){
    return Person(age: json['age'],name: json['name']);
  }
  anoymousCallback(Function callback){
    if(callback != null) callback();
  }
}

main(){
  Person p2 = Person(name: '임성',age: 11);
  Person p3 = Person();

}