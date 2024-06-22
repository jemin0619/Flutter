//강의에서는 버전이 낮아서 그런지 변수에 아무것도 들어가지 않은 상태일 때 NULL로 처리되었는데 여기선 안됨.
//항상 값이 들어가 있어야 동작함.

class Person{
  int age = -1;
  String name = 'NULL';

  Person(this.age, this.name);

  Person.age(int age) : this(age,'길동');

  void study(){
    print('$name은/(는) 공부중입니다...');
  }
}

void main(){
  Person person = Person(19, '김제민');
  print('이름은 ${person.name}, 나이는 ${person.age}');
  person.study();

  Person friend = Person.age(31);
  print('${friend.age}, ${friend.name}');
  
}