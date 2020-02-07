import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newapp/CAlert.dart';
import 'package:newapp/gridTile.dart';

class MyGame extends StatefulWidget {
  bool doubleP;
  MyGame(this.doubleP);
  @override
  _MyGameState createState() => _MyGameState(doubleP);
}

class _MyGameState extends State<MyGame> {
   bool doubleP;
   _MyGameState(this.doubleP);

  List<BoardButton> boardButton;
  var player1;
  var player2;
  var activePlayer;

  List<BoardButton> createList() {
    activePlayer = 1;
    player1 = List();
    player2 = List();
    List<BoardButton> button = <BoardButton>[
      BoardButton(id: 1),
      BoardButton(id: 2),
      BoardButton(id: 3),
      BoardButton(id: 4),
      BoardButton(id: 5),
      BoardButton(id: 6),
      BoardButton(id: 7),
      BoardButton(id: 8),
      BoardButton(id: 9),
    ];
    return button;
  }

  tapped(BoardButton bb,[bool doubleP=false]) {
    setState(() {
      if (activePlayer == 1) {
        bb.text = 'X';
        bb.bg = Colors.red;
        activePlayer = 2;
        player1.add(bb.id);
      } else {
        bb.text = 'O';
        bb.bg = Colors.teal;
        activePlayer = 1;
        player2.add(bb.id);
      }
      bb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (boardButton.every((p) => p.text != ''))
          showDialog(
              context: context,
              builder: (_) => CustomAlert(
                  'Game Draw', 'Press reset to re start the game', resetGame));
        else if(!doubleP){
          print(doubleP);
           activePlayer ==2 ? autoPlay():null;
         }
      }
    });
  }

  void autoPlay(){
    var emptyCells =List();
    var list = List.generate(9, (i)=>i+1);

    for (var buttonID in list) {
      if(!(player1.contains(buttonID) || player2.contains(buttonID)))
        emptyCells.add(buttonID); 
    }

    var i = Random();
    var index = i.nextInt(emptyCells.length -1);
    var cellID = emptyCells[index];
    var indx =boardButton.indexWhere((p)=> p.id == cellID);
    tapped(boardButton[indx]);


  }

  int checkWinner() {
    var winner = -1;

    if (player1.contains(1) && player1.contains(2) && player1.contains(3))
      winner = 1;
    if (player1.contains(4) && player1.contains(5) && player1.contains(6))
      winner = 1;
    if (player1.contains(7) && player1.contains(8) && player1.contains(9))
      winner = 1;
    if (player1.contains(1) && player1.contains(4) && player1.contains(7))
      winner = 1;
    if (player1.contains(2) && player1.contains(5) && player1.contains(8))
      winner = 1;
    if (player1.contains(3) && player1.contains(6) && player1.contains(9))
      winner = 1;
    if (player1.contains(1) && player1.contains(5) && player1.contains(9))
      winner = 1;
    if (player1.contains(3) && player1.contains(5) && player1.contains(7))
      winner = 1;

    if (player2.contains(1) && player2.contains(2) && player2.contains(3))
      winner = 2;
    if (player2.contains(4) && player2.contains(5) && player2.contains(6))
      winner = 2;
    if (player2.contains(7) && player2.contains(8) && player2.contains(9))
      winner = 2;
    if (player2.contains(1) && player2.contains(4) && player2.contains(7))
      winner = 2;
    if (player2.contains(2) && player2.contains(5) && player2.contains(8))
      winner = 2;
    if (player2.contains(3) && player2.contains(6) && player2.contains(9))
      winner = 2;
    if (player2.contains(1) && player2.contains(5) && player2.contains(9))
      winner = 2;
    if (player2.contains(3) && player2.contains(5) && player2.contains(7))
      winner = 2;

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => CustomAlert(
                'Player1 won', 'Press reset to re start the game', resetGame));
      } else {
        showDialog(
            context: context,
            builder: (_) => CustomAlert(
                'Player2 won', 'Press reset to re start the game', resetGame));
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      boardButton = createList();
    });
  }

  @override
  void initState() {
    super.initState();
    boardButton = createList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TIC TAC TOE')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 9,
                    crossAxisSpacing: 9,
                  ),
                  itemCount: boardButton.length,
                  itemBuilder: (context, i) => SizedBox(
                      height: 100,
                      width: 100,
                      child: RaisedButton(
                        color: boardButton[i].bg,
                        disabledColor: boardButton[i].bg,
                        padding: EdgeInsets.all(8.0),
                        onPressed: boardButton[i].enabled
                            ? () => tapped(boardButton[i],doubleP)
                            : null,
                        child: Text(
                          boardButton[i].text,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      )),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () => resetGame(),
              child: Text(
                'Reset',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
              padding: EdgeInsets.all(20.0),
            )
          ],
        ));
  }
}
