## [플러터(Flutter)로 앱출시까지 6. 리스트뷰로 끝없는 스크롤 만들기](https://www.youtube.com/watch?v=RV1T1KOcCkI&t=4s)

+ ## 변수명 앞에 '_'를 붙이면
  - main.dart 이외의 파일에서 해당 변수에 접근할 수 없게 막아준다.
  - private과 비슷한 느낌
 
+ ## List에 들어오는 자료형 제한하기
  - <자료형>[]
  - 주어진 자료형 외의 자료형은 해당 List에 들어올 수 없게 막아준다.
 
+ ## 전체 코드 살펴보기
``` dart
import 'package:flutter/material.dart'; 
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if(i.isOdd) return Divider(); 
        //홀수일 경우 Divider을 return
        //Divider은 list와 list 사이에 있는 선을 말한다.

        final index = i ~/ 2;
        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      });
  }

  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
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
      title: 'Name Generator',
      home: RandomWords()
    );
  }
}
```

## 코드 분석하기
``` dart
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

//라이브러리를 가져옵니다.
//void main()은 어플리케이션의 시작점입니다.
//Flutter 앱을 실행시킬 때 Myapp 위젯을 루트로 설정합니다.
```

``` dart
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Name Generator',
      home: RandomWords()
    );
  }
}

//Myapp 클래스는 StatelessWidget을 상속받습니다.
//Widget 형식의 MaterialApp을 반환하는 build 매서드를 생성합니다.
//title: 어플리케이션의 제목 설정
//home: 앱이 시작될 때 가장 먼저 표시되는 화면을 RandomWords 위젯으로 설정
```

``` dart
class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}

//RandomWords 클래스는 StatefulWidget을 상속받습니다.
//createState() 매서드는 RandomWordState 객체를 생성하고 반환합니다.
```

``` dart
class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  //_suggestions는 WordPair 객체를 저장할 리스트
  //_biggerFont는 텍스트 스타일을 정의하는 상수(const)


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  //build 매서드는 위젯을 생성하고 반환한다.
  //AppBar은 앱의 상단에 표시되는 제목 표시줄이다.
  //body는 앱의 주요 콘텐츠를 정의하며 _buildSuggestions 매서드를 호출한다.


  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        // i는 0부터 시작하여 1씩 증가합니다.
        // i가 홀수이면 구분선(Divider)을 반환합니다.
        if (i.isOdd) return Divider();
  
        // 실제 데이터 리스트 _suggestions의 인덱스를 계산합니다.
        final index = i ~/ 2;
        // index가 _suggestions의 길이보다 크거나 같으면 새로운 단어 쌍을 추가합니다.
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        // _buildRow 메서드를 호출하여 현재 인덱스에 해당하는 단어 쌍을 표시하는 ListTile 위젯을 반환합니다.
        return _buildRow(_suggestions[index]);
      },
    );
  }

  //ListView.builder을 사용해 스크롤 가능한 리스트를 생성하는 매서드.
  //ListView.builder는 필요할 때마다 아이템을 동적으로 생성한다.
  //_buildRow 매서드를 반환해 리스트의 각 아이템을 생성한다.
  //i는 줄어들지 않음.
  //기본적으로 ListView는 무한 스크롤 페이지를 만들기 위해 사용됨.
  //화면을 위로 올리면 이전에 생성했는 문자들이 보이고, 화면을 내릴 때에만 i가 증가하고, 증가함에 따라 새로운 문자들을 생성하고 표시합니다.


  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  //ListTile은 텍스트와 아이콘을 포함하는 행이다.
  //인수로 받은 pair을 PascalCase로 변환하여 텍스트로 표시한다.
  //style:로 _biggerFont 텍스트 스타일을 적용한다.
}
```
