import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpinKit Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              SpinKitSpinningCircle(
                shape: BoxShape.circle,
                duration: Duration(milliseconds: 2200),
                size: 200.0,
                itemBuilder: (context, index) {
                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/img.png"),
                    child: null,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
