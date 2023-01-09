import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'circle.dart';

void main() {
  runApp( App());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Toss App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var randome = 0;
  final int head = 1;
  final int tale = 0;
  final int middle = 0;
  bool start = false;

  void randemNo() {
    start = true;
    var rng = Random();
    randome = rng.nextInt(3);
    print(randome);
    setState(() {});
  }

  void audioplay() {
    final player = AudioPlayer();
    player.play(AssetSource('coin_sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ? Image.network(
            //     "https://media2.giphy.com/media/C4omPTb1RZBuMtKx4N/giphy.gif?cid=ecf05e47x904o3m7e0j3gbyxz5jznyn0v0d4opa9gngpv3xc&rid=giphy.gif&ct=g")
            // : Container(),
            const Text(
              'Lets Toss',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 50,
            ),
            // Text(
            //   '$randome',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            start ? CircularProgressIndicator() : Container(),
            if (start == false)
              if (randome == 1)
                Card(
                    shadowColor: Colors.grey.shade200,
                    elevation: 20,
                    child: Text(
                      "Head",
                      style: Theme.of(context).textTheme.headline2,
                    ))
              else if (randome == 2)
                Card(
                    shadowColor: Colors.grey.shade200,
                    elevation: 20,
                    child: Text(
                      "Tale",
                      style: Theme.of(context).textTheme.headline2,
                    ))
              else
                Card(
                    shadowColor: Colors.grey.shade200,
                    elevation: 20,
                    child: Text(
                      "Center",
                      style: Theme.of(context).textTheme.headline2,
                    ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final assetsAudioPlayer = AssetsAudioPlayer();
          // assetsAudioPlayer.open(
          //   Audio("assets/coin_sound.mp3"),
          // );

// If file located in assets folder like assets/sounds/note01.wave"
          randemNo();
          audioplay();
          Future.delayed(Duration(seconds: 1), () {
            start = false;
            setState(() {});
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
