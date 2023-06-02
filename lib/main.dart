// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterDownApp(),
    );
  }
}

class CounterDownApp extends StatefulWidget {
  const CounterDownApp({Key? key}) : super(key: key);

  @override
  State<CounterDownApp> createState() => _CounterDownAppState();
}

class _CounterDownAppState extends State<CounterDownApp> {
  int numberOfSeconds = 10;
  Timer? repeatedFunction;

  startTimer() {
    repeatedFunction = Timer.periodic(Duration(seconds: 1), (qqqqqq) {
      setState(() {
        if (numberOfSeconds > 0) {
          numberOfSeconds--;
        } else {
          qqqqqq.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(186, 235, 235, 0.8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (numberOfSeconds > 0)
                ? numberOfSeconds.toString().padLeft(2, "0")
                : "👌",
            style: (numberOfSeconds > 0)
                ? TextStyle(fontSize: 80, color: Colors.white)
                : TextStyle(fontSize: 55, color: Colors.white),
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            "seconds",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          SizedBox(
            height: 33,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  startTimer();
                  if (numberOfSeconds == 0) {
                    setState(() {
                      numberOfSeconds = 10;
                    });
                  }
                },
                child: Text(
                  "START TIMER",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(235, 186, 235, 0.8)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
              ),
              SizedBox(
                width: 22,
              ),
              ElevatedButton(
                onPressed: () {
                  repeatedFunction!.cancel();
                },
                child: Text(
                  "STOP TIMER",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(235, 235, 186, 0.8)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
