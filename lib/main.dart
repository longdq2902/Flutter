import 'package:flutter/cupertino.dart';
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
  final _txtTitle = new Container(
    padding: const EdgeInsets.all(10.0),
    child: new Row(
      children: <Widget>[
        new Expanded(child:
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("Dòng số 1 đây nhé", style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                new Text("Dòng số 2 đây nhé",style: new TextStyle(fontSize: 16.0))
              ],
            ),
        ),
        new Text("Dòng số 2 đây nhé",style: new TextStyle(fontSize: 16.0))
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Demo"),
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset('images/tutorialChannel.png', fit: BoxFit.cover),
          _txtTitle,
        ],
      ),
    );
  }

  Widget _buildRow(WordPair wordPair, int index) {
    // this function will build a row of listview
    final ischecked = _selectedWord.contains(wordPair);
    return ListTile(
      leading: new Icon(
        ischecked ? Icons.check_box : Icons.check_box_outline_blank,
        color: Colors.blue,
      ),
      title: new Text(
        wordPair.asUpperCase,
        style: new TextStyle(fontSize: 15.0, color: Colors.blue),
      ),
      onTap: () {
        setState(() {
          if (ischecked) {
            _selectedWord.remove(wordPair);
          } else {
            _selectedWord.add(wordPair);
          }
        });
      },
    );
  }
}
