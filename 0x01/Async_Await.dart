//asynchronous: 비동기의
//만약 return된 int 등의 값을 받고 싶다면 아래 main을 저런 식으로 가공해서 async와 await 키워드를 써줘야 한다.
//이럴 경우 값이 반환될때까지 기다렸다가 1과 finish를 출력한다.


import 'dart:io';

const oneSecond = Duration(seconds: 1);

Future<int> printWithDelay() async{
  await Future.delayed(oneSecond); //기다려라
  print(DateTime.timestamp());

  return 1;
}


//파일 생성, 탐색엔 시간이 걸릴 수 있기에 async, await을 사용한다.
Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print(
            'File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}

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


//Iterable은 List의 부모 클래스라고 볼 수 있다.
Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(oneSecond);
    yield '${craft.name} flies by $object';
  }
}


void main() async {
  print(DateTime.timestamp());
  print(await printWithDelay());
  print('Finished');
  //----OUTPUT----
  //2024-06-23 02:08:02.608481Z
  //2024-06-23 02:08:03.627392Z
  //1
  //Finished

  Spacecraft spacecraft = Spacecraft('제민호', DateTime(2006,06,19));
  Stream<String> result = report(spacecraft, ['ABC','DEF','EFG']);

  //방법 1 ) 종료됨이 나중에 출력됨
  await for(String s in result){
    print(s);
  }

  //방법 2 ) 종료됨이 먼저 출력됨
  result.listen((s){
    print(s);
  });

  print('종료됨');
}