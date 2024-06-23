// ?는 Null 값을 허용한다는 연산자입니다.
// 변수 타입에 ?가 붙어있으면 해당 변수는 Null 값을 가질 수 있습니다.
// 예를 들어, DateTime?는 DateTime 객체이거나 Null일 수 있습니다.

// get 키워드는 C#에서 사용하던 게터 함수와 유사합니다.
// int? get launchYear은 launchDate가 null이면 null을 반환하고,
// 그렇지 않으면 launchDate의 year 속성을 반환하는 게터 함수입니다.

class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate);

  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Orbiter extends Spacecraft { //super은 부모의 생성자를 호출하겠다는 키워드이다.
  num altitude;
  Orbiter(super.name, DateTime super.launchDate, this.altitude);

  @override
  void describe(){
    super.describe();
    print('altitude: $altitude');
  }
}

mixin Piloted { //Mixin에서는 생성자를 만들 수 없습니다(주의).
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, super.launchDate);
}

class MockSpaceship implements Spacecraft{
  @override
  late String name; //나중에 name이 초기화될것임을 보장 (non-nullable)
  
  @override
  DateTime? launchDate;

  MockSpaceship(this.name, this.launchDate);

  @override
  void describe() {
    // TODO: implement describe
  }

  @override
  int? get launchYear => throw UnimplementedError();
}

abstract class Descriable{
  void describe(); //자식 클래스에서 알아서 구현해 써라
  void describeWithEmphasis(){
    print('========');
    describe();
    print('========');
  }
}

class Unit extends Descriable{ //extends는 상속의 개념으로 부모 클래스의 속성과 매서드를 받아옴
  @override
  void describe() {
    // TODO: implement describe
    print('unit');
  }
}

class Animal implements Descriable{ //implements는 부모 클래스의 모든 것을 다시 구현해야 함
  @override
  void describe() {
    print('describe');
  }

  @override
  void describeWithEmphasis() {
    print('describeWithEmphasis');
  }

}

void main(){
  Spacecraft Voyager1 = Spacecraft('Voyager1', DateTime(1977, 9, 5));
  Voyager1.describe();
  //-----OUTPUT-----
  //Spacecraft: Voyager1
  //Launched: 1977 (46 years ago)


  Spacecraft Voyager2 = Spacecraft.unlaunched('Voyager2');
  Voyager2.describe();
  print(Voyager2.launchYear);
  print(Voyager1.launchYear);
  //-----OUTPUT-----
  //Spacecraft: Voyager2
  //Unlaunched
  //null
  //1977
  

  Orbiter Voyager3 = Orbiter('Voyager3', DateTime.now(), 1030);
  Voyager3.describe();
  print(Voyager3.altitude);
  //-----OUTPUT-----
  //Spacecraft: Voyager3
  //Launched: 2024 (0 years ago)
  //altitude: 1030
  //1030


  //부모는 자식의 인스턴스를(Type을) 받을 수 있지만 자식은 부모의 인스턴스를 받을 수 없다.
  //Orbiter은 Spacecraft를 상속받았기에 Spacecraft의 인스턴스를 Orbiter을 통해 생성할 수 있다.
  //부모가 자식의 인스턴스를 받았는데, 부모가 아닌 자식의 오버라이딩된 describe가 호출된다.
  Spacecraft Voyager4 = Orbiter('Voyager4', DateTime.now(), 1); 
  Voyager4.describe();
  //-----OUTPUT-----
  //Spacecraft: Voyager4
  //Launched: 2024 (0 years ago)
  //altitude: 1


  PilotedCraft Voyager5 = PilotedCraft('Voyager5', DateTime.now());
  Voyager5.describe();
  Voyager5.describeCrew();
  //-----OUTPUT-----
  //Spacecraft: Voyager5
  //Launched: 2024 (0 years ago)
  //Number of astronauts: 1


  MockSpaceship Voyager6 = MockSpaceship('Voyager6', DateTime.now());
  print(Voyager6.name);
  //-----OUTPUT-----
  //Voyager6


  Unit unit = Unit();
  unit.describe();
  unit.describeWithEmphasis();
  //-----OUTPUT-----
  //unit
  //========
  //unit
  //========



  Animal animal = Animal();
  animal.describe();
  animal.describeWithEmphasis();
  //-----OUTPUT-----
  //describe
  //describeWithEmphasis
}