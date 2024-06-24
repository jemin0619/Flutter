## [플러터(Flutter)로 앱출시까지 5. 앱에 라이브러리 적용하기](https://www.youtube.com/watch?v=D096ovUxuh4)

+ ## 앱에 라이브러리 적용시키기
  - pubspec에서 필요한 라이브러리를 찾을 수 있다.
  - pubspec.yaml 파일의 dev_dependencies에 추가할 파일을 넣으면 된다.
  - [english_words 라이브러리](https://pub.dev/packages/english_words)
``` pubspec.yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  english_words: ^4.0.0
```

+ ## StatefulWidget과 StatelessWidget
  - StatelessWidget : 변수에 변화가 없음 (화면이 정적임)
  - StatefulWideget : 변수에 변화가 존재 (화면이 움직임)
  - StatelessWidget이 기능이 더 적지만 성능이 뛰어나다.
 
+ ## english_words 사용해보기
``` main.dart
import 'package:flutter/material.dart'; 
import 'package:english_words/english_words.dart'; //외부 라이브러리 사용

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final wordPair = WordPair.random(); //랜덤한 단어를 가져옴
    return MaterialApp(
      title: 'Welcome To Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome To Flutter'),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase),
          //asPascalCase 대문자로 시작하고 두 단어가 결합될 때 첫 자리를 대문자로 나타내는 형식
        ),
      ),
    );
  }
}
```

+ ## StatefulWidget 사용하기
``` main.dart
import 'package:flutter/material.dart'; 
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

//StatelessWidget은 화면에 표시된 것들 (변수)가 변하지 않는다.
//StatefulWidget을 만드려면 클래스 두 개를 만들어야 한다.

class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Welcome To Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome To Flutter'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}
```
