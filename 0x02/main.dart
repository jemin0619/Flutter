import 'package:flutter/material.dart'; 
import 'package:english_words/english_words.dart'; //외부 라이브러리 사용

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
    //final wordPair = WordPair.random(); //랜덤한 단어를 가져옴
    return MaterialApp(
      title: 'Welcome To Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome To Flutter'),
        ),
        body: Center(
          //child: Text(wordPair.asPascalCase), //asPascalCase 대문자로 시작하고 두 단어가 결합될 때 첫 자리를 대문자로 나타내는 형식
          child: RandomWords(),
        ),
      ),
    );
  }
}
