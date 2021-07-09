import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Stopwatch clock;
  late Timer timer;
  late Duration duration;
  initState(){
    duration = Duration();
    super.initState();
  }

  onStart(){
      setState(() {
        clock = Stopwatch();
        timer = Timer.periodic(Duration(milliseconds: 1),onTimeout);
        clock.start();
      });
  }
  onTimeout(Timer timer){
    if (!clock.isRunning) return;
    setState(() {
      duration = clock.elapsed;
    });
  }
  onStop(){
    clock.stop();
    timer.cancel();
  }
  onReset(){
    setState(() {
        clock.stop();
        timer.cancel();
          duration = Duration();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Stopwatch'),centerTitle: true,),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        duration.toString(),
                        style: TextStyle(fontSize: 40),
                      ))),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 50,width: 100,child: ElevatedButton(onPressed: onStart, child: Text('Start'))),
                          SizedBox(
                            width: 30,
                          ),
                          Container(height: 50,width: 100,child: ElevatedButton(onPressed: onStop, child: Text('Stop')))
                        ],
                      ),
                      SizedBox(height: 30,),
                      Container(height: 50,width: 100,child: ElevatedButton(onPressed: onReset, child: Text('Reset')))
                    ],
                  )),
            ],
          ),
        ));
  }
}
