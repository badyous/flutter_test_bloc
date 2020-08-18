import 'package:flutter/material.dart';
import 'package:undercover/screens/gameList.dart';

class GameScreen extends StatelessWidget {
  final int userNumber;
  final int undercoverNumber;
  final int civilNumber;
  final double cardWidth = 100.0;
  final double cardHeight = 150.0;

  GameScreen(this.userNumber, this.undercoverNumber, this.civilNumber,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('user number : $userNumber');
    print('undercover number : $undercoverNumber');
    print('civil number : $civilNumber');
    return Container(
      color: Colors.white,
      child: Center(
        child: Wrap(
          children: <Widget>[
            SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: CardWidget(),
            ),
            SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
            ),
            SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
            ),
            SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: InkWell(
          enableFeedback: true,
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => GameList()));
          },
          child: Container(
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Click here',
                  style: TextStyle(color: Colors.white),
                )),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          ),
        ),
      ),
    );
  }
}
