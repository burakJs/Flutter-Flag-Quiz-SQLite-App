import 'dart:collection';

import 'package:bayrak_quiz_uygulamasi/Bayraklar.dart';
import 'package:bayrak_quiz_uygulamasi/Bayraklardao.dart';
import 'package:bayrak_quiz_uygulamasi/SonucEkrani.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {
  @override
  _QuizEkraniState createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  var sorular = List<Bayraklar>();
  var yanlisSecenekler = List<Bayraklar>();
  Bayraklar dogruSoru;
  var tumSecenekler = HashSet<Bayraklar>();

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;

  String bayrakResimAdi = "placeholder.png";
  String butonAYazi = "";
  String butonBYazi = "";
  String butonCYazi = "";
  String butonDYazi = "";

  @override
  void initState() {
    super.initState();
    sorulariAl();
  }

  Future<void> sorulariAl() async {
    sorular = await Bayraklardao().rasgele5Getir();
    soruYukle();
  }

  Future<void> soruYukle() async {
    dogruSoru = sorular[soruSayac];

    bayrakResimAdi = dogruSoru.bayrak_resim;

    yanlisSecenekler = await Bayraklardao().rasgele3YanlisGetir(dogruSoru.bayrak_id);

    tumSecenekler.clear();

    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    butonAYazi = tumSecenekler.elementAt(0).bayrak_ad;
    butonBYazi = tumSecenekler.elementAt(1).bayrak_ad;
    butonCYazi = tumSecenekler.elementAt(2).bayrak_ad;
    butonDYazi = tumSecenekler.elementAt(3).bayrak_ad;

    setState(() {});
  }

  void soruSayacKontrol() {
    soruSayac += 1;
    if (soruSayac != 5) {
      soruYukle();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SonucEkrani(
            dogruSayisi: dogruSayac,
          ),
        ),
      );
    }
  }

  void dogruKontrol(String butonYazi) {
    if (dogruSoru.bayrak_ad == butonYazi) {
      dogruSayac += 1;
    } else {
      yanlisSayac += 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz Ekrani"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Doğru : $dogruSayac", style: Theme.of(context).textTheme.headline5),
                  Text("Yanlış : $yanlisSayac", style: Theme.of(context).textTheme.headline5),
                ],
              ),
              soruSayac != 5
                  ? Text("${soruSayac + 1}. Soru", style: Theme.of(context).textTheme.headline3)
                  : Text("5. Soru", style: Theme.of(context).textTheme.headline3),
              Image.asset("resimler/$bayrakResimAdi"),
              SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  child: Text(butonAYazi, style: Theme.of(context).textTheme.headline6),
                  onPressed: () {
                    dogruKontrol(butonAYazi);
                    soruSayacKontrol();
                  },
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  child: Text(butonBYazi, style: Theme.of(context).textTheme.headline6),
                  onPressed: () {
                    dogruKontrol(butonBYazi);
                    soruSayacKontrol();
                  },
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  child: Text(butonCYazi, style: Theme.of(context).textTheme.headline6),
                  onPressed: () {
                    dogruKontrol(butonCYazi);
                    soruSayacKontrol();
                  },
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  child: Text(butonDYazi, style: Theme.of(context).textTheme.headline6),
                  onPressed: () {
                    dogruKontrol(butonDYazi);
                    soruSayacKontrol();
                  },
                ),
              ),
            ],
          ),
        ));
  }

  SizedBox cevapButon(BuildContext context, String yazi) {
    return SizedBox(
      width: 200,
      height: 50,
      child: RaisedButton(
        child: Text(yazi, style: Theme.of(context).textTheme.headline6),
        onPressed: () {
          dogruKontrol(yazi);
          soruSayacKontrol();
        },
      ),
    );
  }
}
