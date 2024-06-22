import 'dart:io';
import 'dart:math';
import 'calculator.dart';

void main(){
  bool typeBool = false;
  print(typeBool); //OUT: false


  int typeInt = 17;
  print(typeInt); //OUT: 17
  print(typeInt ~/ 5); //OUT: 3
  //int를 나눌 시 ~/ 사용


  double typeDouble = 3.141592;
  print(typeDouble); //OUT: 3.141592
  print(typeDouble / 2); //OUT: 1.570796
  print(typeDouble ~/ 2); //OUT: 1


  String typeString = "김제민";
  print(typeString); //OUT: 김제민


  List typeList = [0,1,2,3,4];
  print(typeList); //OUT: [0, 1, 2, 3, 4]
  print(typeList[1]); //OUT: 1

  for(int i=0;i<typeList.length;i++){
    stdout.write(typeList[i]);
    stdout.write(" ");
  } print(""); //OUT: 0 1 2 3 4

  for(var val in typeList){
    stdout.write(val);
    stdout.write(" ");
  } print(""); //OUT: 0 1 2 3 4

  stdout.writeAll(typeList,' '); //OUT: 0 1 2 3 4
  print("");


  Map typeMap = { //Key와 Value를 가짐 (C++과 동일)
    'name' : '김제민',
    'age' : 19,
    'Learning' : 'Dart',
    'Handle' : 'jemin0619'
  };
  print(typeMap); //OUT: {name: 김제민, age: 19, Learning: Dart, Handle: jemin0619}
  print(typeMap.keys); //OUT: (name, age, Learning, Handle)
  print(typeMap.values); //OUT: (김제민, 19, Dart, jemin0619)
  print(typeMap['name']); //OUT: 김제민
 

  var typeVar = 1977;
  //typeVar = 'Test';
  //Error) 처음 생성 시 넣은 Data Type으로 생성된다.
  print(typeVar); //OUT: 1977


  // => (람다식)
  List ages = [11,10,12];
  var filteredAGes = ages.where((age) => age>10);
  print(filteredAGes); //OUT: (11,12)
  filteredAGes.forEach(print); //OUT: 11 \n 12
  ages.where((age) => age>10).forEach(print); //OUT: 11 \n 12

  var flybyObjects = ['yourturn', 'myturn', 'start'];
  flybyObjects.where((name) => name.contains('turn')).forEach(print); //OUT yourturn \n myturn


  //import한 함수 사용
  int res1 = add(3,4);
  int res2 = sub(max(3,4),min(3,4));
  int res3 = multiply(3, 4);
  print('덧셈: $res1\n뺄셈: $res2\n곱셈: $res3');
}