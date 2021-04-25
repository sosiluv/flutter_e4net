main(){
  //타입추론이 가능

  var imvar ='imvar';
  // imvar = 2;


  dynamic foo = 'im foo';
  foo = 1;

  //런타임시 결정
  final bar ='';
  // bar = '2';

  //컴파일타임시 결정
  const imcon ='';
  // imcon = '3';
}