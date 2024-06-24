import 'package:flutter/material.dart'; 
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

//변수명 앞에 _을 붙이면 main.dart 이외의 파일에서 사용할 수 없다.
//<WordPair>[] 은 List내에 WordPair 형의 자료만 들어올 수 있도록 한 것이다.

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
