import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomEnglishWords(),
    );
  }
}

class RandomEnglishWords extends StatefulWidget {
  @override
  RandomEnglishWordsState createState() => RandomEnglishWordsState();
}

class RandomEnglishWordsState extends State<RandomEnglishWords> {
  final _words = <WordPair>[];
  final _selectedWord = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Demo"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushToSelected)
        ],
      ),
      body: new ListView.builder(itemBuilder: (context,index){
        //index = 0,1,2,3 là row của listview
        if(index >= _words.length){
          _words.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_words[index], index);
      }),
    );
  }

  _pushToSelected(){
    //print("You just press to button !");
    final PageRoute pageRoute = new MaterialPageRoute(builder: (context){
      final listTitles = _selectedWord.map((wordPair){
        return new ListTile(
          title: new Text(
            wordPair.asUpperCase,
            style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          )
        );
      });

      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Selected Words"),
        ),
        body: new ListView(
          children: listTitles.toList(),
        ),
      );
    });
    Navigator.of(context).push(pageRoute);

  }

  Widget _buildRow (WordPair wordPair, int index) {
    // this function will build a row of listview
    final ischecked = _selectedWord.contains(wordPair);
    return ListTile(
      leading: new Icon(ischecked ? Icons.check_box : Icons.check_box_outline_blank, color: Colors.blue,),
      title: new Text(
        wordPair.asUpperCase,
        style: new TextStyle(fontSize: 15.0, color: Colors.blue),
      ),
      onTap: (){
          setState(() {
            if(ischecked) {
              _selectedWord.remove(wordPair);
            }else {
              _selectedWord.add(wordPair);
            }
          });
      },
    );
  }

}



