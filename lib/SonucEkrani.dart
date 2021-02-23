import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SonucEkrani extends StatefulWidget {
  int dogruSayisi;

  SonucEkrani({this.dogruSayisi});
  @override
  _SonucEkraniState createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sonuc Ekrani"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${widget.dogruSayisi} DOĞRU \n${5 - widget.dogruSayisi} YANLIŞ",
                  style: Theme.of(context).textTheme.headline2.apply(fontWeightDelta: 2)),
              Text("%${(widget.dogruSayisi * 20).toInt()} BAŞARI",
                  style: Theme.of(context).textTheme.headline2.apply(color: Colors.pink)),
              SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  child: Text("TEKRAR DENE", style: Theme.of(context).textTheme.headline6),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
