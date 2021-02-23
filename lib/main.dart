import 'package:bayrak_quiz_uygulamasi/QuizEkrani.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("QUiZE HOŞGELDİNİZ",
                style: Theme.of(context).textTheme.headline4.apply(fontWeightDelta: 3)),
            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                child: Text("BAŞLA", style: Theme.of(context).textTheme.headline6),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizEkrani()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
