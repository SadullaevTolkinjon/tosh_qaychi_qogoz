import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class Dondonziki extends StatefulWidget {
  @override
  State<Dondonziki> createState() => _DondonzikiState();
}

class _DondonzikiState extends State<Dondonziki> {
  List ls1 = ["Tosh", "Qaychi", "Qogoz"];
  String man = "";
  String noone = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, mainAxisExtent: 820.0),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          "$noone",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  color: Colors.redAccent,
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 50.0),
                              child: Text(
                                "$man",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 190.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    man = ls1[0];
                                    randomname();
                                    finder();
                                  });
                                },
                                child: Text("Tosh")),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    man = ls1[1];
                                    randomname();
                                    finder();
                                  });
                                },
                                child: Text("Qaychi")),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  man = ls1[2];
                                  randomname();
                                  finder();
                                });
                              },
                              child: Text("Qog'oz"),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    man = "";
                                    noone = "";
                                  });
                                },
                                child: Text("remove")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: 1,
      ),
    );
  }

  randomname() {
    for (var i = 0; i < ls1.length; i += 1) {
      noone = ls1[Random().nextInt(ls1.length)];
    }
  }

  finder() {
    if (man == noone) {
      showDrawDialog();
    } else if (man == ls1[0] && noone == ls1[1]) {
      showMyWinDialog();
    } else if (man == ls1[1] && noone == ls1[0]) {
      showBotWinDialog();
    } else if (man == ls1[1] && noone == ls1[2]) {
      showMyWinDialog();
    } else if (man == ls1[2] && noone == ls1[1]) {
      showBotWinDialog();
    } else if (man == ls1[2] && noone == ls1[0]) {
      showMyWinDialog();
    } else if (man == ls1[0] && noone == ls1[2]) {
      showBotWinDialog();
    }
  }

  showMyWinDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: Duration(seconds: 2),
        dismissDirection: DismissDirection.down,
        content: Text("Conguratulation! siz yyutdingiz"),
      ),
    );
  }

  showBotWinDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: Duration(seconds: 2),
        dismissDirection: DismissDirection.down,
        content: Text("Afsuski Bot yutdi"),
      ),
    );
  }

  showDrawDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        dismissDirection: DismissDirection.down,
        content: Text("Durrang"),
      ),
    );
  }
}
