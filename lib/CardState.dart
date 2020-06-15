import 'package:cradrender/Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardLayout extends StatefulWidget {
  final CardProp card;
  CardLayout({Key key, this.card}) : super(key: key);
  @override
  _CardLayoutState createState() => _CardLayoutState();
}

class _CardLayoutState extends State<CardLayout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${widget.card.value}',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.red,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Align(
                  alignment: Alignment.center,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (_, index) =>
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Image.asset(
                                "images/${widget.card.suit}.png",
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      itemCount: widget.card.value,
                    )),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                  '${widget.card.value}',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.red,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
