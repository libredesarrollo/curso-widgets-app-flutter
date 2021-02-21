import 'package:flutter/material.dart';
import 'package:rest_flutter/models/match_card.dart';

class CardPage extends StatefulWidget {
  static const String ROUTE = '/dcard';

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage>
    with SingleTickerProviderStateMixin {
  List<Widget> cardList;
  bool _accepted = false;
  bool _inDT1 = false;
  bool _inDT2 = false;

  AnimationController _animationController;
  Animation<double> _animationCardOpacity;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _animationCardOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(curve: Curves.linear, parent: _animationController));

    _getMatchCard();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();

    return Scaffold(
        body: Stack(children: [
      AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: _inDT1 ? 60 : 50,
        height: double.infinity,
        color: Color.fromARGB(_inDT1 ? 200 : 150, 0, 0, 0),
        child: DragTarget<String>(
          onMove: (_) {
            setState(() {
              _inDT1 = true;
            });
          },
          onLeave: (_) {
            setState(() {
              _inDT1 = false;
            });
          },
          onWillAccept: (data) {
            print("onWillAccept $data");
            return true;
          },
          onAccept: (data) {
            print("onAccept $data");
            _processResponse();
          },
          builder: (_, candidateData, rejectData) {
            return Center(
                child: Text(
              "Si",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ));
          },
        ),
      ),
      Align(
          alignment: Alignment.center,
          child: FadeTransition(
              opacity: _animationCardOpacity,
              child: cardList.length > 0 ? cardList[0] : Container())),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          width: _inDT2 ? 60 : 50,
          height: double.infinity,
          color: Color.fromARGB(_inDT2 ? 200 : 150, 0, 0, 0),
          child: DragTarget<String>(
            onMove: (_) {
              setState(() {
                _inDT2 = true;
              });
            },
            onLeave: (_) {
              setState(() {
                _inDT2 = false;
              });
            },
            onWillAccept: (data) {
              print("onWillAccept $data");
              return true;
            },
            onAccept: (data) {
              print("onAccept $data");
              _processResponse();
            },
            builder: (_, candidateData, rejectData) {
              return Center(
                  child: Text(
                "No",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ));
            },
          ),
        ),
      ),
      _finished(),
    ]));

    /*
      Container(
        child: Draggable(
          //data: "Flutter",
          child: FlutterLogo(),
          feedback: FlutterLogo(),
          childWhenDragging: Container(),
        ),
      ),
    );*/
  }

  List<Widget> _getMatchCard() {
    List<MatchCard> cards = List();
    cards.add(MatchCard(255, 0, 0));
    cards.add(MatchCard(0, 255, 0));
    cards.add(MatchCard(0, 0, 255));
    cards.add(MatchCard(255, 0, 0));
    cards.add(MatchCard(0, 255, 0));
    cards.add(MatchCard(0, 0, 255));
    cards.add(MatchCard(255, 0, 0));
    cards.add(MatchCard(0, 255, 0));
    cards.add(MatchCard(0, 0, 255));

    cardList = List();

    for (int i = 0; i < cards.length; i++) {
      cardList.add(Draggable<String>(
        axis: Axis.horizontal,
        data: "Carta $i",
        child: _buildCard(cards, i, 255),
        feedback: _buildCard(cards, i, 150),
        childWhenDragging: Container(),
        onDragEnd: (_) {
          //_removeCard();
        },
      ));
    }

    return cardList;
  }

  Card _buildCard(List<MatchCard> cards, int i, int a) {
    return Card(
      color: Color.fromARGB(
          a, cards[i].redColor, cards[i].greenColor, cards[i].blueColor),
      elevation: 12,
      child: Container(
        width: 240,
        height: 300,
      ),
    );
  }

  _removeCard() => cardList.removeAt(0);

  Widget _finished() {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: Center(
            child: Text(
          "Exito",
          overflow: TextOverflow.fade,
          softWrap: false,
          style: TextStyle(color: Colors.white, fontSize: 60),
        )),
        width: _accepted ? 300 : 0,
        height: _accepted ? 300 : 0,
        decoration: BoxDecoration(
            color: Color.fromARGB(150, 0, 0, 0), shape: BoxShape.circle),
      ),
    );
  }

  void _processResponse() {
    setState(() {
      _removeCard();
      _accepted = true;

      _animationController.reset();
      _animationController.forward();
    });

    Future.delayed(Duration(milliseconds: 350), () {
      setState(() {
        _accepted = false;
      });
    });
  }
}
